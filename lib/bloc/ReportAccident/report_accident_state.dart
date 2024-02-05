part of 'report_accident_bloc.dart';

// ignore: must_be_immutable
class ReportAccidentState extends Equatable {
  int page;
  bool isLoading;
  List vehicle_Docs;
  List productIns_Docs;

  ReportAccidentState(
      {required this.page,
      required this.isLoading,
      required this.productIns_Docs,
      required this.vehicle_Docs});

  ReportAccidentState copyWith({
    List? vehicle_Docs,
    List? productIns_Docs,
    int? page,
    bool? isLoading,

  }) {
    return ReportAccidentState(
      vehicle_Docs: vehicle_Docs ?? this.vehicle_Docs,
      page: page ?? this.page,
          productIns_Docs: productIns_Docs ?? this.productIns_Docs,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [vehicle_Docs, isLoading, page, productIns_Docs];
}