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

class Action_Status extends JobsEvent {
  String getJONumber;
  String getStatus;
  var context;

  Action_Status(
      {this.context, required this.getJONumber, required this.getStatus});
}
