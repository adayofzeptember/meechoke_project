//!
//? ใช้ด้วยกันกับ current jobs
//*
//
class Jobs_List_Data {
  String? jobNumber, first, last;
  String? jobStatus;
  String? currentStatus;
  List<Checkin_Location>? checkin_location;

  Jobs_List_Data({
    this.jobNumber,
    this.first,
    this.last,
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
  String? productName;
  String? amounts;
  String? pallet;
  String? detail;
  String? transportAmount;
  String? contactName;
  String? contactTel;
  String? inTheNameOf;
  String? collectMoney;
  String? distance;
  String? allowanceDriver;
  String? remark;
  String? dod;
  int? checkLocationID;
  String? current_status;
  List<Checkin_Location>? checkInLocation_Info;
  List<Location_Images>? img_info;
  //*
  Current_Location? currentLocation;
  String? unitType;
  Job_Detail(
      {this.currentLocation,
      //*
      this.docNumber,
      this.allowanceDriver,
      this.docStatus,
      this.customerName,
      this.transportAmount,
      this.weight,
      this.productName,
      this.img_info,
      this.amounts,
      this.pallet,
      this.detail,
      this.checkLocationID,
      this.contactName,
      this.checkInLocation_Info,
      this.contactTel,
      this.inTheNameOf,
      this.collectMoney,
      this.unitType,
      this.distance,
      this.current_status,
      this.dod,
      this.remark});
}

class Location_Images {
  String? checkinCategory;
  String? imgURL;
  String? timeStamp;

  Location_Images({this.checkinCategory, this.imgURL, this.timeStamp});
}

class Checkin_Location {
  String? point;
  String? date;
  String? checkinCategory;
  String? time;
  String? lat, lng;
  String? first, last;

  Checkin_Location(
      {this.checkinCategory,
      this.point,
      this.date,
      this.time,
      this.lat,
      this.first,
      this.last,
      this.lng});
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
