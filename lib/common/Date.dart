
import 'package:easy_localization/easy_localization.dart';

class Date {
  static DateTime today() {
    return DateTime.now();
  }
  static String getDate(String format, DateTime date) {
    return DateFormat(format).format(date);
  }
  static String getToday(String format) {
    return getDate(format, today());
  }


}