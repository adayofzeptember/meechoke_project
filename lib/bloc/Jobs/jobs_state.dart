// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

class JobsState extends Equatable {
  int status;
  List newjobs_list;
  int status2;
  int status3Detail;
  List currentjobs_list;
  dynamic job_info;
  bool isLoading;
  int count;

  JobsState(
      {required this.newjobs_list,
      required this.status,
      required this.count,
      required this.status3Detail,
      required this.status2,
      required this.isLoading,
      required this.job_info,
      required this.currentjobs_list});

  JobsState copyWith({
    List? newjobs_list,
    int? status,
    int? count,
    bool? isLoading,
    int? status3Detail,
    dynamic job_info,
    List? currentjobs_list,
    int? status2,
  }) {
    return JobsState(
      status2: status2 ?? this.status2,
      newjobs_list: newjobs_list ?? this.newjobs_list,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      status3Detail: status3Detail ?? this.status3Detail,
      job_info: job_info ?? this.job_info,
      currentjobs_list: currentjobs_list ?? this.currentjobs_list,
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [
        newjobs_list,
        count,
        status,
        currentjobs_list,
        status2,
        job_info,
        status3Detail,
        isLoading
      ];
}
