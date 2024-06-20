// ignore_for_file: must_be_immutable

part of 'car_power_bloc.dart';

class CarPowerState extends Equatable {
  int car_group_selectedButtonIndex;
  String car_group_name;
  int car_type_selectedButtonIndex;
  CarPowerState(
      {required this.car_group_selectedButtonIndex,
      required this.car_group_name,
      required this.car_type_selectedButtonIndex});

  CarPowerState copyWith({
    String? car_group_name,
    int? car_group_selectedButtonIndex,
    int? car_type_selectedButtonIndex,
  }) {
    return CarPowerState(
      car_group_name: car_group_name ?? this.car_group_name,
      car_group_selectedButtonIndex:
          car_group_selectedButtonIndex ?? this.car_group_selectedButtonIndex,
      car_type_selectedButtonIndex:
          car_type_selectedButtonIndex ?? this.car_type_selectedButtonIndex,
    );
  }

  @override
  List<Object> get props => [
        car_group_selectedButtonIndex,
        car_group_name,
        car_type_selectedButtonIndex
      ];
}
