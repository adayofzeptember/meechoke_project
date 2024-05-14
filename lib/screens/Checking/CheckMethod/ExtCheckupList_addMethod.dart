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
      'order': order
    };
  }

  static List<ExtCheckupList_Item> checklist = [];
  static void addItem({
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

  // static List<ExtCheckupList_Item> checklist2 = [];
  // static void addItem2({
  //   required int sysVehicleChecklistId,
  //   required String list,
  //   required String result,
  //   required int order,
  // }) {
  //   checklist2.add(ExtCheckupList_Item(
  //       sysVehicleChecklistId: sysVehicleChecklistId,
  //       list: list,
  //       result: result,
  //       order: order));

  //   List<Map<String, dynamic>> jsonList =
  //       ExtCheckupList_Item.checklist2.map((item) => item.toJson()).toList();

  //   // Print JSON list
  //   // print(jsonList);
  //   // print(jsonList.length);
  // }
}


// void main() {
//   // Add items to the checklist
//   ChecklistItem.addItem(
//       sysVehicleChecklistId: 1, list: 'ปั๊มน้ำมัน', result: 'ปกติ', order: 1);
//   ChecklistItem.addItem(
//       sysVehicleChecklistId: 2, list: 'พวง', result: 'ปกติ', order: 1);

//   // Convert checklist items to JSON
//   List<Map<String, dynamic>> jsonList =
//       ChecklistItem.checklist.map((item) => item.toJson()).toList();

//   // Print JSON list
//   print(jsonList);
// }
