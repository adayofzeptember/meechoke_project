import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/ETC/success_dialog.dart';
import 'package:meechoke_project/bloc/Fuel/model.dart';
import 'package:meechoke_project/screens/Register%20Driver/Fuel/fuel_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final dio = Dio();
  FuelBloc()
      : super(FuelState(
            isLoading: false,
            fuel_filled_list: [],
            fuel_notYet_list: [],
            status1: 0,
            status2_info: 0,
            fuelInfo: '')) {
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

        var x = response.data['data'][1]['jobOrderNumber'][0]['joNumber']
            .toString();
        print('response jo number' + x);
        

        var data = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']) {
            data.add(Fuel_Model(
              id: await elements['id'].toString(),
              date: (await elements['fuelOrderDate']['date']) == null ||
                      (await elements['fuelOrderDate']['date']).isEmpty
                  ? 'ไม่ระบุวันที่'
                  : await elements['fuelOrderDate']['date'].toString(),
              jo_number: (await elements['jobOrderNumber']) == null ||
                      (await elements['jobOrderNumber']).isEmpty
                  ? 'ไม่มี JO'
                  : await elements['jobOrderNumber']['joNumber'].toString(),
              doc_number: await elements['documentNumber'].toString(),
              status: 'ยังไม่ได้เติม',
              location_name:
                  await elements['location']['locationFullName'].toString(),
              volum: await elements['detailFuelVolumeSummary'].toString(),
              remark: (await elements['remark']) == null ||
                      (await elements['remark']).isEmpty
                  ? 'ไม่มี JO'
                  : await elements['remark'].toString(),
            ));
          }

          emit(state.copyWith(fuel_notYet_list: data, status1: 1));
          // emit(state.copyWith(status1: 1));
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
    on<Load_Filled>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        emit(state.copyWith(
          status1: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "fuel-refill/?hasRefilled=true",
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
              status: 'เติมแล้ว',
              location_name:
                  await elements['location']['locationFullName'].toString(),
              volum: await elements['detailFuelVolumeSummary'].toString(),
              remark: await elements['remark'].toString(),
            ));
          }

          emit(state.copyWith(fuel_filled_list: data, status1: 1));
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
    //*----------------------
    on<Load_Fuel_Info>((event, emit) async {
      Navigator.push(
          event.context,
          PageTransition(
              duration: const Duration(milliseconds: 300),
              type: PageTransitionType.rightToLeft,
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
              // source: nestedData['jobOrderNumber']['jobRoute']['destination'],
              // destination: nestedData['jobOrderNumber']['jobRoute']
              //     ['destination'],

              destination: (await nestedData['jobOrderNumber']) == null || (await nestedData['jobOrderNumber']['jobRoute']).isEmpty
                  ? '-'
                  : await nestedData['jobOrderNumber']['jobRoute']['destination']
                      .toString(),
              source: (await nestedData['jobOrderNumber']) == null || (await nestedData['jobOrderNumber']['jobRoute']).isEmpty
                  ? '-'
                  : await nestedData['jobOrderNumber']['jobRoute']['source']
                      .toString(),

              //!-

              id: nestedData['id'].toString(),
              date: nestedData['fuelOrderDate']['date'].toString(),
              jo_number: (await nestedData['jobOrderNumber']) == null || (await nestedData['jobOrderNumber']).isEmpty
                  ? 'ไม่มี JO'
                  : await nestedData['jobOrderNumber']['joNumber'].toString(),
              doc_number: nestedData['documentNumber'].toString(),
              // status: 'ยังไม่ได้เติม',
              status:
                  (event.checkPage == 'notfill') ? 'ยังไม่เติม' : 'เติมแล้ว',
              location_name:
                  nestedData['location']['locationFullName'].toString(),
              fuelType: nestedData['4mChange']['details']['primaryFuelType']['name']
                  .toString(),
              fuelGroup: nestedData['4mChange']['details']['primaryFuelGroup']['name']
                  .toString(),
              volum: nestedData['detailFuelVolumeSummary'].toString(),
              totalprice: nestedData['detailFuelOrderTotalPrice'].toString(),
              paymentMethod: nestedData['paymentMethod'].toString(),
              cardNumber: (await nestedData['currentCard']) == null || (await nestedData['currentCard']).isEmpty
                  ? '-'
                  : await nestedData['currentCard']['cardNumber'].toString(),
              creditRemains: (await nestedData['currentCard']) == null || (await nestedData['currentCard']).isEmpty
                  ? '-'
                  : await nestedData['currentCard']['creditRemains'].toString(),

              // cardNumber: nestedData['currentCard']['cardNumber'].toString(),
              // creditRemains:
              //     nestedData['currentCard']['creditRemains'].toString(),
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

    //*

    on<Upload_Pics_Fuel>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      List<MultipartFile> multipleImages = [];

      for (final imageFiles in event.files!) {
        String fileName = imageFiles.path.split('/').last;

        MultipartFile file =
            await MultipartFile.fromFile(imageFiles.path, filename: fileName);
        multipleImages.add(file);
      }
      print("image(s) count: " + multipleImages.length.toString());

      final formData;
      formData = FormData.fromMap({
        "type": event.type,
        "collection": event.collection,
        "files[refilledImage][]": multipleImages
        // await MultipartFile.fromFile(event.files![1].path
        // )
      });

      try {
        emit(state.copyWith(isLoading: true));
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

        var k = response.data['data'];
        print(k);

        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));
          Map<String, dynamic> fillFuelJsonData = {
            "hasRefilled": true,
            'filenames': response.data['data'],
          };

          print(fillFuelJsonData);

          final response2 =await dio.patch(api_url_v1 + "fuel-refill/${event.fuel_id}",
                  options: Options(
                    headers: {
                      "Authorization": "Bearer $tokenAuth",
                    },
                    // followRedirects: false,
                    // validateStatus: (status) {
                    //   return status! <= 500;
                    // },
                    // contentType: Headers.formUrlEncodedContentType,
                    // responseType: ResponseType.json,
                  ),
                  data: fillFuelJsonData);

          print('---------> upload image status: ' +
              response2.statusMessage.toString());

          // response หลัง upload
          if (response2.statusCode == 200) {
            emit(state.copyWith(isLoading: false));

            // var k = response2.data['data'];
            // print(k);
            SuccessMessage_Dialog(
                event.context, 'อัปโหลดเสร็จสิ้น', 'เชื้อเพลิง');
          } else {
            emit(state.copyWith(isLoading: false));

            print('error: ' + response2.data['data']);
            Fluttertoast.showToast(
                msg: "เกิดข้อผิดพลาด, โปรดลองใหม่อีกครั้ง",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.SNACKBAR,
                timeInSecForIosWeb: 2,
                backgroundColor: Color.fromARGB(255, 133, 133, 133),
                textColor: Colors.white,
                fontSize: 15);
          }
        } else {
          emit(state.copyWith(isLoading: false));

          Fluttertoast.showToast(
              msg: "เกิดข้อผิดพลาด, โปรดลองใหม่อีกครั้ง",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: Color.fromARGB(255, 133, 133, 133),
              textColor: Colors.white,
              fontSize: 15);
        }
      } catch (e) {
        emit(state.copyWith(isLoading: false));

        Fluttertoast.showToast(
            msg: "เกิดข้อผิดพลาด, โปรดลองใหม่อีกครั้ง",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
        print('error: ' + e.toString());
      }
    });
  }
}
