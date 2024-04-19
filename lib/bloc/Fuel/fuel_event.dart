// ignore_for_file: must_be_immutable

part of 'fuel_bloc.dart';

class FuelEvent extends Equatable {
  const FuelEvent();

  @override
  List<Object> get props => [];
}

class Load_FuelNotYet extends FuelEvent {}
class Load_Filled extends FuelEvent {}

class Load_Fuel_Info extends FuelEvent {
  String checkPage;
  String joNumber;
  var context;

  Load_Fuel_Info(
      {required this.context, required this.joNumber, required this.checkPage});
}

class Upload_Pics_Fuel extends FuelEvent {
  int fuel_id;
  String type, collection;
  var context;
  List<File>? files;
  String? getRemark;

  Upload_Pics_Fuel({
    required this.fuel_id,
    required this.type,
    required this.collection,
    required this.files,
    required this.context,
    this.getRemark,
  });
}

