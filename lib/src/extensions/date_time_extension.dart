extension DateTimeExtension on DateTime? {
  bool isSameDate(DateTime? other) {
    if (this == null || other == null) return false;
    return this!.day == other.day && this!.month == other.month && this!.year == other.year;
  }
}
