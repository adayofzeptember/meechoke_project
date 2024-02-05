import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meechoke_project/ETC/api_url.dart';
import 'package:meechoke_project/bloc/Profile/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final dio = Dio();
  ProfileBloc() : super(ProfileState(profile_data: '', loading: true)) {
    //*

    on<Load_Profile>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
    
      emit(state.copyWith(loading: true));
      try {
        final response = await dio.get(
          api_url_v1+"get-vehicle-data",
          options: Options(headers: {
       
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        print("response data: "+ response.data['message']);

        dynamic dataProfile =
            (state.profile_data != '') ? state.profile_data : '';
        dynamic nestedData = response.data['data'];

        if (response.statusCode == 200) {
          emit(state.copyWith(loading: false));
          dataProfile = Profile_Data(
              province: await nestedData['province'].toString(),
              plateNumber: await nestedData['plateNumber'].toString(),
              trailerPlateNumber:
                  await nestedData['trailerPlateNumber'].toString(),
              name: await response.data['data']['drivers'][0]['firstName']
                      .toString() +
                  " " +
                  await response.data['data']['drivers'][0]['lastName']
                      .toString());

          emit(state.copyWith(profile_data: dataProfile, loading: false));
        } else {
          emit(state.copyWith(loading: false));
          print('fail api status Code: ${response}');
        }
      } catch (e) {
        emit(state.copyWith(loading: false));
        print('fail try: $e');
      }
    });
  }
}
