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
  int? checkLocationID;
  String? current_status;
  List<Checkin_Location>? checkInLocation_Info;
  //*
  Current_Location? currentLocation;

  Job_Detail(
      {this.currentLocation,
      //*
      this.docNumber,
      this.docStatus,
      this.customerName,
      this.weight,
      this.amounts,
      this.pallet,
      this.detail,
      this.checkLocationID,
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

class Current_Location {
  int? currentLocation_id;
  String? currentLocation_point;
  String? currentLocation_date;
  String? currentLocation_checkinCategory;
  Current_Location({
    this.currentLocation_id,
    this.currentLocation_checkinCategory,
    this.currentLocation_point,
    this.currentLocation_date,
  });
}