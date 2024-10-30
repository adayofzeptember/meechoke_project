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

class Test_Employee extends CarCheckEvent {
  int getIndex;
  String getCheckType;
  Test_Employee({required this.getCheckType, required this.getIndex});
}

class Load_CheckList2 extends CarCheckEvent {}

class Count_PlusIndex extends CarCheckEvent {
  // String? method;
  // Count_PlusIndex({required this.method});
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

class AddItem_Bloc extends CarCheckEvent {
  File? fileImage;

  AddItem_Bloc({this.fileImage});
}

class CountDown_RemainingTime extends CarCheckEvent {
  Duration getTime;

  CountDown_RemainingTime({required this.getTime});
}

class Daily_Check extends CarCheckEvent {}

class Empty_Check extends CarCheckEvent {}

class AddEachItem_Bloc extends CarCheckEvent {
  File? fileImage;

  AddEachItem_Bloc({this.fileImage});
}

class Submit_AllCheckings extends CarCheckEvent {
  String? getCheckupID;
  String? getCarID;
  String? getDriverID;
  var context;

  Submit_AllCheckings(
      {this.getCheckupID,
      this.getCarID,
      this.getDriverID,
      required this.context});
}
