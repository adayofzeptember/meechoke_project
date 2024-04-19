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
    on<Load_Financial>((event, emit) async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        emit(state.copyWith(
          status1: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "transaction-history",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

          var x = response.data['data'];
         print(x);

        var data = [];
        if (response.statusCode == 200) {
         
          for (var elements in response.data['data']) {
            data.add(Financial_Model(
              transferMethod: elements['transferMethod'].toString()
              
            ));
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
