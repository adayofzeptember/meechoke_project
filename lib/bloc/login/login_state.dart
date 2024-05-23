// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool loading;
  bool obscurePass;
  String registeredDriverId;
  String registeredCarId;
  LoginState(
      {required this.loading,
      required this.obscurePass,
      required this.registeredCarId,
      required this.registeredDriverId});

  LoginState copyWith(
      {bool? loading,
      bool? obscurePass,
      String? registeredDriverId,
      String? registeredCarId}) {
    return LoginState(
      loading: loading ?? this.loading,
      obscurePass: obscurePass ?? this.obscurePass,
      registeredCarId: registeredCarId ?? this.registeredCarId,
      registeredDriverId: registeredDriverId ?? this.registeredDriverId,
    );
  }

  @override
  List<Object> get props =>
      [loading, obscurePass, registeredDriverId, registeredCarId];
}
