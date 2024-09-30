import 'package:intl/intl.dart';

class ThaiDateFormat extends DateFormat {
  ThaiDateFormat(String pattern, [String? locale]) : super(pattern, locale);

  @override
  String format(DateTime date) {
    return '${date.day} ${_getThaiMonthName(date.month)} ${date.year + 543}';
  }

  String _getThaiMonthName(int month) {
    switch (month) {
      case 1:
        return 'มกราคม';
      case 2:
        return 'กุมภาพันธ์';
      case 3:
        return 'มีนาคม';
      case 4:
        return 'เมษายน';
      case 5:
        return 'พฤษภาคม';
      case 6:
        return 'มิถุนายน';
      case 7:
        return 'กรกฎาคม';
      case 8:
        return 'สิงหาคม';
      case 9:
        return 'กันยายน';
      case 10:
        return 'ตุลาคม';
      case 11:
        return 'พฤศจิกายน';
      case 12:
        return 'ธันวาคม';
      default:
        return '';
    }
  }
}

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
