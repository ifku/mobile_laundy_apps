import 'package:intl/intl.dart';

class DateFormatter {
  static String format(String date) {
    final inputFormat = DateFormat('yyyy-MM-dd', 'id');
    final outputFormat = DateFormat('dd-MMMM-yyyy', 'id');
    final dateTime = inputFormat.parse(date);
    final formattedDate = outputFormat.format(dateTime);
    return formattedDate;
  }
}
