// ignore_for_file: must_be_immutable

part of 'fuel_bloc.dart';

class FuelState extends Equatable {
  List fuel_notYet_list;

  FuelState({
    required this.fuel_notYet_list,
  });

  FuelState copyWith({List? fuel_notYet_list}) {
    return FuelState(
      fuel_notYet_list: fuel_notYet_list ?? this.fuel_notYet_list,
    );
  }

  @override
  List<Object> get props => [fuel_notYet_list];
}
