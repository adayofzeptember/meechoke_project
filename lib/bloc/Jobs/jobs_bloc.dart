import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Jobs/newjobs_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final dio = Dio();
  JobsBloc()
      : super(
          JobsState(
              newjobs_list: [], status: 0, currentjobs_list: [], status2: 0),
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
  }
}
