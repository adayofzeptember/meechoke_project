part of 'report_accident_bloc.dart';

// ignore: must_be_immutable
class ReportAccidentState extends Equatable {
  int page;
  bool isLoading;
  double lat, lng;
  List vehicle_Docs;
  
  String locationName;

  ReportAccidentState(
      {required this.page,
      required this.isLoading,
      required this.lat,
      required this.locationName,
      required this.lng,
      required this.vehicle_Docs});

  ReportAccidentState copyWith(
      {List? vehicle_Docs,
      int? page,
      String? locationName,
      bool? isLoading,
      double? lat,
      lng}) {
    return ReportAccidentState(
      vehicle_Docs: vehicle_Docs ?? this.vehicle_Docs,
      page: page ?? this.page,
      lat: lat ?? this.lat,
      locationName: locationName ?? this.locationName,
      lng: lng ?? this.lng,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props =>
      [vehicle_Docs, isLoading, page, lat, lng, locationName];
}
