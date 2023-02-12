import 'package:flutter/material.dart';

extension TimeOfDayModel on TimeOfDay {
  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
      };

  int compareTo(TimeOfDay other) {
    if (toMinute() < other.toMinute()) return -1;
    return 1;
  }

  int toMinute() {
    return hour * 60 + minute;
  }

  String get to24HourFormat {
String addLeadingZeroIfNeeded(int value) {
      if (value < 10) {
        return '0$value';
      }
      return value.toString();
    }

    final String hourLabel = addLeadingZeroIfNeeded(hour);
    final String minuteLabel = addLeadingZeroIfNeeded(minute);

    return '$hourLabel:$minuteLabel';  }
}

TimeOfDay timeOfDayFromJson(Map<String, dynamic> json) {
  return TimeOfDay(hour: json['hour'], minute: json['minute']);
}
