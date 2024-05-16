// ignore_for_file: unused_local_variable

class ExtCheckupList_Item {
  int sysVehicleChecklistId;
  String list;
  String result;
  int order;


  ExtCheckupList_Item(
      {required this.sysVehicleChecklistId,
      required this.list,

      required this.result,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleChecklistId': sysVehicleChecklistId,
      'list': list,
      'result': result,
      'order': order,
      
    };
  }

  static List<ExtCheckupList_Item> checklist = [];
  static void addItem1({
    required int sysVehicleChecklistId,
    required String list,
    required String result,
    required int order,
    
  }) {
    checklist.add(ExtCheckupList_Item(
        sysVehicleChecklistId: sysVehicleChecklistId,
        list: list,
        result: result,
        order: order));

    List<Map<String, dynamic>> jsonList1 =
        ExtCheckupList_Item.checklist.map((item) => item.toJson()).toList();

    // Print JSON list
    print(jsonList1);
    // print(jsonList.length);
  }

  
}



