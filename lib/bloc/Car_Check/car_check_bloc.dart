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
  CarCheckBloc() : super(CarCheckState(checkList1: [])) {
    on<Load_CheckList2>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        final response = await dio.get(
          api_url_v1 + "checkup-car",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        // var x = response.data['data'][0]['extCheckupList'][1].toString();
        // print('---->' + x);

        var dataChekList = [];
        if (response.statusCode == 200) {
          // List<dynamic> extCheckupEquipment = elements['extCheckupEquipment'];
          // List<dynamic> extCheckupSafetyList =elements['extCheckupSafetyList'];
          //ลูปแรก
          for (var elements in response.data['data']) {
            List<dynamic> extCheckupList = elements['extCheckupList'];
            List<ExtCheckupList> dataExtCheckupList = [];
            for (var extCheckupListLoop in extCheckupList) {
              dataExtCheckupList.add(ExtCheckupList(
                  id: extCheckupListLoop['id'].toString(),
                  name: extCheckupListLoop['sysVehicleChecklistId']['name']
                      .toString()));
            }
            dataChekList.add(Check_List_Data(
                name: elements['employee']['fullName'].toString(),
                checkinList: dataExtCheckupList));
            // print(dataExtCheckupList[0].name);
          }
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });
//!---------------------------------------------------------------------------------
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
          print(dataExtCheckupList.length);
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
