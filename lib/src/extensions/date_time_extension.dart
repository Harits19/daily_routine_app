extension DateTimeNullExtension on DateTime? {
  bool isSameDate(DateTime? other) {
    if (this == null || other == null) return false;
    return this!.day == other.day &&
        this!.month == other.month &&
        this!.year == other.year;
  }
}

extension DateTimeExtension on DateTime {
  int get totalDate {
    final month = this.month == 12 ? 1 : this.month;
    return DateTime(year, month + 1, 0).day;
  }
}
