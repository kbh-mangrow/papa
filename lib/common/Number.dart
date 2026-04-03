import 'package:easy_localization/easy_localization.dart';

class Number {
  static String formatWithComma(int value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value);
  }
}