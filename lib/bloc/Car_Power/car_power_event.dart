// ignore_for_file: must_be_immutable

part of 'car_power_bloc.dart';

sealed class CarPowerEvent extends Equatable {
  const CarPowerEvent();

  @override
  List<Object> get props => [];
}

class CarGroup_OnButtonPressedIndex extends CarPowerEvent {
  int? getIndex;
  CarGroup_OnButtonPressedIndex({required this.getIndex});
}


class CarType_OnButtonPressedIndex extends CarPowerEvent {
  int? getIndex;
  String?  check;
  CarType_OnButtonPressedIndex({required this.getIndex, this.check});
}