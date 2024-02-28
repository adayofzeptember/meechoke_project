// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class TEST extends JobsEvent {}

class Load_NewJobs extends JobsEvent {}

class Load_CurrentJobs extends JobsEvent {}

class Load_Job_Info extends JobsEvent {
  String checkPage;
  String joNumber;
  var context;

  Load_Job_Info(
      {required this.context, required this.joNumber, required this.checkPage});
}




class Action_Status extends JobsEvent {
  String getJONumber;
  String getStatus;
  var context;

  Action_Status(
      {this.context, required this.getJONumber, required this.getStatus});
}

class FinishTheJob extends JobsEvent {
  String type, getJoNumber, check;
  var context;

  FinishTheJob(
      {required this.context, required this.getJoNumber, required this.type, required this.check});
}

class Upload_Pics_Jobs extends JobsEvent {
  String type, getJoNumber, check;
  var context;
  List<File>? files;
  bool? hasDeliveredOverTime, hasPickedOverTime, hasFinished;

  Upload_Pics_Jobs({
    required this.getJoNumber,
    required this.files,
    required this.type,
    required this.check,
    required this.context,
    this.hasDeliveredOverTime,
    this.hasPickedOverTime,
    this.hasFinished
  });
}
