class Financial_Model {
  String? id;
  String? transferMethod;
  String? total;
  String? clearingDate;
  String? driverDebt;
  List<ExtClearingJob>? expanded_list;
  String? jobTotal;
  String? jobDocumentStatus;

  Financial_Model(
      {this.transferMethod,
      this.clearingDate,
      this.id,
      this.expanded_list,
      this.driverDebt,
      this.jobDocumentStatus,
      this.jobTotal,
      this.total});
}

class ExtClearingJob {
  String? documentNumber;
  String? jobStatus;
  String? jobTotal;
  String? allowance_total;
  String? highwayTotal;
  int? sum;
  String? advance_total;

  ExtClearingJob(
      {this.documentNumber,
      this.jobStatus,
      this.jobTotal,
      this.allowance_total,
      this.advance_total,
      this.sum,
      this.highwayTotal});
}
