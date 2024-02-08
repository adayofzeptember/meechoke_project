// ignore_for_file: must_be_immutable

part of 'report2_bloc.dart';

class Report2State extends Equatable {
  bool isLoading;
  String statusCheck;
  List vehicle_Docs;

  Report2State(
      {required this.isLoading,
      required this.vehicle_Docs,
      required this.statusCheck});

  Report2State copyWith({List? vehicle_Docs, bool? isLoading, String? statusCheck}) {
    return Report2State(
      vehicle_Docs: vehicle_Docs ?? this.vehicle_Docs,
      isLoading: isLoading ?? this.isLoading,
      statusCheck: statusCheck ?? this.statusCheck,
    );
  }

  @override
  List<Object> get props => [vehicle_Docs, isLoading, statusCheck];
}
