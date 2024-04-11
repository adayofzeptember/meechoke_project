import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Fuel/model.dart';
import 'package:meechoke_project/screens/Fuel/fuel_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final dio = Dio();
  FuelBloc()
      : super(FuelState(
            fuel_notYet_list: [], status1: 0, status2_info: 0, fuelInfo: '')) {
    //*
    on<Load_FuelNotYet>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        emit(state.copyWith(
          status1: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "fuel-refill/?hasRefilled=false",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        //  var x = response.data['data'][1]['jobOrderNumber'][0]['joNumber'].toString();
        // print('sdfsdfsdfsdf'+x);

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            data.add(Fuel_Model(
              id: await elements['id'].toString(),
              date: await elements['fuelOrderDate']['date'].toString(),
              jo_number: (await elements['jobOrderNumber']) == null ||
                      (await elements['jobOrderNumber']).isEmpty
                  ? 'ไม่มี JO'
                  : await elements['jobOrderNumber']['joNumber'].toString(),
              doc_number: await elements['documentNumber'].toString(),
              status: 'ยังไม่ได้เติม',
              location_name:
                  await elements['location']['locationFullName'].toString(),
              volum: await elements['detailFuelVolumeNormalType'].toString(),
              remark: await elements['remark'].toString(),
            ));
          }

          emit(state.copyWith(fuel_notYet_list: data, status1: 1));
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
    //*
    on<Load_Fuel_Info>((event, emit) async {
      Navigator.push(
          event.context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: Fuel_Detail()));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          status2_info: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "fuel-order/${event.joNumber}",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        dynamic nestedData = response.data['data'];
        dynamic fetchedDataInfo = (state.fuelInfo != '') ? state.fuelInfo : '';

        if (response.statusCode == 200) {
          fetchedDataInfo = Fuel_Info(
              id: nestedData['id'].toString(),
              date: nestedData['fuelOrderDate']['date'].toString(),
              jo_number: (await nestedData['jobOrderNumber']) == null ||
                      (await nestedData['jobOrderNumber']).isEmpty
                  ? 'ไม่มี JO'
                  : await nestedData['jobOrderNumber']['joNumber'].toString(),
              doc_number: nestedData['documentNudddmber'].toString(),
              status: 'ยังไม่ได้เติม',
              location_name:
                  nestedData['location']['locationFullName'].toString(),
              fuelType: nestedData['4mChange']['details']['primaryFuelType']
                      ['name']
                  .toString(),
              fuelGroup: nestedData['4mChange']['details']['primaryFuelGroup']
                      ['name']
                  .toString(),
              volum: nestedData['detailFuelVolumeNormalType'].toString(),
              totalprice: nestedData['detailFuelOrderTotalPrice'].toString(),
              paymentMethod: nestedData['paymentMethod'].toString(),
              cardNumber: nestedData['currentCard']['cardNumber'].toString(),
              creditRemains:
                  nestedData['currentCard']['creditRemains'].toString(),
              remark: nestedData['remark'].toString());

          emit(state.copyWith(fuelInfo: fetchedDataInfo, status2_info: 1));
        } else {
          print('error status != 200');
          emit(state.copyWith(fuelInfo: fetchedDataInfo, status2_info: 2));
        }

        //  var x = response.data['data'].toString();
        //  print('sdfsdfsdfsdf'+x);
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          status2_info: 2,
        ));
      }
    });
  }
}