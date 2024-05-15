import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Car_Check/model.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupEquipment_addMethod.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupList_addMethod.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupSafety_addMethod.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'car_check_event.dart';
part 'car_check_state.dart';

class CarCheckBloc extends Bloc<CarCheckEvent, CarCheckState> {
  final dio = Dio();
  CarCheckBloc()
      : super(CarCheckState(
            storedExtCheckupList1: [],
            storedExtCheckupEquipment2: [],
            storedExtCheckupSafety3: [],
            toCheckChecklist1: 0,
            fetched_checkList1: [],
            typeCheckState: '',
            countIndexCheck: 0,
            indexButtonSelect: 0)) {
    on<Load_CheckList>((event, emit) async {
      String x;
      if (event.getCheckType == 'extCheckupList') {
        x = 'sysVehicleChecklistId';
      } else if (event.getCheckType == 'extCheckupEquipment') {
        x = 'sysVehicleEquipmentId';
      } else {
        x = 'sysVehicleSafetyListId';
      }
      emit(state.copyWith(
          typeCheckState: event.getCheckType,
          countIndexCheck: 0,
          toCheckChecklist1: 0));

      print(event.getCheckType.toString() + ' : ' + x.toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        final response = await dio.get(
          api_url_v1 + "checkup-car",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        // var x = response.data['data'];
        // print('x------' + x.toString());

        List<ExtCheckupList> dataExtCheckupList = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            List<dynamic> extCheckupList = elements[event.getCheckType];
            for (var extCheckupListLoop in extCheckupList) {
              dataExtCheckupList.add(ExtCheckupList(
                  id: extCheckupListLoop[x.toString()]['id'].toString(),
                  name: extCheckupListLoop[x.toString()]['name'].toString()));
            }
          }
          // print('--------' + dataExtCheckupList[2].name.toString());
          emit(state.copyWith(fetched_checkList1: dataExtCheckupList));
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });

    on<Count_PlusIndex>((event, emit) async {
      if (state.countIndexCheck >= state.fetched_checkList1.length - 1) {
        emit(state.copyWith(
            countIndexCheck: state.countIndexCheck + 0, toCheckChecklist1: 1));
      } else {
        emit(state.copyWith(countIndexCheck: state.countIndexCheck + 1));
      }

      // if (event.method == "+") {
      //   if (state.countIndexCheck >= state.fetched_checkList1.length - 1) {
      //     emit(state.copyWith(
      //         countIndexCheck: state.countIndexCheck + 0,
      //         toCheckChecklist1: 1));
      //   } else {
      //     emit(state.copyWith(countIndexCheck: state.countIndexCheck + 1));
      //   }
      // } else {
      //   if (state.countIndexCheck != 0) {
      //     emit(state.copyWith(countIndexCheck: 0));
      //   }
      // }
    });

    on<CheckupList_BlocAdd>((event, emit) async {
      // emit(state.copyWith(storedExtCheckupList1: event.getExtCheckup_List));
      // print('from bloc1....' + jsonEncode(state.storedExtCheckupList1));
      if (event.getTypeCheckToStore == 'extCheckupList') {
        emit(state.copyWith(storedExtCheckupList1: event.getExtCheckup_List));
        print('from bloc1....' + jsonEncode(state.storedExtCheckupList1));
      } else if (event.getTypeCheckToStore == 'extCheckupEquipment') {
        emit(state.copyWith(
            storedExtCheckupEquipment2: event.getExtEqipment_List));
        print('from bloc2....' + jsonEncode(state.storedExtCheckupEquipment2));
      } else {
        emit(state.copyWith(storedExtCheckupSafety3: event.getExtSafety_List));
        print('from bloc3....' + jsonEncode(state.storedExtCheckupSafety3));
      }
    });

    on<Swap_Index_forButtones>((event, emit) async {
      emit(state.copyWith(indexButtonSelect: event.getIndex));
    });
  }
}
