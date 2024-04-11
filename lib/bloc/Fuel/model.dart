class Fuel_Model {
  String? id;
  String? date;
  String? jo_number;
  String? doc_number;
  String? status;
  String? location_name;
  String? volum;
  String? remark;

  Fuel_Model({
    this.id,
    this.date,
    this.jo_number,
    this.doc_number,
    this.status,
    this.location_name,
    this.volum,
    this.remark,
  });
}

class Fuel_Info {
  String? id;
  String? date;
  String? jo_number;
  String? doc_number;
  String? status;
  String? location_name;
  String? fuelType;
  String? fuelGroup;
  String? volum;
  String? totalprice;
  String? paymentMethod;
  String? cardNumber;
  String? creditRemains;
  String? remark;

  Fuel_Info({
    this.id,
    this.date,
    this.jo_number,
    this.doc_number,
    this.status,
    this.location_name,
    this.fuelGroup,
    this.fuelType,
    this.totalprice,
    this.paymentMethod,
    this.cardNumber,
    this.creditRemains,
    this.volum,
    this.remark,
  });
}
