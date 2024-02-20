import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Jobs/newjobs_model.dart';
import 'package:meechoke_project/screens/Jobs/newJob_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final dio = Dio();
  JobsBloc()
      : super(
          JobsState(
              status3Detail: 0,
              newjob_info: '',
              newjobs_list: [],
              status: 0,
              currentjobs_list: [],
              status2: 0),
        ) {
    //*
    on<Load_NewJobs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          status: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "get-driver-job/new",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        // var x = response.data['data']
        // print(x);meetingTime
        var dataNewJobs = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['job']) {
            dataNewJobs.add(
              Newjobs_List_Data(
                jobNumber: await elements['documentNumber'],
                jobStatus: await elements['currentStatus'],
                //?
                pickupPoint: await elements['checkinLocation'][0]
                    ['locationCode'],
                pickupDate: await elements['checkinLocation'][0]['meetingTime'],
                dropPoint: await elements['checkinLocation'][1]['locationCode'],
                dropDate: await elements['checkinLocation'][1]['meetingTime'],
              ),
            );
          }

          emit(state.copyWith(newjobs_list: dataNewJobs, status: 1));
        } else {
          print('error status != 200');
          emit(state.copyWith(
            status: 2,
          ));
        }
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          status: 2,
        ));
      }
    });

    //*

    on<Load_CurrentJobs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          status2: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "get-driver-job/current",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        // var x = response.data['data']
        // print(x);meetingTime
        var dataCurrentJobs = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['job']) {
            dataCurrentJobs.add(
              Newjobs_List_Data(
                jobNumber: await elements['documentNumber'],
                jobStatus: await elements['currentStatus'],
                pickupPoint: await elements['checkinLocation'][0]
                    ['locationCode'],
                pickupDate: await elements['checkinLocation'][0]['meetingTime'],
                dropPoint: await elements['checkinLocation'][1]['locationCode'],
                dropDate: await elements['checkinLocation'][1]['meetingTime'],
              ),
            );
          }

          emit(state.copyWith(currentjobs_list: dataCurrentJobs, status2: 1));
        } else {
          print('error status != 200');
          emit(state.copyWith(
            status2: 2,
          ));
        }
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          status2: 2,
        ));
      }
    });

    //*

    on<Load_NewJob_Info>((event, emit) async {
            Navigator.push(
                            event.context,
                            PageTransition(
                                duration: const Duration(milliseconds: 500),
                                type: PageTransitionType.fade,
                                child: Job_Details()));   
   
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        emit(state.copyWith(
          status3Detail: 0,
        ));
        final response = await dio.get(
          api_url_v1 + "job-order-number?jobOrderNumber=${event.joNumber}",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );
        //var responseData = response.data['data'];
        print('job detail status: ' + response.statusMessage.toString());
        dynamic nestedData = response.data['data'];
        dynamic fetchedDataInfo =
            (state.newjob_info != '') ? state.newjob_info : '';
        if (response.statusCode == 200) {
 
          //!ยังไม่มี จุดรับ-ส่ง ลูป---เบี้ยเลี้ยง-----โอนล่วงหน้า----ชื่อสินค้า
          fetchedDataInfo = Job_Detail(
              docNumber: nestedData['documentNumber'].toString(),
              docStatus: nestedData['documentStatus'].toString(),
              customerName:
                  nestedData['saleOrderOrdinary']['customerName'].toString(),
              weight: nestedData['totalWeight'].toString(),
              amounts: nestedData['transportAmount'].toString(),
              pallet: nestedData['palletAmount'].toString(),
              detail: nestedData['saleOrderOrdinary']['priceData']
                      ['unitSelector']
                  .toString(),
              contactName: nestedData['saleOrderOrdinary']['customer']
                      ['contactPoint'][0]['name']
                  .toString(),
              contactTel: nestedData['saleOrderOrdinary']['customer']
                      ['contactPoint'][0]['contact']
                  .toString(),
              inTheNameOf:
                  nestedData['saleOrderOrdinary']['customerName'].toString(),
              collectMoney: nestedData['saleOrderOrdinary']['optionalData']
                      ['sourcePayment']
                  .toString(),
              distance: nestedData['route']['distance'].toString(),
              remark:
                  nestedData['saleOrderOrdinary']['remark']['so'].toString(),
              dod: nestedData['saleOrderOrdinary']['remark']['dod'].toString());
               
          emit(state.copyWith(newjob_info: fetchedDataInfo, status3Detail: 1));
         
          //!
          // print('---------------------JOB DETAIL---------------------');
          // print('doc number: ' + nestedData['documentNumber']);
          // print('doc status: ' + nestedData['documentStatus']);
          // print('customer: ' + nestedData['saleOrderOrdinary']['customerName']);
          // print('total weight: ' + nestedData['totalWeight']);
          // print('amount(s): ' + nestedData['transportAmount']);
          // print('pallet: ' + nestedData['palletAmount']);

          // print('job detail: ' +
          //     nestedData['saleOrderOrdinary']['priceData']['unitSelector']);

          // print('contact: ' +
          //     nestedData['saleOrderOrdinary']['customer']['contactPoint'][0]
          //         ['name']);

          // print('contact tel: ' +
          //     nestedData['saleOrderOrdinary']['customer']['contactPoint'][0]
          //         ['contact']);

          // print('in the name of: ' +
          //     nestedData['saleOrderOrdinary']['customerName']);

          // print('เก็บเงินสด: ' +
          //     nestedData['saleOrderOrdinary']['optionalData']['sourcePayment']
          //         .toString());

          // print('ระยะทางรวม: ' + nestedData['route']['distance']);
          // print('หมายเหตุ: ' + nestedData['saleOrderOrdinary']['remark']['so']);

          // print('หมายเหตุ DOD: ' +
          //     nestedData['saleOrderOrdinary']['remark']['dod']);
          // print('---------------------END----------------------------');
        } else {
          print('error status != 200');
          emit(state.copyWith(
            status3Detail: 2,
          ));
        }
      } catch (e) {
        print("Exception Try: $e");
        emit(state.copyWith(
          status3Detail: 2,
        ));
      }
    });
  }
}
