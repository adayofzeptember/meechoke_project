import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Jobs/model.dart';
import 'package:meechoke_project/bloc/ReportAccident/model.dart';
import 'package:meechoke_project/screens/Jobs/currentJob_detail.dart';
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
            isLoading: false,
            newjob_info: '',
            newjobs_list: [],
            currentjobs_list: [],
            status: 0,
            status2: 0,
            status3Detail: 0,
          ),
        ) {
    //*
    // on<TEST>((event, emit) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? tokenAuth = prefs.getString('userToken');

    //   try {
    //     emit(state.copyWith(
    //       status: 0,
    //     ));
    //     final response = await dio.get(
    //       api_url_v1 + "get-driver-job/current",
    //       options: Options(headers: {
    //         "Authorization": "Bearer $tokenAuth",
    //       }),
    //     );
    //               var dataNewJobs = [];
    //       dynamic dataCheckin = [];
    //       List<dynamic> jobList = response.data['data']['job'];

    //     if (response.statusCode == 200) {


    //       for (var job in jobList) {
    //         List<dynamic> checkinLocationList = job['checkinLocation'];

    //         for (var checkinLocation in checkinLocationList) {
    //           print(checkinLocation['id'].toString());
    //           dataCheckin.add(Checkin_Location(
    //             pickupDate: checkinLocation['id'].toString(),
    //           ));
    //         }

    //         for (var elements in response.data['data']['job']) {
    //           dataNewJobs.add(
    //             Newjobs_List_Data(
    //                 jobNumber: await elements['documentNumber'],
    //                 jobStatus: await elements['documentStatus'],
    //                 checkin_location: dataCheckin),
    //           );
    //         }
    //       }

    //       // for (var elements in response.data['data']['job']) {
    //       //   for (var ele2 in elements['checkinLocation']) {
    //       //     print(ele2['id']);
    //       //   }
    //       // }
    //     } else {
    //       print('error status != 200');
    //     }
    //   } catch (e) {
    //     print("Exception Try: $e");
    //   }
    // });

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

        var dataNewJobs = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['job']) {
            dataNewJobs.add(
              Newjobs_List_Data(
                jobNumber: await elements['documentNumber'],
                jobStatus: await elements['documentStatus'],
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

        var dataCurrentJobs = [];
        if (response.statusCode == 200) {
          for (var elements in response.data['data']['job']) {
            dataCurrentJobs.add(
              Newjobs_List_Data(
                jobNumber: await elements['documentNumber'],
                jobStatus: await elements['documentStatus'],
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

    on<Load_Job_Info>((event, emit) async {
      if (event.checkPage == 'new_job') {
        Navigator.push(
            event.context,
            PageTransition(
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.fade,
                child: New_JobDetail()));
      } else {
        Navigator.push(
            event.context,
            PageTransition(
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.fade,
                child: Current_JobDetail()));
      }

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
        //!ยังไม่มี จุดรับ-ส่ง ลูป---เบี้ยเลี้ยง-----โอนล่วงหน้า----ชื่อสินค้า
        //var responseData = response.data['data'];
        print('job detail status: ' + response.statusMessage.toString());
        dynamic nestedData = response.data['data'];
        dynamic fetchedDataInfo =
            (state.newjob_info != '') ? state.newjob_info : '';
        if (response.statusCode == 200) {
          if (nestedData["saleOrderOrdinary"] != null) {
            print('งานปกติ');
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
          } else {
            print('งานตู้');

            fetchedDataInfo = Job_Detail(
                docNumber: nestedData['documentNumber'].toString(),
                docStatus: nestedData['documentStatus'].toString(),
                customerName:
                    nestedData['saleOrderContainer']['customerName'].toString(),
                weight: nestedData['totalWeight'].toString(),
                amounts: nestedData['transportAmount'].toString(),
                pallet: nestedData['palletAmount'].toString(),
                detail: nestedData['saleOrderContainer']['priceData']
                        ['unitSelector']
                    .toString(),
                contactName: nestedData['saleOrderContainer']['customer']
                        ['contactPoint'][0]['name']
                    .toString(),
                contactTel: nestedData['saleOrderContainer']['customer']
                        ['contactPoint'][0]['contact']
                    .toString(),
                inTheNameOf:
                    nestedData['saleOrderContainer']['customerName'].toString(),
                collectMoney: nestedData['saleOrderContainer']['optionalData']
                        ['sourcePayment']
                    .toString(),
                distance: nestedData['route']['distance'].toString(),
                remark:
                    nestedData['saleOrderContainer']['remark']['so'].toString(),
                dod: nestedData['saleOrderContainer']['remark']['dod'].toString());
          }

          emit(state.copyWith(newjob_info: fetchedDataInfo, status3Detail: 1));
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

    on<Action_Status>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        final response = await dio.patch(
          api_url_v1 +
              "job-action-status?status=${event.getStatus}&jobOrderNumber=${event.getJONumber}",
          options: Options(headers: {
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        var responsePrint = response.data['data'];
        print(responsePrint.toString());

        if (response.statusCode == 200) {
          emit(state.copyWith(
            isLoading: false,
          ));
          print('ok');
        } else {
          emit(state.copyWith(
            isLoading: false,
          ));
          print('error status != 200');
        }
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
        ));
        print("Exception Try: $e");
      }
    });
  }
}
