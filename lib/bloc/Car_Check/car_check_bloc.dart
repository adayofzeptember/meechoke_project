import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/ETC/success_dialog.dart';
import 'package:meechoke_project/bloc/Car_Check/model.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupEquipment_addMethod.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupList_addMethod.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/ExtCheckupSafety_addMethod.dart';
import 'package:meechoke_project/screens/Checking/CheckMethod/filenames.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'car_check_event.dart';
part 'car_check_state.dart';

class CarCheckBloc extends Bloc<CarCheckEvent, CarCheckState> {
  final dio = Dio();
  CarCheckBloc()
      : super(CarCheckState(
            checkEmpty: '',
            remainingTime: Duration.zero,
            checkLoad: 0,
            isLoading: false,
            storedExtCheckupList1: [],
            twty4Check: false,
            storedExtCheckupEquipment2: [],
            storedExtCheckupSafety3: [],
            toCheckChecklist1: 0,
            checkLoadItems: false,
            fetched_checkList1: [],
            typeCheckState: '',
            countIndexCheck: 0,
            indexButtonSelect: 0)) {
    on<Count_PlusIndex>((event, emit) async {
      if (state.countIndexCheck >= state.fetched_checkList1.length - 1) {
        emit(state.copyWith(
            countIndexCheck: state.countIndexCheck + 0, toCheckChecklist1: 1));
      } else {
        emit(state.copyWith(countIndexCheck: state.countIndexCheck + 1));
      }
    });

    on<Swap_Index_forButtones>((event, emit) async {
      emit(state.copyWith(indexButtonSelect: event.getIndex));
    });

    on<Empty_Check>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        final response = await dio.get(
          api_url_v1 + "checkup-car",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        if (response.statusCode == 200) {
          if (response.data['data'].isEmpty) {
            emit(state.copyWith(checkEmpty: 'empty'));
          } else {
            emit(state.copyWith(checkEmpty: 'not empty'));
          }
        } else {
          print('error status != 200');
        }
      } catch (e) {}
    });

    on<Daily_Check>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      // print(prefs.get('registeredDriverId'));
      // print(prefs.get('registeredCarId'));
      try {
        final response = await dio.get(
          api_url_v1 +
              "checkup-car-log?registeredDriverId=${1}&registeredCarId=${1}",
          // api_url_v1 +
          //     "checkup-car-log?registeredDriverId=${prefs.get('registeredDriverId')}&registeredCarId=${prefs.get('registeredCarId')}",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        if (response.statusCode == 200) {
          if (response.data['data'] == null) {
            emit(state.copyWith(twty4Check: false));
          } else {
            emit(state.copyWith(twty4Check: true));
          }
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });

    //

    on<Load_CheckList>((event, emit) async {
      String sysVehicleType;
      if (event.getCheckType == 'extCheckupList') {
        sysVehicleType = 'sysVehicleChecklist';
      } else if (event.getCheckType == 'extCheckupEquipment') {
        sysVehicleType = 'sysVehicleEquipment';
      } else {
        sysVehicleType = 'sysVehicleSafetyList';
      }
      emit(state.copyWith(
          typeCheckState: event.getCheckType,
          countIndexCheck: 0,
          checkLoadItems: true,
          toCheckChecklist1: 0));

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
        // print(response.data['data'][0]['extCheckupList'][0]['sysVehicleChecklist']['name'].toString());

        List<ExtCheckupList> dataExtCheckupList = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            List<dynamic> extCheckupList = elements[event.getCheckType];
            for (var extCheckupListLoop in extCheckupList) {
              // print(extCheckupListLoop['sysVehicleChecklist']['name']);
              // print(extCheckupListLoop['sysVehicleChecklistId']['name']);
              dataExtCheckupList.add(ExtCheckupList(
                  id: extCheckupListLoop[sysVehicleType.toString()]['id']
                      .toString(),
                  name: extCheckupListLoop[sysVehicleType.toString()]['name']
                      .toString()));
            }
          }
          // print('--------' + dataExtCheckupList[2].name.toString());
          emit(state.copyWith(
              fetched_checkList1: dataExtCheckupList, checkLoadItems: false));
          print('done load');
        } else {
          emit(state.copyWith(checkLoadItems: false));

          print('error status != 200');
        }
      } catch (e) {
        emit(state.copyWith(checkLoadItems: false));

        print(e);
      }
    });

    on<Test_Employee>((event, emit) async {
      String sysVehicleType;
      if (event.getCheckType == 'extCheckupList') {
        sysVehicleType = 'sysVehicleChecklist';
      } else if (event.getCheckType == 'extCheckupEquipment') {
        sysVehicleType = 'sysVehicleEquipment';
      } else {
        sysVehicleType = 'sysVehicleSafetyList';
      }
      emit(state.copyWith(
          typeCheckState: event.getCheckType,
          countIndexCheck: 0,
          checkLoadItems: true,
          toCheckChecklist1: 0));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        emit(state.copyWith(isLoading: true));
        final response = await dio.get(
          api_url_v1 + "monthly-car-checkup-list?hasChecked=false",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        dynamic nestedData = response.data['data']['content'][event.getIndex]
            ['checklist'][event.getCheckType];
        List<ExtCheckupList> dataExtCheckupList = [];

        if (response.statusCode == 200) {
          for (var elements in nestedData) {
            dataExtCheckupList.add(ExtCheckupList(
                id: elements['${sysVehicleType}']['id'].toString(),
                name: elements['${sysVehicleType}']['name'].toString()));
          }

          emit(state.copyWith(
              fetched_checkList1: dataExtCheckupList, checkLoadItems: false));
        } else {
          print('error status != 200');
          emit(state.copyWith(checkLoadItems: false));
        }
      } catch (e) {
        emit(state.copyWith(checkLoadItems: false));

        print(e);
      }
    });

    //!-----------------------------------------------------------------

    on<AddEachItem_Bloc>((event, emit) async {
      //* เพิ่มทีละอย่าง
      emit(state.copyWith(checkLoadItems: true));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      if (event.fileImage?.path == null || event.fileImage?.path == 'null') {
        print('-no img-');
        if (state.typeCheckState == 'extCheckupList') {
          ExtCheckupList_Item.addItem1(
              sysVehicleChecklistId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              order: 1);
        } else if (state.typeCheckState == 'extCheckupEquipment') {
          ExtCheckupEquipment_Item.addItem2(
              sysVehicleEquipmentId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              order: 1);
        } else {
          ExtCheckupSafety_Item.addItem3(
              sysVehicleSafetyListId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              order: 1);
        }
        emit(state.copyWith(
            countIndexCheck:
                (state.countIndexCheck >= state.fetched_checkList1.length - 1)
                    ? state.countIndexCheck + 0
                    : state.countIndexCheck + 1,
            toCheckChecklist1:
                (state.countIndexCheck >= state.fetched_checkList1.length - 1)
                    ? 1
                    : state.toCheckChecklist1,
            indexButtonSelect: 0,
            checkLoadItems: false));
      } else {
        //? มีรูป
        String imgType;
        if (state.typeCheckState == 'extCheckupList') {
          imgType = 'checkListImage';
        } else if (state.typeCheckState == 'extCheckupEquipment') {
          imgType = 'checkEquipmentImage';
        } else {
          imgType = 'checkupSafetyList';
        }
        print(event.fileImage!.path);
        String fileName = event.fileImage!.path.split('/').last;
        //!-------------------------------------------------------------------------------------------
        final formData;
        formData = FormData.fromMap({
          "type": "image",
          "collection": "true",
          "files[${imgType}][${1}]": await MultipartFile.fromFile(
              event.fileImage!.path,
              filename: "${fileName}")
        });

        final response = await dio.post(api_url + "uploads",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! <= 500;
              },
              contentType: Headers.formUrlEncodedContentType,
              responseType: ResponseType.json,
            ),
            data: formData);

        var imgUploadResponse = response.data['data'];
        print('--' + imgUploadResponse.toString());

        Map<String, List<FileInformation>> filenames = {};
        imgUploadResponse.forEach((key, value) {
          filenames[key] = (value as List)
              .map((item) => FileInformation.fromJson(item))
              .toList();
        });

        if (state.typeCheckState == 'extCheckupList') {
          ExtCheckupList_Item.addItem1(
              sysVehicleChecklistId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              filenames: filenames,
              order: 1);
        } else if (state.typeCheckState == 'extCheckupEquipment') {
          ExtCheckupEquipment_Item.addItem2(
              sysVehicleEquipmentId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              filenames: filenames,
              order: 1);
        } else {
          ExtCheckupSafety_Item.addItem3(
              sysVehicleSafetyListId: int.parse(state
                  .fetched_checkList1[state.countIndexCheck].id
                  .toString()),
              filenames: filenames,
              list: state.fetched_checkList1[state.countIndexCheck].name,
              result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
              order: 1);
        }
        emit(state.copyWith(
            countIndexCheck:
                (state.countIndexCheck >= state.fetched_checkList1.length - 1)
                    ? state.countIndexCheck + 0
                    : state.countIndexCheck + 1,
            toCheckChecklist1:
                (state.countIndexCheck >= state.fetched_checkList1.length - 1)
                    ? 1
                    : state.toCheckChecklist1,
            indexButtonSelect: 0,
            checkLoadItems: false));
      }
    });

    on<CheckupList_BlocAdd>((event, emit) async {
      //* ตอนเช็คหมด หน้าสรุป
      // emit(state.copyWith(storedExtCheckupList1: event.getExtCheckup_List));
      // print('from bloc1....' + jsonEncode(state.storedExtCheckupList1));
      if (event.getTypeCheckToStore == 'extCheckupList') {
        emit(state.copyWith(storedExtCheckupList1: event.getExtCheckup_List));
        print(
            '----------------------CheckupList1-----------------------------');
        print(jsonEncode(state.storedExtCheckupList1));
        print('-------------------------------------------------------------');
      } else if (event.getTypeCheckToStore == 'extCheckupEquipment') {
        emit(state.copyWith(
            storedExtCheckupEquipment2: event.getExtEqipment_List));
        print(
            '----------------------CheckupEquipment-----------------------------');
        print(jsonEncode(state.storedExtCheckupEquipment2));
        print('-------------------------------------------------------------');
      } else {
        emit(state.copyWith(storedExtCheckupSafety3: event.getExtSafety_List));
        print(
            '----------------------CheckupSafety3-----------------------------');
        print(jsonEncode(state.storedExtCheckupSafety3));
        print('-------------------------------------------------------------');
      }
    });

    on<Submit_AllCheckings>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        Map<String, dynamic> checkingJsonData;
        if (prefs.getString('loginType').toString() == 'employee') {
          print('employee sends ');
          checkingJsonData = {
            "checkupCarId": event.getCheckupID,
            //* registered driver
            "registeredCarId": event.getCarID,
            "registeredDriverId": event.getDriverID,
            "checkupResult": state.storedExtCheckupList1,
            "equipmentResult": state.storedExtCheckupEquipment2,
            "safetyResult": state.storedExtCheckupSafety3,
          };
        } else {
          print('register driver sends');
          checkingJsonData = {
            "checkupCarId": 1,
            //* registered driver
            "registeredCarId": prefs.getString('registeredCarId'),
            "registeredDriverId": prefs.getString('registeredDriverId'),
            "checkupResult": state.storedExtCheckupList1,
            "equipmentResult": state.storedExtCheckupEquipment2,

            "safetyResult": state.storedExtCheckupSafety3,
          };
        }

        final response = await dio.post(api_url_v1 + "checkup-car",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: checkingJsonData);
        var x = response.data['data'];

        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));
          print(
              '--------------------SEND CHECKINGS: OK----------------------------------');

          ExtCheckupList_Item.checklist.clear();
          ExtCheckupEquipment_Item.checklistEquipment.clear();
          ExtCheckupSafety_Item.checklistExtCheckupSafety_Item.clear();
          SuccessMessage_Dialog(event.context, 'ส่งแบบตรวจเช็คแล้ว', 'เช็ครถ2');
          emit(state.copyWith(
              storedExtCheckupList1: [],
              storedExtCheckupEquipment2: [],
              storedExtCheckupSafety3: [],
              typeCheckState: '',
              countIndexCheck: 0,
              toCheckChecklist1: 0));
        } else {
          emit(state.copyWith(isLoading: false));

          print('xxxxxxx SEND CHECKINGS: ERROR xxxxxxx');

          print(x.toString());
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));

        print(e);
      }
    });
  }
}
