// ignore_for_file: must_be_immutable

part of 'employee_check_monthly_bloc.dart';

sealed class EmployeeCheckMonthlyEvent extends Equatable {
  const EmployeeCheckMonthlyEvent();

  @override
  List<Object> get props => [];
}

class Load_All_MonthList extends EmployeeCheckMonthlyEvent {}

class Load_Done_MonthList extends EmployeeCheckMonthlyEvent {}

class GetCheckList_ByIndex extends EmployeeCheckMonthlyEvent {
  int? getIndex;
  String? getTypeCheckList;

  GetCheckList_ByIndex({this.getIndex, this.getTypeCheckList});
}
