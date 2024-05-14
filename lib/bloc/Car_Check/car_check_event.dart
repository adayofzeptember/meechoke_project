// ignore_for_file: must_be_immutable

part of 'car_check_bloc.dart';

sealed class CarCheckEvent extends Equatable {
  const CarCheckEvent();

  @override
  List<Object> get props => [];
}

class Load_CheckList extends CarCheckEvent {
  String? getCheckType;
  Load_CheckList({required this.getCheckType});
}

class Load_CheckList2 extends CarCheckEvent {}

class Count_PlusIndex extends CarCheckEvent {
  String? method;
  Count_PlusIndex({required this.method});
}

class Swap_Index_forButtones extends CarCheckEvent {
  int? getIndex;
  Swap_Index_forButtones({required this.getIndex});
}

class CheckupList_BlocAdd extends CarCheckEvent {
  List<ExtCheckupList_Item>? getExtCheckup_List;

  List<ExtCheckupEquipment_Item>? getExtEqipment_List;
  List<ExtCheckupSafety_Item>? getExtSafety_List;
  String? getTypeCheckToStore;
  CheckupList_BlocAdd(
      {this.getExtCheckup_List,
      this.getTypeCheckToStore,
      this.getExtSafety_List,
      this.getExtEqipment_List});
}
