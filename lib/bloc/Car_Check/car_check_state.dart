// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

class CarCheckState extends Equatable {
  int indexButtonSelect;
  List checkList1;
   List test;
  int countIndexCheck;
  CarCheckState(
      {required this.checkList1,
      required this.test,
      required this.countIndexCheck,
      required this.indexButtonSelect});

  CarCheckState copyWith(
      {List? checkList1, int? indexButtonSelect, int? countIndexCheck, List? test}) {
    return CarCheckState(
      checkList1: checkList1 ?? this.checkList1,
      test: test ?? this.test,
      countIndexCheck: countIndexCheck ?? this.countIndexCheck,
      indexButtonSelect: indexButtonSelect ?? this.indexButtonSelect,

    );
  }

  @override
  List<Object> get props => [checkList1, countIndexCheck, indexButtonSelect, test];
}
