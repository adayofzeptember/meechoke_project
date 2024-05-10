import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Car_Check/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'car_check_event.dart';
part 'car_check_state.dart';

class CarCheckBloc extends Bloc<CarCheckEvent, CarCheckState> {
  final dio = Dio();
  CarCheckBloc()
      : super(CarCheckState(
            test: [],
            checkList1: [],
            countIndexCheck: 0,
            indexButtonSelect: 1)) {
    // on<Load_CheckList2>((event, emit) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? tokenAuth = prefs.getString('userToken');
    //   try {
    //     final response = await dio.get(
    //       api_url_v1 + "checkup-car",
    //       options: Options(headers: {
    //         "Authorization": "Bearer $tokenAuth",
    //       }),
    //     );
    //     // var x = response.data['data'][0]['extCheckupList'][1].toString();
    //     // print('---->' + x);

    //     var dataChekList = [];
    //     if (response.statusCode == 200) {
    //       // List<dynamic> extCheckupEquipment = elements['extCheckupEquipment'];
    //       // List<dynamic> extCheckupSafetyList =elements['extCheckupSafetyList'];
    //       //ลูปแรก
    //       for (var elements in response.data['data']) {
    //         List<dynamic> extCheckupList = elements['extCheckupList'];
    //         List<ExtCheckupList> dataExtCheckupList = [];
    //         for (var extCheckupListLoop in extCheckupList) {
    //           dataExtCheckupList.add(ExtCheckupList(
    //               id: extCheckupListLoop['id'].toString(),
    //               name: extCheckupListLoop['sysVehicleChecklistId']['name']
    //                   .toString()));
    //         }
    //         dataChekList.add(Check_List_Data(
    //             name: elements['employee']['fullName'].toString(),
    //             checkinList: dataExtCheckupList));
    //         // print(dataExtCheckupList[0].name);
    //       }
    //     } else {
    //       print('error status != 200');
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    // });
//?---------------------------------------------------------------------------------
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
                  id: extCheckupListLoop['id'].toString(),
                  name: extCheckupListLoop['sysVehicleChecklistId']['name']
                      .toString()));
            }
          }
          // print('--------' + dataExtCheckupList[2].name.toString());
          emit(state.copyWith(checkList1: dataExtCheckupList));
          print(state.checkList1.length);
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });

    on<TestList>((event, emit) async {
      emit(state.copyWith(test: [...state.test, event.getString]));
      print(state.test.toString());
    });

    on<Count_PlusIndex>((event, emit) async {
      if (event.method == "+") {
        if (state.countIndexCheck >= state.checkList1.length - 1) {
          print('over');
        } else {
          emit(state.copyWith(countIndexCheck: state.countIndexCheck + 1));
        }
      } else {
        if (state.countIndexCheck != 0) {
          emit(state.copyWith(countIndexCheck: state.countIndexCheck - 1));
        }
      }
    });

    on<Swap_Index>((event, emit) async {
      emit(state.copyWith(indexButtonSelect: event.getIndex));

      // if (state.indexButtonSelect == 0) {
      //   emit(state.copyWith(indexButtonSelect: 1));
      // } else if (state.indexButtonSelect == 1) {
      //   emit(state.copyWith(indexButtonSelect: 0));
      // }
      print(state.indexButtonSelect.toString());
    });
  }
}
