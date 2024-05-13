import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Car_Check/model.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/CheckupResult_Method.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'car_check_event.dart';
part 'car_check_state.dart';

class CarCheckBloc extends Bloc<CarCheckEvent, CarCheckState> {
  final dio = Dio();
  CarCheckBloc()
      : super(CarCheckState(
            storedChecklist1: [],
            toCheckChecklist1: 0,
            checkList1: [],
            countIndexCheck: 0,
            indexButtonSelect: 0)) {
    on<Load_CheckList>((event, emit) async {
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
            List<dynamic> extCheckupList = elements['extCheckupList'];
            for (var extCheckupListLoop in extCheckupList) {
              dataExtCheckupList.add(ExtCheckupList(
                  id: extCheckupListLoop['sysVehicleChecklistId']['id']
                      .toString(),
                  name: extCheckupListLoop['sysVehicleChecklistId']['name']
                      .toString()));
            }
          }
          // print('--------' + dataExtCheckupList[2].name.toString());
          emit(state.copyWith(checkList1: dataExtCheckupList));
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });

    on<Count_PlusIndex>((event, emit) async {
      if (event.method == "+") {
        if (state.countIndexCheck >= state.checkList1.length - 1) {
          emit(state.copyWith(
              countIndexCheck: state.countIndexCheck + 0,
              toCheckChecklist1: 1));
        } else {
          emit(state.copyWith(countIndexCheck: state.countIndexCheck + 1));
        }
      } else {
        if (state.countIndexCheck != 0) {
          emit(state.copyWith(countIndexCheck: 0));
        }
      }
    });

    on<StoreCheck1>((event, emit) async {
      emit(state.copyWith(storedChecklist1: event.getCheck1));
      // print('in bloc' + state.storedChecklist1.toString());

      print(jsonEncode(state.storedChecklist1));
      // for (var item in state.storedChecklist1) {
      //   print(item.list); // Print each item
      // }
    });

    on<Swap_Index>((event, emit) async {
      emit(state.copyWith(indexButtonSelect: event.getIndex));
    });
  }
}
