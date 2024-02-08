// ignore_for_file: must_be_immutable

part of 'report_accident_bloc.dart';

class ReportAccidentEvent extends Equatable {
  const ReportAccidentEvent();

  @override
  List<Object> get props => [];
}

class Load_VehicleDocs extends ReportAccidentEvent {}

class Remove_Docs extends ReportAccidentEvent {}

class EmitLatLng extends ReportAccidentEvent {
  // double? getLat, getLong;
  var context;
  EmitLatLng({required this.context});
}

class GetLocationName extends ReportAccidentEvent {
 
}

class Upload_Pics_andReport extends ReportAccidentEvent {
  String type, collection;
  var context;
  List<File>? files;
  String? getRemark;

  Upload_Pics_andReport({
    required this.type,
    required this.collection,
    required this.files,
    required this.context,
    this.getRemark,
  });
}
