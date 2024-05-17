// ignore_for_file: unused_local_variable

import 'package:meechoke_project/screens/Checking/CheckMethod/filenames.dart';

class ExtCheckupSafety_Item {
  int sysVehicleSafetyListId;
  String list;
  String result;
  Map<String, List<FileInformation>>? filenames;

  int order;

  ExtCheckupSafety_Item(
      {required this.sysVehicleSafetyListId,
      required this.list,
      required this.result,
      this.filenames,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleSafetyListId': sysVehicleSafetyListId,
      'list': list,
      'result': result,
      'order': order,
      'filenames': filenames?.map((key, value) =>
          MapEntry(key, value.map((file) => file.toJson()).toList())),
    };
  }

  static List<ExtCheckupSafety_Item> checklistExtCheckupSafety_Item = [];
  static void addItem3({
    required int sysVehicleSafetyListId,
    required String list,
    required String result,
    required int order,
    Map<String, List<FileInformation>>? filenames,
  }) {
    checklistExtCheckupSafety_Item.add(ExtCheckupSafety_Item(
        sysVehicleSafetyListId: sysVehicleSafetyListId,
        list: list,
        result: result,
        filenames: filenames,
        order: order));

    List<Map<String, dynamic>> jsonList1 = ExtCheckupSafety_Item
        .checklistExtCheckupSafety_Item
        .map((item) => item.toJson())
        .toList();

    print(jsonList1);
  }
}
