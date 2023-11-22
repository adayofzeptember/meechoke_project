// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool loading;
  bool obscurePass;
  LoginState({required this.loading, required this.obscurePass});

  LoginState copyWith({
    bool? loading,
    bool? obscurePass,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      obscurePass: obscurePass ?? this.obscurePass,
    );
  }

  @override
  List<Object> get props => [loading, obscurePass];
}
