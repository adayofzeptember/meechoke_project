// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

class CarCheckState extends Equatable {
  int indexButtonSelect;
  List fetched_checkList1;

  int toCheckChecklist1;
  List<ExtCheckupList_Item> storedExtCheckupList1;
  int countIndexCheck;
  CarCheckState(
      {required this.fetched_checkList1,
      required this.toCheckChecklist1,
      required this.storedExtCheckupList1,
      required this.countIndexCheck,
      required this.indexButtonSelect});

  CarCheckState copyWith(
      {List? fetched_checkList1,
      int? indexButtonSelect,
      int? countIndexCheck,
      int? toCheckChecklist1,
      List<ExtCheckupList_Item>? storedExtCheckupList1,
      List? test}) {
    return CarCheckState(
      fetched_checkList1: fetched_checkList1 ?? this.fetched_checkList1,
      toCheckChecklist1: toCheckChecklist1 ?? this.toCheckChecklist1,
      storedExtCheckupList1: storedExtCheckupList1 ?? this.storedExtCheckupList1,
      countIndexCheck: countIndexCheck ?? this.countIndexCheck,
      indexButtonSelect: indexButtonSelect ?? this.indexButtonSelect,
    );
  }

  @override
  List<Object> get props => [
        fetched_checkList1,
        countIndexCheck,
        indexButtonSelect,
        toCheckChecklist1,
        storedExtCheckupList1
      ];
}
