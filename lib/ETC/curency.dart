import 'package:intl/intl.dart';

String formatNumber(String numberStr) {
  double number = double.tryParse(numberStr) ?? 0.0;

  final NumberFormat numberFormat = NumberFormat('##,##0.00', 'en_US');
  return numberFormat.format(number);
}
