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
    on<ProfileEvent>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      //print(tokenAuth);
      emit(state.copyWith(loading: true));
      try {
        final response = await dio.get(
          api_url_V1 + "profile",
          options: Options(headers: {
            // "Content-Type": "application/json",
            "Authorization": "Bearer $tokenAuth",
          }),
        );

        // print('--------' + response.data['data']['user']['username'].toString());

        dynamic dataProfile =
            (state.profile_data != '') ? state.profile_data : '';
        dynamic nestedData = response.data['data']['user'];
        if (response.statusCode == 200) {
          emit(state.copyWith(loading: false));
          dataProfile = Profile_Data(
            id: await nestedData['id'].toString(),
            name: await nestedData['name'].toString(),
          );

          emit(state.copyWith(
            profile_data: dataProfile,
            loading: false
          ));

          print(state.profile_data.name.toString());
        } else {
          emit(state.copyWith(loading: false));
          print('fail api: ${response}');
        }
      } catch (e) {
        emit(state.copyWith(loading: false));
        print('fail try: $e');
      }
    });
  }
}
