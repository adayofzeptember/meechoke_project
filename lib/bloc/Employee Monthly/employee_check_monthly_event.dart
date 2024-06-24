part of 'employee_check_monthly_bloc.dart';

sealed class EmployeeCheckMonthlyEvent extends Equatable {
  const EmployeeCheckMonthlyEvent();

  @override
  List<Object> get props => [];
}

class Load_All_MonthList extends EmployeeCheckMonthlyEvent {}

class Load_Done_MonthList extends EmployeeCheckMonthlyEvent {}