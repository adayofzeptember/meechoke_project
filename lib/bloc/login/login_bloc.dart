import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meechoke_project/ETC/app_color.dart';
import 'package:meechoke_project/screens/menu_screen_employee.dart';
import 'package:meechoke_project/screens/menu_screen_registered_driver.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../ETC/api_url.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final dio = Dio();

  LoginBloc()
      : super(LoginState(
            loading: false,
            obscurePass: true,
            registeredCarId: '',
            registeredDriverId: '')) {
    on<Login_Casual>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

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

        print(
            response.statusCode.toString() + response.statusMessage.toString());
        emit(state.copyWith(
            loading: false,
            registeredDriverId:
                response.data['data']['user']['id'].toString()));

        prefs.setString('registeredDriverId',
            response.data['data']['user']['id'].toString());

        prefs.setString(
            'userToken', response.data['data']['accessToken'].toString());

        prefs.setString('loginType', response.data['loginType'].toString());

        print('auth token: ' + response.data['data']['accessToken'].toString());
        print('user type: ' + response.data['loginType'].toString());

        var currentCar = response.data['data']['user']['currentCar'];
        if (currentCar != null && currentCar['registeredCarId'] != null) {
          prefs.setString(
              'registeredCarId',
              response.data['data']['user']['currentCar']['registeredCarId']
                  .toString());
          emit(state.copyWith(
            registeredCarId: (response.data['data']['user']['currentCar']
                    ['registeredCarId']
                .toString()),
          ));
        } else {
          prefs.setString('registeredCarId', 'null');
        }
        //!

        if (response.data['loginType'].toString() == 'employee') {
          Navigator.pushReplacement(
            event.context,
            PageTransition(
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.fade,
                child: const MainMenu_Employee()),
          );
        } else {
          Navigator.pushReplacement(
            event.context,
            PageTransition(
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.fade,
                child: MainMenu_RegisteredDriver()),
          );
        }
        Fluttertoast.showToast(
            msg: "เข้าสู่ระบบแล้ว",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Palette.theGreen,
            textColor: Colors.white,
            fontSize: 15);
      }on DioException catch (e) {
        emit(state.copyWith(loading: false));
        print(e);

        if (e.toString().contains('422')) {
          Fluttertoast.showToast(
              msg: "ชื่อผู้่ใช้หรือรหัสผ่านไม่ถูกต้อง",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 133, 133, 133),
              textColor: const Color.fromARGB(255, 200, 110, 110),
              fontSize: 15);
        } else {
          Fluttertoast.showToast(
              msg: "ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้, โปรดลองใหม่อีกครั้ง",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 2,
              backgroundColor: const Color.fromARGB(255, 133, 133, 133),
              textColor: const Color.fromARGB(255, 200, 110, 110),
              fontSize: 15);
        }
      }
    });

    on<Logout_Auth>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? tokenAuth = prefs.getString('userToken');
      try {
        emit(state.copyWith(loading: true));
        final response = await dio.post(
          api_url + "logout",
          options: Options(
            headers: {
              // 'Accept': 'application/json',
              "Authorization": "Bearer $tokenAuth",
            },
          ),
        );
        emit(state.copyWith(loading: false));
        print('logout response: ' + response.statusMessage.toString());

        prefs.clear();

        Phoenix.rebirth(event.context);
        Fluttertoast.showToast(
            msg: "ออกจากระบบแล้ว",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: const Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
      } catch (e) {
        emit(state.copyWith(loading: false));
        prefs.clear();
        Phoenix.rebirth(event.context);
        Fluttertoast.showToast(
            msg: "ออกจากระบบแล้ว",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 2,
            backgroundColor: Color.fromARGB(255, 133, 133, 133),
            textColor: Colors.white,
            fontSize: 15);
      }
    });

    on<ShowPassword_Swap>((event, emit) {
      emit(state.copyWith(obscurePass: !state.obscurePass));
    });
  }
}
