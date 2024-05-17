// ignore_for_file: unused_local_variable

import 'package:meechoke_project/screens/Checking/CheckMethod/filenames.dart';

class ExtCheckupEquipment_Item {
  int sysVehicleEquipmentId;
  String list;
  String result;
  int order;
  Map<String, List<FileInformation>>? filenames;

  ExtCheckupEquipment_Item(
      {required this.sysVehicleEquipmentId,
      required this.list,
      required this.result,
      this.filenames,
      required this.order});

  Map<String, dynamic> toJson() {
    return {
      'sysVehicleEquipmentId': sysVehicleEquipmentId,
      'list': list,
      'result': result,
      'order': order,
      'filenames': filenames?.map((key, value) =>
          MapEntry(key, value.map((file) => file.toJson()).toList())),
    };
  }

  static List<ExtCheckupEquipment_Item> checklistEquipment = [];
  static void addItem2({
    required int sysVehicleEquipmentId,
    required String list,
    required String result,
    Map<String, List<FileInformation>>? filenames,
    required int order,
  }) {
    checklistEquipment.add(ExtCheckupEquipment_Item(
        sysVehicleEquipmentId: sysVehicleEquipmentId,
        list: list,
        filenames: filenames,
        result: result,
        order: order));

    List<Map<String, dynamic>> jsonList1 = ExtCheckupEquipment_Item
        .checklistEquipment
        .map((item) => item.toJson())
        .toList();

    print(jsonList1);
  }
}
