class Check_List_Data {
  String? name;

  List<ExtCheckupList>? checkinList;

  Check_List_Data({
    this.name,
    this.checkinList,
  });
}

class ExtCheckupList {
  String? id;
  String? name;
  ExtCheckupList({this.id, this.name});
}
