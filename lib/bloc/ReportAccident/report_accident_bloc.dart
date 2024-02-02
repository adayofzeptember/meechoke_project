import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/ReportAccident/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'report_accident_event.dart';
part 'report_accident_state.dart';

class ReportAccidentBloc
    extends Bloc<ReportAccidentEvent, ReportAccidentState> {
  final dio = Dio();
  ReportAccidentBloc()
      : super(ReportAccidentState(
          productIns_Docs: [],
          vehicle_Docs: [],
          page: 1,
          isLoading: true,
        )) {
    on<Load_VehicleDocs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      emit(state.copyWith(isLoading: true));
      try {
        final response = await dio.get(
          api_url_v1 + "get-vehicle-docs?plateNumber=11-1111",
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        var fetched_docs = (state.vehicle_Docs != []) ? state.vehicle_Docs : [];
        var fetched_prdIns =
            (state.productIns_Docs != []) ? state.productIns_Docs : [];
        if (response.statusCode == 200) {
          for (var nested in response.data['data']['act']) {
            fetched_docs.add(
              Vehicle_Docs_Model(
                docType: await nested['docType'].toString(),
                company: await nested['company'].toString(),
                contact: await nested['contact'].toString(),
                creditLimit: await nested['creditLimit'].toString(),
                docNumber: await nested['docNumber'].toString(),
              ),
            );
          }

          for (var nested in response.data['data']['productInsurance']) {
            fetched_prdIns.add(
              Vehicle_Docs_Model(
                docType: await nested['docType'].toString(),
                company: await nested['company'].toString(),
                contact: await nested['contact'].toString(),
                creditLimit: await nested['creditLimit'].toString(),
                docNumber: await nested['docNumber'].toString(),
              ),
            );
          }

          emit(state.copyWith(
              vehicle_Docs: fetched_docs, productIns_Docs: fetched_prdIns));

          print(fetched_docs.length);
        } else {}
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        print('fail try: $e');
      }
    });
  }
}
