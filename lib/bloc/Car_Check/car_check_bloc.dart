import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
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
            checkLoad: 0,
            isLoading: false,
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
    });

    on<AddItem_Bloc>((event, emit) async {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? tokenAuth = prefs.getString('userToken');

      if (state.typeCheckState == 'extCheckupList') {
        ExtCheckupList_Item.addItem1(
            sysVehicleChecklistId: int.parse(
                state.fetched_checkList1[state.countIndexCheck].id.toString()),
            list: state.fetched_checkList1[state.countIndexCheck].name,
            result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
            order: 1);
      } else if (state.typeCheckState == 'extCheckupEquipment') {
        ExtCheckupEquipment_Item.addItem2(
            sysVehicleEquipmentId: int.parse(
                state.fetched_checkList1[state.countIndexCheck].id.toString()),
            list: state.fetched_checkList1[state.countIndexCheck].name,
            result: (state.indexButtonSelect == 0) ? 'ปกติ' : 'ไม่ปกติ',
            order: 1);
      } else {
        ExtCheckupSafety_Item.addItem3(
            sysVehicleSafetyListId: int.parse(
                state.fetched_checkList1[state.countIndexCheck].id.toString()),
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
          indexButtonSelect: 0));
    });

    on<Submit_AllCheckings>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        Map<String, dynamic> checkingJsonData = {
          "checkupCarId": 1,
          "registeredCarId": 1,
          "registeredDriverId": 1,
          "checkupResult": state.storedExtCheckupList1,
          "equipmentResult": state.storedExtCheckupEquipment2,
          "safetyResult": state.storedExtCheckupSafety3,
        };

        final response = await dio.post(api_url_v1 + "checkup-car",
            options: Options(
              headers: {
                "Authorization": "Bearer $tokenAuth",
              },
            ),
            data: checkingJsonData);
        var x = response.data['data'];
        if (response.statusCode == 200) {
          print(
              '--------------------SEND CHECKINGS: OK----------------------------------');
          ExtCheckupList_Item.checklist.clear();
          ExtCheckupEquipment_Item.checklistEquipment.clear();
          ExtCheckupSafety_Item.checklistExtCheckupSafety_Item.clear();
          emit(state.copyWith(
              storedExtCheckupList1: [],
              storedExtCheckupEquipment2: [],
              storedExtCheckupSafety3: [],
              typeCheckState: '',
              countIndexCheck: 0,
              toCheckChecklist1: 0));
        } else {
          print('error');

          print(x.toString());
        }
      } catch (e) {
        print(e);
      }
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

    on<AddItem_Bloc2>((event, emit) async {
      emit(state.copyWith(isLoading: true));

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
            isLoading: false));
      } else {
        String imgType;
        if (state.typeCheckState == 'extCheckupList') {
          imgType = 'checkupListImage';
        } else if (state.typeCheckState == 'extCheckupEquipment') {
          imgType = 'checkupEquipmentImage';
        } else {
          imgType = 'checkupSafetyListImage';
        }
        print(event.fileImage!.path);
        String fileName = event.fileImage!.path.split('/').last;
        //!-------------------------------------------------------------------------------------------
        final formData;
        formData = FormData.fromMap({
          "type": "image",
          "collection": "true",
          "files[${imgType}][]": await MultipartFile.fromFile(
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
            isLoading: false));
      }

      //?--------------------------------------+++++-----------------+++++-----------------+++++-----------------+++++
    });
  }
}
