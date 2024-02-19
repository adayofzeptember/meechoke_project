// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

class JobsState extends Equatable {
  int status;
  List newjobs_list;
  int status2;
  List currentjobs_list;

  JobsState(
      {required this.newjobs_list,
      required this.status,
      required this.status2,
      required this.currentjobs_list});

  JobsState copyWith({
    List? newjobs_list,
    int? status,
    List? currentjobs_list,
    int? status2,
  }) {
    return JobsState(
      newjobs_list: newjobs_list ?? this.newjobs_list,
      status: status ?? this.status,
      currentjobs_list: currentjobs_list ?? this.currentjobs_list,
      status2: status2 ?? this.status2,
    );
  }

  @override
  List<Object> get props => [newjobs_list, status, currentjobs_list, status2];
}
