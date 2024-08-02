import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/ETC/success_dialog.dart';
import 'package:meechoke_project/bloc/Jobs/model.dart';
import 'package:meechoke_project/screens/Jobs/2.%20Job%20Detail/current_job_detail.dart';
import 'package:meechoke_project/screens/Jobs/2.%20Job%20Detail/new_job_detail.dart';
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
            job_info: '',
            newjobs_list: [],
            currentjobs_list: [],
            status: 0,
            status2: 0,
            count: 0,
            status3Detail: 0,
          ),
        ) {
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
            //print('id: ' + elements['routeId'].toString());

            List<dynamic> checkinLocationList = elements['checkinLocation'];
            List<Checkin_Location> dataCheckin = [];
            if (elements['checkinLocation'] != null &&
                elements['checkinLocation'] is List) {
              for (var checkinLocation in checkinLocationList) {
                dataCheckin.add(Checkin_Location(
                  checkinCategory:
                      checkinLocation['checkinCategory'].toString(),
                  date: checkinLocation['meetingDate'].toString(),
                  point: checkinLocation['locationCode'].toString(),
                ));
              }
            }
            dataNewJobs.add(
              Jobs_List_Data(
                jobNumber: await elements['documentNumber'] ?? '',
                jobStatus: await elements['documentStatus'] ?? '',
                checkin_location: dataCheckin,
              ),
            );

            //print('have: ' + dataCheckin.length.toString());
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
            List<dynamic> checkinLocationList = elements['checkinLocation'];
            List<Checkin_Location> dataCheckin = [];
            if (elements['checkinLocation'] != null &&
                elements['checkinLocation'] is List) {
              for (var checkinLocation in checkinLocationList) {
                dataCheckin.add(Checkin_Location(
                  checkinCategory:
                      checkinLocation['checkinCategory'].toString(),
                  date: checkinLocation['meetingDate'].toString(),
                  point: checkinLocation['locationCode'].toString(),
                ));
              }
            }
            dataCurrentJobs.add(
              Jobs_List_Data(
                currentStatus: await elements['currentStatus'] ?? '',
                jobNumber: await elements['documentNumber'] ?? '',
                jobStatus: await elements['documentStatus'] ?? '',
                checkin_location: dataCheckin,
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
//*--------------------------------------------------------------------------------------------------------------------------
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

        print('JOB DETAIL STATUS: ' + response.statusMessage.toString());
        dynamic nestedData = response.data['data'];
        dynamic fetchedDataInfo = (state.job_info != '') ? state.job_info : '';
        Current_Location dataCurrentLocation;
        List<dynamic> checkinLocationList = nestedData['checkinLocation'];
        List<Checkin_Location> dataCheckinInfo = [];

        if (response.statusCode == 200) {
          if (nestedData["saleOrderOrdinary"] != null) {
            print('งานปกติ');

            if (nestedData['checkinLocation'] != null &&
                nestedData['checkinLocation'] is List) {
              for (var checkinLocation in checkinLocationList) {
                dataCheckinInfo.add(Checkin_Location(
                  checkinCategory:
                      checkinLocation['checkinCategory'].toString(),
                  date: checkinLocation['meetingDate'].toString(),
                  point: checkinLocation['locationCode'].toString(),
                ));
              }
            }

            if (nestedData['currentLocation'] != null) {
              dataCurrentLocation = Current_Location(
                  currentLocation_id: nestedData['currentLocation']['id'] ?? '',
                  currentLocation_checkinCategory:
                      nestedData['currentLocation']['checkinCategory'] ?? '',
                  currentLocation_date:
                      nestedData['currentLocation']['meetingDate'] ?? '',
                  currentLocation_point:
                      nestedData['currentLocation']['locationCode'] ?? '');
            } else {
              print('all location done');
              dataCurrentLocation = Current_Location(
                  currentLocation_id: 0,
                  currentLocation_checkinCategory: '',
                  currentLocation_date: '',
                  currentLocation_point: '');
            }

            fetchedDataInfo = Job_Detail(
                currentLocation: dataCurrentLocation,
                current_status: nestedData['currentStatus'].toString(),
                docNumber: nestedData['documentNumber'].toString(),
                docStatus: nestedData['documentStatus'].toString(),
                checkInLocation_Info: dataCheckinInfo,
                customerName:
                    nestedData['saleOrderOrdinary']['customerName'].toString(),
                // ignore: unnecessary_null_comparison
                weight: (nestedData['totalWeight'] == null)
                    ? '0'
                    : nestedData['totalWeight'].toString(),
                amounts: (nestedData['transportAmount'] == null)
                    ? '0'
                    : nestedData['transportAmount'].toString(),
                pallet: (nestedData['palletAmount'] == null)
                    ? '0'
                    : nestedData['palletAmount'].toString(),
                detail: nestedData['saleOrderOrdinary']['priceData']['unitSelector']
                    .toString(),
                contactName: nestedData['saleOrderOrdinary']['customer']
                        ['contactPoint'][0]['name']
                    .toString(),
                contactTel: nestedData['saleOrderOrdinary']['customer']['contactPoint'][0]['contact']
                    .toString(),
                inTheNameOf:
                    nestedData['saleOrderOrdinary']['customerName'].toString(),
                collectMoney: nestedData['saleOrderOrdinary']['optionalData']['sourcePayment']
                    .toString(),
                // distance: nestedData['route']['distance'].toString() ,

                distance: (await nestedData['route']) == null || (await nestedData['route']).isEmpty
                    ? 'ไม่ได้ระบุ'
                    : await nestedData['route']['distance'].toString(),
                remark: (await nestedData['saleOrderOrdinary']['remark']['so']) == null ||
                        (await nestedData['saleOrderOrdinary']['remark']['so'] == "null")
                    ? '-'
                    : await nestedData['saleOrderOrdinary']['remark']['so'].toString(),
                dod: (await nestedData['saleOrderOrdinary']['remark']['dod']) == null || (await nestedData['saleOrderOrdinary']['remark']['dod'] == "null") ? '-' : await nestedData['saleOrderOrdinary']['remark']['dod'].toString());

            ;
          } else {
            print('งานตู้');

            if (nestedData['checkinLocation'] != null &&
                nestedData['checkinLocation'] is List) {
              for (var checkinLocation in checkinLocationList) {
                dataCheckinInfo.add(Checkin_Location(
                  checkinCategory:
                      checkinLocation['checkinCategory'].toString(),
                  date: checkinLocation['meetingDate'].toString(),
                  point: checkinLocation['locationCode'].toString(),
                ));
              }
            }

            if (nestedData['currentLocation'] != null) {
              print('all locations not done');
              dataCurrentLocation = Current_Location(
                  currentLocation_id: nestedData['currentLocation']['id'] ?? '',
                  currentLocation_checkinCategory:
                      nestedData['currentLocation']['checkinCategory'] ?? '',
                  currentLocation_date:
                      nestedData['currentLocation']['meetingDate'] ?? '',
                  currentLocation_point:
                      nestedData['currentLocation']['locationCode'] ?? '');
            } else {
              print('all locations done');
              dataCurrentLocation = Current_Location(
                  currentLocation_id: 0,
                  currentLocation_checkinCategory: '',
                  currentLocation_date: '',
                  currentLocation_point: '');
            }

            fetchedDataInfo = Job_Detail(
                currentLocation: dataCurrentLocation,
                current_status: nestedData['currentStatus'].toString(),
                docNumber: nestedData['documentNumber'].toString(),
                docStatus: nestedData['documentStatus'].toString(),
                checkInLocation_Info: dataCheckinInfo,
                customerName:
                    nestedData['saleOrderContainer']['customerName'].toString(),
                weight: (nestedData['totalWeight'] == null)
                    ? '0'
                    : nestedData['totalWeight'].toString(),
                amounts: (nestedData['transportAmount'] == null)
                    ? '0'
                    : nestedData['transportAmount'].toString(),
                pallet: (nestedData['palletAmount'] == null)
                    ? '0'
                    : nestedData['palletAmount'].toString(),
                detail: nestedData['saleOrderContainer']['priceData']['unitSelector']
                    .toString(),
                contactName: nestedData['saleOrderContainer']['customer']
                        ['contactPoint'][0]['name']
                    .toString(),
                contactTel: nestedData['saleOrderContainer']['customer']['contactPoint'][0]['contact']
                    .toString(),
                inTheNameOf:
                    nestedData['saleOrderContainer']['customerName'].toString(),
                collectMoney: nestedData['saleOrderContainer']['optionalData']['sourcePayment']
                    .toString(),
                distance: (await nestedData['route']) == null || (await nestedData['route']).isEmpty
                    ? 'ไม่ได้ระบุ'
                    : await nestedData['route']['distance'].toString(),
                remark: (await nestedData['saleOrderContainer']['remark']['so']) == null || (await nestedData['saleOrderContainer']['remark']['so'] == "null") ? '-' : await nestedData['saleOrderContainer']['remark']['so'].toString(),
                dod: (await nestedData['saleOrderContainer']['remark']['dod']) == null || (await nestedData['saleOrderContainer']['remark']['dod'] == "null") ? '-' : await nestedData['saleOrderContainer']['remark']['dod'].toString());

            ;
          }

          emit(state.copyWith(job_info: fetchedDataInfo, status3Detail: 1));
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

    on<Upload_Pics_Jobs>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      List<MultipartFile> multipleImages = [];

      for (final imageFiles in event.files!) {
        String fileName = imageFiles.path.split('/').last;
        MultipartFile file =
            await MultipartFile.fromFile(imageFiles.path, filename: fileName);
        multipleImages.add(file);
      }

      final uploadData;
      uploadData = FormData.fromMap({
        "type": "image",
        "collection": "true",
        event.imageFileName: multipleImages
      });

      try {
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
            data: uploadData);

        var x = response.data['data'];
        print(x);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            isLoading: false,
          ));
          Map<String, dynamic> reportJsonData = {
            "jobOrderNumber": event.getJoNumber,
            "type": event.type,
            "additionalStatus": {
              "hasFinished": false,
              "hasPickedOverTime": event.hasPickedOverTime,
              "hasDeliveredOverTime": event.hasDeliveredOverTime
            },
            "checkinLocation": {
              "id": event.getCurrentLocationID,
              "mobileState": 1
            },
            'filenames': response.data['data'],
          };
          final response2 =
              await dio.patch(api_url_v1 + "job-action-checkpoint",
                  options: Options(
                    headers: {
                      "Authorization": "Bearer $tokenAuth",
                    },
                  ),
                  data: reportJsonData);

          if (response2.statusCode == 200) {
            //! เอาไปใส่ที่ไหนได้บ้าง //+1
            emit(state.copyWith(isLoading: false));
            SuccessMessage_Dialog(event.context, 'ส่งรูปภาพเสร็จสิ้น', 'งาน');
          } else {
            emit(state.copyWith(
              isLoading: false,
            ));
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
          emit(state.copyWith(
            isLoading: false,
          ));
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
        emit(state.copyWith(
          isLoading: false,
        ));
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

    on<FinishTheJob>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      Map<String, dynamic> reportJsonData = {
        "jobOrderNumber": event.getJoNumber,
        "type": event.type,
        "additionalStatus": {
          "hasFinished": true,
          "hasPickedOverTime": false,
          "hasDeliveredOverTime": false
        },
      };

      try {
        final response = await dio.patch(api_url_v1 + "job-action-checkpoint",
            options: Options(headers: {
              "Authorization": "Bearer $tokenAuth",
            }),
            data: reportJsonData);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            count: 0,
          ));
          SuccessMessage_Dialog(event.context, 'จบงานแล้ว', 'จบงาน');
        } else {
          Fluttertoast.showToast(
              msg: "เกิดข้อผิดพลาด",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 133, 133, 133),
              textColor: Colors.white,
              fontSize: 20);
        }
      } catch (e) {
        Fluttertoast.showToast(
            msg: "${e}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 20);
      }
    });

    // on<FinishTheJob>((event, emit) async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? tokenAuth = prefs.getString('userToken');

    //   Map<String, dynamic> reportJsonData = {
    //     "jobOrderNumber": event.getJoNumber,
    //     "type": event.type,
    //     "additionalStatus": {
    //       "hasFinished": true,
    //       "hasPickedOverTime": false,
    //       "hasDeliveredOverTime": false
    //     },
    //   };

    //   try {
    //     final response = await dio.patch(api_url_v1 + "job-action-checkpoint",
    //         options: Options(headers: {
    //           "Authorization": "Bearer $tokenAuth",
    //         }),
    //         data: reportJsonData);

    //     if (response.statusCode == 200) {
    //       emit(state.copyWith(
    //         count: 0,
    //       ));
    //       SuccessMessage_Dialog(event.context, 'จบงานแล้ว', 'จบงาน');
    //     } else {
    //       Fluttertoast.showToast(
    //           msg: "เกิดข้อผิดพลาด",
    //           toastLength: Toast.LENGTH_LONG,
    //           gravity: ToastGravity.SNACKBAR,
    //           timeInSecForIosWeb: 2,
    //           backgroundColor: const Color.fromARGB(255, 133, 133, 133),
    //           textColor: Colors.white,
    //           fontSize: 20);
    //     }
    //   } catch (e) {
    //     Fluttertoast.showToast(
    //         msg: "${e}",
    //         toastLength: Toast.LENGTH_LONG,
    //         gravity: ToastGravity.SNACKBAR,
    //         timeInSecForIosWeb: 2,
    //         backgroundColor: const Color.fromARGB(255, 133, 133, 133),
    //         textColor: Colors.white,
    //         fontSize: 20);
    //   }
    // });
//! รับงาน ออกรถ
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
          Fluttertoast.showToast(
              msg: "${event.getStatus} หมายเลข: ${event.getJONumber} แล้ว",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 133, 133, 133),
              textColor: Colors.white,
              fontSize: 20);
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
