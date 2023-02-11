class DateUtil {
  static int totalDate(DateTime date) {
    final month = date.month == 12 ? 1 : date.month;
    return DateTime(date.year, month + 1, 0).day;
  }
}
