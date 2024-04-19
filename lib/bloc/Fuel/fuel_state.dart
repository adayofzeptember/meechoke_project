// ignore_for_file: must_be_immutable

part of 'fuel_bloc.dart';

class FuelState extends Equatable {
  List fuel_notYet_list;
  List fuel_filled_list;
  int status1;
  int status2_info;
  dynamic fuelInfo;
  bool isLoading;

  FuelState({
    required this.status2_info,
    required this.fuelInfo,
    required this.isLoading,
    required this.status1,
    required this.fuel_filled_list,
    required this.fuel_notYet_list,
  });

  FuelState copyWith(
      {List? fuel_notYet_list,
      int? status1,
      bool? isLoading,
      List? fuel_filled_list,
      int? status2_info,
      dynamic fuelInfo}) {
    return FuelState(
      isLoading: isLoading ?? this.isLoading,
      fuelInfo: fuelInfo ?? this.fuelInfo,
      status2_info: status2_info ?? this.status2_info,
      status1: status1 ?? this.status1,
      fuel_filled_list: fuel_filled_list ?? this.fuel_filled_list,
      fuel_notYet_list: fuel_notYet_list ?? this.fuel_notYet_list,
    );
  }

  @override
  List<Object> get props => [
        fuel_notYet_list,
        status1,
        status2_info,
        fuelInfo,
        isLoading,
        fuel_filled_list
      ];
}
