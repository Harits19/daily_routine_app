import 'package:daily_routine_app/src/constan/date.dart';
import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/utils/date_util.dart';
import 'package:daily_routine_app/src/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HorizontalCalendar extends StatefulWidget {
  const HorizontalCalendar({
    super.key,
    required this.selectedDate,
    required this.onChangedDate,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onChangedDate;

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  final controller = ItemScrollController();
  final alignment = 0.4;
  late final selectedDate = widget.selectedDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.jumpTo(index: (selectedDate.day - 1), alignment: alignment);
    });
  }

  void scrollTo(int index) {
    controller.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 250),
        alignment: alignment);
  }

  @override
  Widget build(BuildContext context) {
    final totalDate = DateUtil.totalDate(widget.selectedDate);
    final selectedMonth = widget.selectedDate.month;
    final selectedYear = widget.selectedDate.year;
    return SizedBox(
      height: 72,
      child: ScrollablePositionedList.builder(
        itemScrollController: controller,
        shrinkWrap: true,
        itemCount: totalDate,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final day = index + 1;
          final isSelected = day == widget.selectedDate.day;
          final textColor = isSelected ? Colors.white : null;
          final weekDay = DateTime(selectedYear, selectedMonth, day).weekday;
          return TouchableOpacity(
            onTap: () {
              scrollTo(index);
              final selectedDate = DateTime(selectedYear, selectedMonth, day);
              widget.onChangedDate(selectedDate);
            },
            child: Container(
              color: isSelected ? Colors.blue : Colors.transparent,
              padding: const EdgeInsets.all(KSize.s16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    KDate.listOfDays[weekDay],
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
    );
  }
}
