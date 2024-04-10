// ignore_for_file: must_be_immutable

part of 'history_work_bloc.dart';

class HistoryWorkEvent extends Equatable {
  const HistoryWorkEvent();

  @override
  List<Object> get props => [];
}

class GetDate extends HistoryWorkEvent {
  String? getMonth;
  String? getYear;

  GetDate(
      {this.getMonth, this.getYear});
}

class LoadHistoryWorks extends HistoryWorkEvent {

}