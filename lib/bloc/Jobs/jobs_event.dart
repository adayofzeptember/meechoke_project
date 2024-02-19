part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}


class Load_NewJobs extends JobsEvent {}
class Load_CurrentJobs extends JobsEvent {}

