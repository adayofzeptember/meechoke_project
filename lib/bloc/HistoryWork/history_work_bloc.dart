import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/HistoryWork/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'history_work_event.dart';
part 'history_work_state.dart';

class HistoryWorkBloc extends Bloc<HistoryWorkEvent, HistoryWorkState> {
  final dio = Dio();
  HistoryWorkBloc()
      : super(HistoryWorkState(
            count: '0',
            workhistory_list: [],
            total: '',
            month: '',
            status: 'wait',
            year: DateTime.now().year.toString())) {
    on<GetDate>((event, emit) async {
      if (event.getYear == null) {
        emit(state.copyWith(month: event.getMonth.toString()));
      } else {
        emit(state.copyWith(year: event.getYear.toString()));
      }
    });

    on<LoadHistoryWorks>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      int checkMonth;
      if (state.month == 'มกราคม') {
        checkMonth = 1;
      } else if (state.month == 'กุมภาพันธ์') {
        checkMonth = 2;
      } else if (state.month == 'มีนาคม') {
        checkMonth = 3;
      } else if (state.month == 'เมษายน') {
        checkMonth = 4;
      } else if (state.month == 'พฤษภาคม') {
        checkMonth = 5;
      } else if (state.month == 'มิถุนายน') {
        checkMonth = 6;
      } else if (state.month == 'กรกฎาคม') {
        checkMonth = 7;
      } else if (state.month == 'สิงหาคม') {
        checkMonth = 8;
      } else if (state.month == 'กันยายน') {
        checkMonth = 9;
      } else if (state.month == 'ตุลาคม') {
        checkMonth = 10;
      } else if (state.month == 'พฤศจิกายน') {
        checkMonth = 11;
      } else {
        checkMonth = 12;
      }

      try {
        emit(state.copyWith(status: 'loading'));
        final response = await dio.get(
          api_url_v1 +
              "get-driver-job/history?month=${checkMonth}&year=${int.parse(state.year)}",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        //  var count = response.data['count'].toString();
        //  var allowanceTotal = response.data['count'].toString();
        // print(state.month+state.year);
        // print(x);

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['driverFinanceSummary']) {
            data.add(
              HistoryWork_Model(
                  customer: await elements['customer'] ?? '',
                  date_range: await elements['dateRange'] ?? '',
                  allowance: await elements['allowance'] ?? '-',
                  doc_number: await elements['documentNumber'] ?? ''),
            );
          }
          emit(state.copyWith(
              workhistory_list: data,
              status: 'done',
              count: response.data['count'].toString(),
              total: response.data['allowanceTotal'].toString()));
        } else {
          emit(state.copyWith(status: 'error'));
          print('error status != 200');
        }
      } catch (e) {
        emit(state.copyWith(status: 'error'));
        print("Exception Try: $e");
      }
    });
  }
}
