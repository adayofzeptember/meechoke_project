part of 'report_accident_bloc.dart';

sealed class ReportAccidentEvent extends Equatable {
  const ReportAccidentEvent();

  @override
  List<Object> get props => [];
}

class Load_VehicleDocs extends ReportAccidentEvent {}
