// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

class CarCheckState extends Equatable {
  int indexButtonSelect;
  List checkList1;

  int toCheckChecklist1;
  List<CheckupResult_Item> storedChecklist1;
  int countIndexCheck;
  CarCheckState(
      {required this.checkList1,
      required this.toCheckChecklist1,
      required this.storedChecklist1,
      required this.countIndexCheck,
      required this.indexButtonSelect});

  CarCheckState copyWith(
      {List? checkList1,
      int? indexButtonSelect,
      int? countIndexCheck,
      int? toCheckChecklist1,
      List<CheckupResult_Item>? storedChecklist1,
      List? test}) {
    return CarCheckState(
      checkList1: checkList1 ?? this.checkList1,
      toCheckChecklist1: toCheckChecklist1 ?? this.toCheckChecklist1,
      storedChecklist1: storedChecklist1 ?? this.storedChecklist1,
      countIndexCheck: countIndexCheck ?? this.countIndexCheck,
      indexButtonSelect: indexButtonSelect ?? this.indexButtonSelect,
    );
  }

  @override
  List<Object> get props => [
        checkList1,
        countIndexCheck,
        indexButtonSelect,
        toCheckChecklist1,
        storedChecklist1
      ];
}
