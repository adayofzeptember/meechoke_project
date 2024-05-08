part of 'financial_bloc.dart';

// ignore: must_be_immutable
class FinancialState extends Equatable {
  List financial_list;
  int status1;

  FinancialState({
    required this.status1,
    required this.financial_list,
  });

  FinancialState copyWith({
    List? financial_list,
    int? status1,
  }) {
    return FinancialState(
      financial_list: financial_list ?? this.financial_list,
      status1: status1 ?? this.status1,
    );
  }

  @override
  List<Object> get props => [financial_list];
}
