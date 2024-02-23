//? ใช้ด้วยกันกับ current jobs
class Newjobs_List_Data {
  String? jobNumber;
  String? jobStatus;
  //  List<Checkin_Location>? checkin_location;
  String? pickupPoint;
  String? pickupDate;
  String? dropPoint;
  String? dropDate;

  Newjobs_List_Data({
    //this.checkin_location,
    this.jobNumber,
    
    this.jobStatus,
    this.pickupPoint,
    this.pickupDate,
    this.dropPoint,
    this.dropDate,
  });
}


class Checkin_Location {
 String? pickupPoint;
  String? pickupDate;
  String? dropPoint;
  String? dropDate;

   Checkin_Location({
  
    this.pickupPoint,
    this.pickupDate,
    this.dropPoint,
    this.dropDate,
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

  Job_Detail(
      {this.docNumber,
      this.docStatus,
      this.customerName,
      this.weight,
      this.amounts,
      this.pallet,
      this.detail,
      this.contactName,
      this.contactTel,
      this.inTheNameOf,
      this.collectMoney,
      this.distance,
      this.dod,
      this.remark});
}
