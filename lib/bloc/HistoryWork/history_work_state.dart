part of 'history_work_bloc.dart';

// ignore: must_be_immutable
class HistoryWorkState extends Equatable {
  String month;
  String year;
  String status;
  String count;
  String total;
    List workhistory_list;

  HistoryWorkState(

      {required this.month,
      required this.year,
      required this.count,
      required this.total,
        required this.workhistory_list,
      required this.status});

  HistoryWorkState copyWith(
      {String? month,
      String? year,
      String? status,
      String? count,
      List? workhistory_list,
      String? total}) {
    return HistoryWorkState(
      year: year ?? this.year,
      count: count ?? this.count,
      status: status ?? this.status,
      total: total ?? this.total,
      workhistory_list: workhistory_list ?? this.workhistory_list,
      month: month ?? this.month,
    );
  }

  @override
  List<Object> get props => [month, year, status, count, total, workhistory_list];
}
