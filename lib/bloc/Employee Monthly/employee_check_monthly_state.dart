part of 'employee_check_monthly_bloc.dart';

// ignore: must_be_immutable
class EmployeeCheckMonthlyState extends Equatable {
  List all_monthly_list;
  List all_monthly_done;
  bool isLoading;
  String dateMonth;

  EmployeeCheckMonthlyState(
      {required this.all_monthly_list,
      required this.all_monthly_done,
      required this.isLoading,
      required this.dateMonth});

  EmployeeCheckMonthlyState copyWith(
      {bool? isLoading,
      List? all_monthly_list,
      String? dateMonth,
      List? all_monthly_done}) {
    return EmployeeCheckMonthlyState(
      isLoading: isLoading ?? this.isLoading,
      dateMonth: dateMonth ?? this.dateMonth,
      all_monthly_list: all_monthly_list ?? this.all_monthly_list,
      all_monthly_done: all_monthly_done ?? this.all_monthly_done,
    );
  }

  @override
  List<Object> get props =>
      [all_monthly_list, isLoading, dateMonth, all_monthly_done];
}
