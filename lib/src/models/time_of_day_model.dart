import 'package:flutter/material.dart';

extension TimeOfDayModel on TimeOfDay {
  Map<String, dynamic> toJson() => {
        'hour': hour,
        'minute': minute,
      };
}

TimeOfDay timeOfDayFromJson(Map<String, dynamic> json) {
  return TimeOfDay(hour: json['hour'], minute: json['minute']);
}
