// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

class JobsState extends Equatable {
  int status;
  List newjobs_list;

  int status2;
  int status3Detail;
  List currentjobs_list;
  dynamic newjob_info;
  bool isLoading;

  JobsState(
      {required this.newjobs_list,
      required this.status,
      required this.status3Detail,
      required this.status2,
            required this.isLoading,
      required this.newjob_info,
      required this.currentjobs_list});

  JobsState copyWith({
    List? newjobs_list,
    int? status,
      bool? isLoading,
    int? status3Detail,
    dynamic newjob_info,
    List? currentjobs_list,
    int? status2,
  }) {
    return JobsState(
      newjobs_list: newjobs_list ?? this.newjobs_list,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
      status3Detail: status3Detail ?? this.status3Detail,
      newjob_info: newjob_info ?? this.newjob_info,
      currentjobs_list: currentjobs_list ?? this.currentjobs_list,
      status2: status2 ?? this.status2,
    );
  }

  @override
  List<Object> get props => [
        newjobs_list,
        status,
        currentjobs_list,
        status2,
        newjob_info,
        status3Detail,
        isLoading

      ];
}
