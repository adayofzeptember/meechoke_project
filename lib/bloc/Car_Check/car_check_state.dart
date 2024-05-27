// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

class CarCheckState extends Equatable {
  int indexButtonSelect;
  bool isLoading;
  bool twty4Check;
  Duration remainingTime;
  int checkLoad;
  List fetched_checkList1;
  int toCheckChecklist1;
  List<ExtCheckupList_Item> storedExtCheckupList1;
  List<ExtCheckupEquipment_Item> storedExtCheckupEquipment2;
  List<ExtCheckupSafety_Item> storedExtCheckupSafety3;
  int countIndexCheck;
  String typeCheckState;
  CarCheckState(
      {required this.fetched_checkList1,
      required this.twty4Check,
      required this.remainingTime,
      required this.storedExtCheckupEquipment2,
      required this.storedExtCheckupSafety3,
      required this.toCheckChecklist1,
      required this.checkLoad,
      required this.typeCheckState,
      required this.isLoading,
      required this.storedExtCheckupList1,
      required this.countIndexCheck,
      required this.indexButtonSelect});

  CarCheckState copyWith(
      {List? fetched_checkList1,
      int? indexButtonSelect,
      int? countIndexCheck,
      String? typeCheckState,
      int? checkLoad,
      bool? isLoading,
      bool? twty4Check,
        Duration? remainingTime,
      int? toCheckChecklist1,
      List<ExtCheckupList_Item>? storedExtCheckupList1,
      List<ExtCheckupEquipment_Item>? storedExtCheckupEquipment2,
      List<ExtCheckupSafety_Item>? storedExtCheckupSafety3,
      List? test}) {
    return CarCheckState(
      twty4Check: twty4Check ?? this.twty4Check,
      isLoading: isLoading ?? this.isLoading,
      remainingTime: remainingTime ?? this.remainingTime,
      checkLoad: checkLoad ?? this.checkLoad,
      typeCheckState: typeCheckState ?? this.typeCheckState,
      fetched_checkList1: fetched_checkList1 ?? this.fetched_checkList1,
      toCheckChecklist1: toCheckChecklist1 ?? this.toCheckChecklist1,
      storedExtCheckupList1:
          storedExtCheckupList1 ?? this.storedExtCheckupList1,
      storedExtCheckupEquipment2:
          storedExtCheckupEquipment2 ?? this.storedExtCheckupEquipment2,
      storedExtCheckupSafety3:
          storedExtCheckupSafety3 ?? this.storedExtCheckupSafety3,
      countIndexCheck: countIndexCheck ?? this.countIndexCheck,
      indexButtonSelect: indexButtonSelect ?? this.indexButtonSelect,
    );
  }

  @override
  List<Object> get props => [
        checkLoad,
        twty4Check,
        typeCheckState,
        fetched_checkList1,
        isLoading,
        storedExtCheckupSafety3,
        storedExtCheckupEquipment2,
        storedExtCheckupList1,
        countIndexCheck,
        indexButtonSelect,
        remainingTime,
        toCheckChecklist1,
      ];
}
