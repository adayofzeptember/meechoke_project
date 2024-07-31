
String splitDateToThaiMonth(String date) {

  List<String> dateParts = date.split('-');

  String day = dateParts[2];

  String month = dateParts[1];
  Map<String, String> thaiMonths = {
    '01': 'มกราคม',
    '02': 'กุมภาพันธ์',
    '03': 'มีนาคม',
    '04': 'เมษายน',
    '05': 'พฤษภาคม',
    '06': 'มิถุนายน',
    '07': 'กรกฎาคม',
    '08': 'สิงหาคม',
    '09': 'กันยายน',
    '10': 'ตุลาคม',
    '11': 'พฤศจิกายน',
    '12': 'ธันวาคม',
  };
  String y = thaiMonths[month].toString();

  String year = dateParts[0];
  String z = (int.parse(year) + 543).toString();

  return day + ' ' + y + ' ' + z;
}
