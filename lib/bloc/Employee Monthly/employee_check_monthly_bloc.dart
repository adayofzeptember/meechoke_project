import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Car_Check/model.dart';
import 'package:meechoke_project/bloc/Employee%20Monthly/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'employee_check_monthly_event.dart';
part 'employee_check_monthly_state.dart';

class EmployeeCheckMonthlyBloc
    extends Bloc<EmployeeCheckMonthlyEvent, EmployeeCheckMonthlyState> {
  final dio = Dio();
  EmployeeCheckMonthlyBloc()
      : super(EmployeeCheckMonthlyState(
            isLoading: false,
            all_monthly_list: [],
            all_monthly_done: [],
            dateMonth: '')) {
    //*
    on<Load_All_MonthList>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          isLoading: true,
        ));
        final response = await dio.get(
          api_url_v1 + "monthly-car-checkup-list?hasChecked=false",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        var dataMonthly = [];
        if (response.statusCode == 200) {
          emit(state.copyWith(
            isLoading: false,
          ));
          if (response.data['data']['content'].isEmpty) {
          } else {
            // print(response.data['data']['content'][1]['checklist']['id']
            //     .toString());
            for (var elements in response.data['data']['content']) {
              // print((elements['checklist'] == null)
              //     ? 'null id'
              //     : elements['checklist']['id'].toString());
              dataMonthly.add(CheckMonthly_List(
                  checkupId: await (elements['checklist'] == null)
                      ? '-'
                      : elements['checklist']['id'].toString(),
                  registeredDriverId:
                      await elements['registeredDriverId'].toString(),
                  registeredCarId: await elements['registeredCarId'].toString(),
                  name: await elements['registeredDriverFullName'].toString(),
                  primaryPlateNumber:
                      await elements['primaryPlateNumber'].toString(),
                  secondaryPlateNumber:
                      (await elements['secondaryPlateNumber'] == null
                          ? '-'
                          : await elements['secondaryPlateNumber'])));
            }
          }
          emit(state.copyWith(
              all_monthly_list: dataMonthly,
              isLoading: false,
              dateMonth: response.data['data']['month'].toString()));
        } else {
          print('error status != 200');
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });
    //*
    on<Load_Done_MonthList>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          isLoading: true,
        ));
        final response = await dio.get(
          api_url_v1 + "monthly-car-checkup-list?hasChecked=true",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        var dataMontly = [];
        if (response.statusCode == 200) {
          emit(state.copyWith(
            isLoading: false,
          ));
          if (response.data['data']['content'].isEmpty) {
            print('null');
          } else {
            for (var elements in response.data['data']['content']) {
              dataMontly.add(CheckMonthly_List(
                  registeredDriverId:
                      await elements['registeredDriverId'].toString(),
                  registeredCarId: await elements['registeredCarId'].toString(),
                  name: await elements['registeredDriverFullName'].toString(),
                  primaryPlateNumber:
                      await elements['primaryPlateNumber'].toString(),
                  secondaryPlateNumber:
                      (await elements['secondaryPlateNumber'] == null
                          ? '-'
                          : await elements['secondaryPlateNumber'])));
            }
          }
          emit(state.copyWith(
              all_monthly_done: dataMontly,
              isLoading: false,
              dateMonth: response.data['data']['month'].toString()));
        } else {
          print('error status != 200');
          emit(state.copyWith(
            isLoading: false,
          ));
        }
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          isLoading: false,
        ));
      }
    });
    //?
    on<GetCheckList_ByIndex>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        final response = await dio.get(
          api_url_v1 + "monthly-car-checkup-list?hasChecked=false",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        dynamic nestedData = response.data['data']['content'][event.getIndex]
            ['checklist']['extCheckupList'];
        List<ExtCheckupList> dataExtCheckupList = [];

        if (response.statusCode == 200) {
          for (var elements in nestedData) {
            print(elements['sysVehicleChecklist']['name']);
            dataExtCheckupList.add(ExtCheckupList(
                id: elements['sysVehicleChecklist']['id'].toString(),
                name: elements['sysVehicleChecklist']['name'].toString()));
          }

          print(dataExtCheckupList.length);

          // emit(state.copyWith(
          //     all_monthly_done: dataMontly,
          //     isLoading: false,
          //     dateMonth: response.data['data']['month'].toString())

          //     );
        } else {}
      } catch (e) {
        print("Exception Try: $e");
      }
    });
  }
}
