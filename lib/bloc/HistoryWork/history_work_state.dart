part of 'history_work_bloc.dart';

// ignore: must_be_immutable
class HistoryWorkState extends Equatable {
  String month;
  String year;
  String status;
  String count;
  String total;
  String errorMsg;
  List workhistory_list;

  HistoryWorkState(
      {required this.month,
      required this.year,
      required this.count,
      required this.errorMsg,
      required this.total,
      required this.workhistory_list,
      required this.status});

  HistoryWorkState copyWith(
      {String? month,
      String? year,
      String? status,
      String? errorMsg,
      String? count,
      List? workhistory_list,
      String? total}) {
    return HistoryWorkState(
      year: year ?? this.year,
      count: count ?? this.count,
      status: status ?? this.status,
      total: total ?? this.total,
      errorMsg: errorMsg ?? this.errorMsg,
      workhistory_list: workhistory_list ?? this.workhistory_list,
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props =>
      [month, year, status, count, total, errorMsg, workhistory_list];
}
