// ignore_for_file: must_be_immutable

part of 'fuel_bloc.dart';

class FuelState extends Equatable {
  List fuel_notYet_list;
  int status1;
  int status2_info;
  dynamic fuelInfo;

  FuelState({
    required this.status2_info,
    required this.fuelInfo,
    required this.status1,
    required this.fuel_notYet_list,
  });

  FuelState copyWith(
      {List? fuel_notYet_list,
      int? status1,
      int? status2_info,
      dynamic fuelInfo}) {
    return FuelState(
      fuelInfo: fuelInfo ?? this.fuelInfo,
            status2_info: status2_info ?? this.status2_info,
      status1: status1 ?? this.status1,
      fuel_notYet_list: fuel_notYet_list ?? this.fuel_notYet_list,
    );
  }

  @override
  List<Object> get props => [fuel_notYet_list, status1, status2_info, fuelInfo];
}
