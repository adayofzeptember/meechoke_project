// ignore_for_file: unused_local_variable

import 'package:meechoke_project/screens/Checking/CheckMethod/filenames.dart';

class ExtCheckupList_Item {
  int sysVehicleChecklistId;
  String list;
  String result;
  int order;
  Map<String, List<FileInformation>>? filenames;

  ExtCheckupList_Item(
      {required this.sysVehicleChecklistId,
      required this.list,
      required this.result,
      this.filenames,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleChecklistId': sysVehicleChecklistId,
      'list': list,
      'result': result,
      'order': order,
      'filenames': filenames?.map((key, value) =>
          MapEntry(key, value.map((file) => file.toJson()).toList())),
    };
  }

  static List<ExtCheckupList_Item> checklist = [];
  static void addItem1({
    required int sysVehicleChecklistId,
    required String list,
    required String result,
    required int order,
    Map<String, List<FileInformation>>? filenames,
  }) {
    checklist.add(ExtCheckupList_Item(
        sysVehicleChecklistId: sysVehicleChecklistId,
        list: list,
        result: result,
        filenames: filenames,
        order: order));

    List<Map<String, dynamic>> jsonList1 =
        ExtCheckupList_Item.checklist.map((item) => item.toJson()).toList();

    print(jsonList1);
  }
}
