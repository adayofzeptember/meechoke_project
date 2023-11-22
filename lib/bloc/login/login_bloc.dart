import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ETC/api_url.dart';
import '../../screens/menu_screen.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final dio = Dio();
  LoginBloc() : super(LoginState(loading: false, obscurePass: true)) {
    //*---------------------------------------------------------------
    on<Login_Casual>((event, emit) async {
      try {
        emit(state.copyWith(loading: true));
        final response = await dio.post(api_url + "authenticate",
            options: Options(
              headers: {
                'Accept': 'application/json',
              },
            ),
            data: json.encode({
              "username": event.getUsername,
              "password": event.getPassword,
            }));
        emit(state.copyWith(loading: false));
        print('auth token: ' + response.data['data']['accessToken'].toString());
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'userToken', response.data['data']['accessToken'].toString());
        Navigator.pushReplacement(
          event.context,
          PageTransition(
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.fade,
              child: const MainMenu_Page()),
        );
      } catch (e) {
        emit(state.copyWith(loading: false));
        Fluttertoast.showToast(
            msg:
                "ไม่พบบัญชีผู้ใช้ในระบบ, สมัครบัญชีใหม่หรือตรวจสอบชื่อผู้ใช้และรหัสผ่านอีกครั้ง \n ${e.toString()}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
      }
    });

    //?---------------------------------------------------------------
    on<ShowPassword_Swap>((event, emit) {
      if (state.obscurePass == false) {
        emit(state.copyWith(obscurePass: true));
      } else {
        emit(state.copyWith(obscurePass: false));
      }
    });
  }
}
