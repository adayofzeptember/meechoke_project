// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool loading;
  LoginState({required this.loading});

  LoginState copyWith({
    bool? loading,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object> get props => [loading];
}
