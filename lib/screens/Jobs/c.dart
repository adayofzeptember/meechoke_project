// String convertDateToThaiYearFormat(String date) {
//   // Parse the input date
//   DateTime dateTime = DateTime.parse(date);

//   // Convert to Thai year by adding 543 years
//   int thaiYear = dateTime.year + 543;

//   // Format the date to the desired format
//   String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);

//   // Replace the year in the formatted date with the Thai year
//   formattedDate =
//       formattedDate.replaceFirst(dateTime.year.toString(), thaiYear.toString());

//   return formattedDate;
// }

String splitDateToThaiMonth(String date) {
  // Split the input date string by '-'
  List<String> dateParts = date.split('-');

  // Assign each part to a variable
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
