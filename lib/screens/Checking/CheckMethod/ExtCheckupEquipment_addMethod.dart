// ignore_for_file: unused_local_variable

class ExtCheckupEquipment_Item {
  int sysVehicleEquipmentId;
  String list;
  String result;
  int order;

  ExtCheckupEquipment_Item(
      {required this.sysVehicleEquipmentId,
      required this.list,
      required this.result,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleEquipmentId': sysVehicleEquipmentId,
      'list': list,
      'result': result,
      'order': order
    };
  }

  static List<ExtCheckupEquipment_Item> checklistEquipment = [];
  static void addItem2({
    required int sysVehicleEquipmentId,
    required String list,
    required String result,
    required int order,
  }) {
    checklistEquipment.add(ExtCheckupEquipment_Item(
        sysVehicleEquipmentId: sysVehicleEquipmentId,
        list: list,
        result: result,
        order: order));

    List<Map<String, dynamic>> jsonList1 =
        ExtCheckupEquipment_Item.checklistEquipment.map((item) => item.toJson()).toList();



  }

}



