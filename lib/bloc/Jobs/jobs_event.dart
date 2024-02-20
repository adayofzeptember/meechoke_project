// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class Load_NewJobs extends JobsEvent {}

class Load_CurrentJobs extends JobsEvent {}

class Load_NewJob_Info extends JobsEvent {
  String joNumber;
  var context;

  Load_NewJob_Info({
    required this.context,
    required this.joNumber,
  });
}
