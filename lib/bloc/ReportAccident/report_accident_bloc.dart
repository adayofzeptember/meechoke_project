// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/ReportAccident/model.dart';
import 'package:meechoke_project/ETC/success_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'report_accident_event.dart';
part 'report_accident_state.dart';

class ReportAccidentBloc
    extends Bloc<ReportAccidentEvent, ReportAccidentState> {
  final dio = Dio();

  ReportAccidentBloc()
      : super(ReportAccidentState(
          locationName: '',
          lat: 0,
          lng: 0,
          vehicle_Docs: [],
          page: 1,
          isLoading: false,
        )) {
    on<Load_VehicleDocs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

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

        var fetchedDocs = [];

        if (response.statusCode == 200) {
          var data = response.data['data'];

          data.forEach((key, value) {
            if (value is List) {
              for (var item in value) {
                fetchedDocs.add(
                  Vehicle_Docs_Model(
                    docType: item['docType'] ?? "-",
                    company: item['company'] ?? "-",
                    contact: item['contact'] ?? "-",
                    creditLimit: item['creditLimit'].toString(),
                    docNumber: item['docNumber'] ?? "-",
                  ),
                );
              }
            }
          });

          emit(state.copyWith(
            vehicle_Docs: fetchedDocs,
          ));
        } else {
          print('status code != 200: ' + response.toString());
        }
      } catch (e) {
        if (e is DioException) {
          print(e);
        } else {
          print('Unexpected error: $e');
        }
      }
    });

    on<Upload_Pics_andReport>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      List<MultipartFile> multipleImages = [];

      //print(state.lat.toString() + " " + state.lng.toString());

      for (final imageFiles in event.files!) {
        String fileName = imageFiles.path.split('/').last;

        // print("images path -->: " + imageFiles.path);
        MultipartFile file =
            await MultipartFile.fromFile(imageFiles.path, filename: fileName);
        multipleImages.add(file);
      }
      print("image(s) count: " + multipleImages.length.toString());
      print("image path name: " + multipleImages[0].filename.toString());

      final formData;
      formData = FormData.fromMap({
        "type": event.type,
        "collection": event.collection,
        "files[issueReportImage][]": multipleImages
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
        if (response.statusCode == 200) {
          emit(state.copyWith(isLoading: false));

          Map<String, dynamic> reportJsonData = {
            'checkinData': {
              'latitude': state.lat,
              'longtitude': state.lng,
            },
            'remark': event.getRemark.toString(),
            'filenames': response.data['data'],
          };
          final response2 = await dio.post(api_url_v1 + "issue-reports",
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
              data: reportJsonData);

          print('---------> upload image status: ' +
              response2.statusMessage.toString());
          if (response2.statusCode == 200) {
            SuccessMessage_Dialog(event.context, 'ส่งแจ้งเสร็จสิ้น', 'ส่งแจ้ง');
            emit(state.copyWith(isLoading: false));
            print(response2.data['data']);
          } else {
            emit(state.copyWith(isLoading: false));
            print('error: ' + response2.data['data']);
            print('1');
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
          print('2');
          print('error: ' + response.data['data']);
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
        print('error: ' + e.toString());
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

//*-------------------------------------------------------------------------
    on<GetLocationName>((event, emit) async {
      print('LOCATE');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      try {
        final response = await dio.get(
          api_url_v1 +
              "external-api-location?latitude=${state.lat}&longtitude=${state.lng}",
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
        );
        //print(response.data);
        if (response.statusCode == 200) {
          emit(state.copyWith(
              locationName: response.data['data']['location']['subdistrict']
                      .toString() +
                  " " +
                  response.data['data']['location']['district'].toString() +
                  " " +
                  response.data['data']['location']['province'].toString()));
        } else {
          emit(state.copyWith(locationName: ''));
        }

        // print(state.locationName);
      } catch (e) {
        emit(state.copyWith(locationName: ''));
        // print('error: ' + e.toString());
      }
    });

    on<EmitLatLng>((event, emit) async {
      try {
        //   print('locating...');
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        // print(
        //     position.latitude.toString() + " " + position.longitude.toString());

        emit(state.copyWith(lat: position.latitude, lng: position.longitude));
      } catch (e) {}
      // emit(state.copyWith(lat: 4.04, lng: 4.04));
    });
  }
}
