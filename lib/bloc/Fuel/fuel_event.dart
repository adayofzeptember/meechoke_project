// ignore_for_file: must_be_immutable

part of 'fuel_bloc.dart';

class FuelEvent extends Equatable {
  const FuelEvent();

  @override
  List<Object> get props => [];
}

class Load_FuelNotYet extends FuelEvent {}

class Load_Fuel_Info extends FuelEvent {
  // String checkPage;
  String joNumber;
  var context;

  Load_Fuel_Info(
      {required this.context, required this.joNumber});
}
