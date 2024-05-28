import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Financial/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'financial_event.dart';
part 'financial_state.dart';

class FinancialBloc extends Bloc<FinancialEvent, FinancialState> {
  final dio = Dio();
  FinancialBloc() : super(FinancialState(financial_list: [], status1: 0)) {
    //?
    on<Load_Financial>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        final response = await dio.get(
          api_url_v1 + "transaction-history",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        var data = [];

        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            List<dynamic> dataExpandList = elements['extClearingJob'];
            List<ExtClearingJob> dataExpand = [];
            for (var expandedEXT in dataExpandList) {
              //list ย่อย
              dataExpand.add(ExtClearingJob(
                documentNumber:
                    await expandedEXT['job']['documentNumber'].toString(),
                jobTotal: await expandedEXT['jobTotal'].toString(),
                jobStatus:
                    await expandedEXT['job']['documentStatus'].toString(),
                allowance_total:
                    await expandedEXT['options']['allowanceTotal'].toString(),
                highwayTotal:
                    await expandedEXT['options']['ticketTotal'].toString(),
                advance_total:
                    await expandedEXT['options']['advanceTotal'].toString(),
                sum: int.parse(
                        expandedEXT['options']['allowanceTotal'].toString()) +
                    int.parse(expandedEXT['options']['ticketTotal'].toString()),
              ));
            }
            //list ใหญ่
            data.add(Financial_Model(
                id: await elements['id'].toString(),
                transferMethod: await elements['transferMethod'].toString(),
                clearingDate: await elements['clearingDate']['date'].toString(),
                total: await elements['total'].toString(),
                driverDebt: await elements['currentDriverDebt'],
                expanded_list: dataExpand));
          }

          emit(state.copyWith(financial_list: data, status1: 1));
        } else {
          emit(state.copyWith(
            status1: 2,
          ));
          print('error status != 200');
        }
      } catch (e) {
        emit(state.copyWith(
          status1: 2,
        ));
        print(e);
      }
    });
  }
}
