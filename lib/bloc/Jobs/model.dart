//? ใช้ด้วยกันกับ current jobs
class Jobs_List_Data {
  String? jobNumber;
  String? jobStatus;
  String? currentStatus;
  List<Checkin_Location>? checkin_location;


  Jobs_List_Data({
    this.jobNumber,
    this.jobStatus,
    this.currentStatus,
    this.checkin_location,

  });
}

class Checkin_Location {
  String? point;
  String? date;
  String? checkinCategory;
  Checkin_Location({
    this.checkinCategory,
    this.point,
    this.date,
  });
}

class Job_Detail {
  String? docNumber;
  String? docStatus;
  String? customerName;
  String? weight;
  String? amounts;
  String? pallet;
  String? detail;
  String? contactName;
  String? contactTel;
  String? inTheNameOf;
  String? collectMoney;
  String? distance;
  String? remark;
  String? dod;
  String? current_status;
  List<Checkin_Location>? checkInLocation_Info;

  Job_Detail(
      {this.docNumber,
      this.docStatus,
      this.customerName,
      this.weight,
      this.amounts,
      this.pallet,
      this.detail,
      this.contactName,
      this.checkInLocation_Info,
      this.contactTel,
      this.inTheNameOf,
      this.collectMoney,
      this.distance,
      this.current_status,
      this.dod,
      this.remark});
}
