import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String formatCurrency(double value) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(value);
  }
}
