import 'package:intl/intl.dart';

extension DateFormatExtension on DateFormat {
  String? tryFormat(DateTime? date) {
    if (date == null) return null;
    return format(date);
  }
}
