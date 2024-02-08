import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'report2_event.dart';
part 'report2_state.dart';

class Report2Bloc extends Bloc<Report2Event, Report2State> {
  final dio = Dio();
  Report2Bloc()
      : super(
            Report2State(vehicle_Docs: [], isLoading: false, statusCheck: '')) {
    on<Load_Docs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      emit(state.copyWith(statusCheck: '0'));
      try {
        final response = await dio.get(
        api_url_v1 +
            "get-vehicle-docs?plateNumber=" +
            prefs.getString('carPlate').toString(),
        options: Options(
          headers: {
            "Authorization": "Bearer $tokenAuth",
          },
        ),
      );
      print(response.data.toString());
      emit(state.copyWith(statusCheck: '1'));
      } catch (e) {
        emit(state.copyWith(statusCheck: '1'));
         if (e is DioException) {
          emit(state.copyWith(statusCheck: '1'));
        } else {
          emit(state.copyWith(statusCheck: '1'));
        }
      }
    });
  }
}
