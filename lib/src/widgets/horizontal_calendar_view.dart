import 'package:daily_routine_app/src/constan/k_size.dart';
import 'package:daily_routine_app/src/extensions/date_time_extension.dart';
import 'package:daily_routine_app/src/extensions/int_extension.dart';
import 'package:daily_routine_app/src/extensions/string_extension.dart';
import 'package:daily_routine_app/src/extensions/weekend_extension.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HorizontalCalendarView extends StatefulWidget {
  const HorizontalCalendarView({
    super.key,
    required this.selectedDate,
    required this.onChangedDate,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onChangedDate;

  @override
  State<HorizontalCalendarView> createState() => _HorizontalCalendarViewState();
}

class _HorizontalCalendarViewState extends State<HorizontalCalendarView> {
  final controller = ItemScrollController();
  final alignment = 0.4;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final selectedDate = widget.selectedDate;
      controller.jumpTo(index: (selectedDate.day - 1), alignment: alignment);
    });
  }

  void scrollTo(int index) {
    controller.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 250),
      alignment: alignment,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = widget.selectedDate;
    final totalDate = selectedDate.totalDate;
    final selectedMonth = selectedDate.month;
    final selectedYear = selectedDate.year;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 72,
          child: ScrollablePositionedList.builder(
            itemScrollController: controller,
            shrinkWrap: true,
            itemCount: totalDate,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final day = index + 1;
              final isSelected = day == selectedDate.day;
              final weekDay =
                  DateTime(selectedYear, selectedMonth, day).weekday;
              final isHoliday = weekDay == 6 || weekDay == 7;
              final textColor = isSelected
                  ? Colors.white
                  : isHoliday
                      ? Colors.red
                      : null;
              return TouchableOpacity(
                onTap: () {
                  scrollTo(index);
                  final selectedDate =
                      DateTime(selectedYear, selectedMonth, day);
                  widget.onChangedDate(selectedDate);
                },
                child: Container(
                  color: isSelected
                      ? isHoliday
                          ? Colors.red
                          : Colors.blue
                      : Colors.transparent,
                  padding: const EdgeInsets.all(KSize.s16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weekDay.toWeekend.formattedName.threeLetter,
                        style: TextStyle(color: textColor),
                      ),
                      const SizedBox(
                        height: KSize.s8,
                      ),
                      Text(
                        day.toString(),
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: KSize.s16),
          child: ElevatedButton(
            onPressed: () {
              scrollTo(DateTime.now().day - 1);
              widget.onChangedDate(DateTime.now());
            },
            child: const Text('To Current Date'),
          ),
        ),
      ],
    );
  }
}
