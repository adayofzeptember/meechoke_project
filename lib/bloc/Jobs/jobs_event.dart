// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

sealed class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class TEST extends JobsEvent {}

class Load_NewJobs extends JobsEvent {
  var context;
  Load_NewJobs(
      {required this.context});
}

class Load_CurrentJobs extends JobsEvent {}

class Load_Job_Info extends JobsEvent {
  String checkPage;
  String joNumber;
  var context;

  Load_Job_Info(
      {required this.context, required this.joNumber, required this.checkPage});
}

class Load_Job_Info2 extends JobsEvent {
  String checkPage;
  String joNumber;
  var context;

  Load_Job_Info2(
      {required this.context, required this.joNumber, required this.checkPage});
}



class Get_Allowance extends JobsEvent {
  var context;
  String getJONumber;

  Get_Allowance({this.context,required  this.getJONumber});
}

class Action_Finish extends JobsEvent {
  String getJONumber;
  String getStatus;
  var context;

  Action_Finish(
      {this.context, required this.getJONumber, required this.getStatus});
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
      {required this.context,
      required this.getJoNumber,
      required this.type,
      required this.check});
}

class Process_Page extends JobsEvent {
  String getJoNumber;
  var context;

  Process_Page({required this.context, required this.getJoNumber});
}

class Upload_Pics_Jobs extends JobsEvent {
  String type, getJoNumber, imageFileName;
  var context;
  int getCurrentLocationID;
  List<File>? files;
  bool? hasDeliveredOverTime, hasPickedOverTime, hasFinished;

  Upload_Pics_Jobs(
      {required this.getJoNumber,
      required this.files,
      required this.type,
      required this.getCurrentLocationID,
      required this.imageFileName,
      required this.context,
      this.hasDeliveredOverTime,
      this.hasPickedOverTime,
      this.hasFinished});
}
