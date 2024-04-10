import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Fuel/fuel_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final dio = Dio();
  FuelBloc() : super(FuelState(fuel_notYet_list: [])) {
    on<Load_FuelNotYet>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        final response = await dio.get(
          api_url_v1 + "fuel-refill/?hasRefilled=false",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

      //    var x = response.data['data'][0]['jobOrderNumber']['joNumber'].toString();
      //  print(x);

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            data.add(Fuel_Model(
              date: await elements['fuelOrderDate']['date'].toString(),
              //  jo_number:
              //     await elements['jobOrderNumber']['joNumber'].toString(),
              doc_number: await elements['documentNumber'].toString(),
              status: 'ยังไม่ได้เติม',
              location_name:
                  await elements['location']['locationFullName'].toString(),
              volum: await elements['detailFuelVolumeNormalType'].toString(),
              remark: await elements['remark'].toString(),
            ));
          }

          emit(state.copyWith(fuel_notYet_list: data));
        
        } else {
          print('error status != 200');
        }
      } catch (e) {
        print(e);
      }
    });
  }
}
