// ignore_for_file: must_be_immutable

part of 'report_accident_bloc.dart';

sealed class ReportAccidentEvent extends Equatable {
  const ReportAccidentEvent();

  @override
  List<Object> get props => [];
}

class Load_VehicleDocs extends ReportAccidentEvent {}

class Upload_Pics extends ReportAccidentEvent {
  String type, collection;
  List<File>? files;
  Upload_Pics(
      {required this.type, required this.collection, required this.files});
}
