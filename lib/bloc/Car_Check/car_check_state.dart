// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

class CarCheckState extends Equatable {
  List checkList1;
  CarCheckState({required this.checkList1});

  CarCheckState copyWith({
    List? checkList1,
  }) {
    return CarCheckState(
      checkList1: checkList1 ?? this.checkList1,
    );
  }

  @override
  List<Object> get props => [checkList1];
}
