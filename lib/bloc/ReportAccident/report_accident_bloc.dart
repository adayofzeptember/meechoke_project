import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'report_accident_event.dart';
part 'report_accident_state.dart';

class ReportAccidentBloc
    extends Bloc<ReportAccidentEvent, ReportAccidentState> {
  final dio = Dio();
  ReportAccidentBloc()
      : super(ReportAccidentState(
          productIns_Docs: [],
          vehicle_Docs: [],
          page: 1,
          isLoading: true,
        )) {
    on<Load_VehicleDocs>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');

      // final response = await http.get(
      //     Uri.parse(
      //       api_url_v1 + "get-vehicle-docs?plateNumber=11-1111",
      //     ),
      //     headers: {
      //       // 'Content-Type': 'application/json',
      //       // 'Accept': 'application/json',
      //       'Authorization': 'Bearer $tokenAuth',
      //     });

      // if (response.statusCode == 200) {
      //   print(response.statusCode);

      //   var jsonResponse = json.decode(response.body.trim());
      //   var x = jsonResponse['data']['act'];
      //   print(x);
      // } else {
      //   print('failk');
      //   print(response);
      // }

      final response2 = await dio.get(
        api_url_v1 + "get-vehicle-docs?plateNumber=11-1111",
        options: Options(
          headers: {
            "Content-Type": "application/json",
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
      print(response2.data.toString());

      // if (response2.data != null) {
      //   if (response2.statusCode == 200) {
      //     print(response2.statusCode.toString());
      //     print(response2.data.toString());
      //   } else {
      //     print(response2.statusCode.toString());
      //     print('fail api status Code: ${response2}');
      //   }
      // } else {
      //   print('unexpedted formart');
      // }

      // if (response2.statusCode == 200) {
      //   print(response2.statusCode.toString());
      //   print(response2.data.toString());
      // } else {
      //   print(response2.statusCode.toString());
      //   print('fail api status Code: ${response2}');
      // }

      // var fetched_docs = (state.vehicle_Docs != []) ? state.vehicle_Docs : [];
      // var fetched_prdIns =
      //     (state.productIns_Docs != []) ? state.productIns_Docs : [];

      // if (response.statusCode == 200) {
      //   for (var nested in response.data['data']['act']) {
      //     fetched_docs.add(
      //       Vehicle_Docs_Model(
      //         docType: await nested['docType'].toString(),
      //         company: await nested['company'].toString(),
      //         contact: await nested['contact'].toString(),
      //         creditLimit: await nested['creditLimit'].toString(),
      //         docNumber: await nested['docNumber'].toString(),
      //       ),
      //     );
      //   }

      //   for (var nested in response.data['data']['productInsurance']) {
      //     fetched_prdIns.add(
      //       Vehicle_Docs_Model(
      //         docType: await nested['docType'].toString(),
      //         company: await nested['company'].toString(),
      //         contact: await nested['contact'].toString(),
      //         creditLimit: await nested['creditLimit'].toString(),
      //         docNumber: await nested['docNumber'].toString(),
      //       ),
      //     );
      //   }

      //   emit(state.copyWith(
      //       vehicle_Docs: fetched_docs, productIns_Docs: fetched_prdIns));

      //   print(fetched_docs.length);
      // } else {}
    });

    on<Upload_Pics>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
  

      final formData;
      formData = FormData.fromMap({
        "type": event.type,
        "collection": event.collection,
        "files[issueReportImage][]":
            await MultipartFile.fromFile(event.files!.path)
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
            data: formData);
        print("-------------------------------------------");
        print(response.statusCode);
        print(response.data);
        print("-------------------------------------------");
      } catch (e) {
        print('error: ' + e.toString());
      }
    });
  }
}
