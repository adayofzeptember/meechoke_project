import 'package:intl/intl.dart';

/// Function to format a DateTime string into Thai date format with Thai months.
String formatThaiDate(String dateTimeString) {
  // Parse the input DateTime string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Convert the year to Thai Buddhist year
  int thaiYear = dateTime.year + 543;

  // Define Thai month names
  List<String> thaiMonths = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];

  // Get the day, month, and year
  int day = dateTime.day;
  String thaiMonth = thaiMonths[dateTime.month - 1]; // Month index is 0-based
  String formattedDate = "$day $thaiMonth $thaiYear";

  return formattedDate;
}

/// Function to split the date and time and return both.
Map<String, String> convertToThaiDateTime(String dateTimeString) {
  // Parse the input DateTime string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Convert the year to Thai Buddhist year
  int thaiYear = dateTime.year + 543;

  // Define Thai month names
  List<String> thaiMonths = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];

  // Format the Thai date
  int day = dateTime.day;
  String thaiMonth = thaiMonths[dateTime.month - 1];
  String thaiDate = "$day $thaiMonth $thaiYear";

  // Extract the time
  String time = DateFormat('HH:mm').format(dateTime);

  return {
    "thaiDate": thaiDate,
    "time": time + ' น.',
  };
}

void main() {
  String inputDateTime = "2024-10-10 10:42:39";

  // Example 1: Format only the Thai date
  String thaiDate = formatThaiDate(inputDateTime);
  print("Thai Date: $thaiDate"); // Output: Thai Date: 10 ตุลาคม 2567

  // Example 2: Get both Thai date and time
  Map<String, String> result = convertToThaiDateTime(inputDateTime);
  print("Thai Date: ${result['thaiDate']}"); // Output: Thai Date: 10 ตุลาคม 2567
  print("Time: ${result['time']}");         // Output: Time: 10:42:39
}
