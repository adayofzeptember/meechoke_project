// ignore_for_file: unused_local_variable

class ExtCheckupSafety_Item {
  int sysVehicleChecklistId;
  String list;
  String result;
  int order;

  ExtCheckupSafety_Item(
      {required this.sysVehicleChecklistId,
      required this.list,
      required this.result,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleChecklistId': sysVehicleChecklistId,
      'list': list,
      'result': result,
      'order': order
    };
  }

  static List<ExtCheckupSafety_Item> checklistExtCheckupSafety_Item = [];
  static void addItem3({
    required int sysVehicleChecklistId,
    required String list,
    required String result,
    required int order,
  }) {
    checklistExtCheckupSafety_Item.add(ExtCheckupSafety_Item(
        sysVehicleChecklistId: sysVehicleChecklistId,
        list: list,
        result: result,
        order: order));

    List<Map<String, dynamic>> jsonList1 =
        ExtCheckupSafety_Item.checklistExtCheckupSafety_Item.map((item) => item.toJson()).toList();



 
  }


}

