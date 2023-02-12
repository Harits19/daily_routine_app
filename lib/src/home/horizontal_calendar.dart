import 'package:daily_routine_app/src/constan/date.dart';
import 'package:daily_routine_app/src/constan/size.dart';
import 'package:daily_routine_app/src/home/action_view.dart';
import 'package:daily_routine_app/src/home/util_view.dart';
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
          final weekDay = DateTime(selectedYear, selectedMonth, day).weekday;
          final isHoliday = weekDay == 6 || weekDay == 7;
          final textColor = isSelected
              ? Colors.white
              : isHoliday
                  ? Colors.red
                  : null;
          return TouchableOpacity(
            onLongPress: () {
              UtilView.showActionView(
                context,
                actions: [
                  ActionViewProps(
                    text: "Copy",
                    icon: Icons.copy,
                    onPress: () {
                      Navigator.pop(context);
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [],
                            );
                          });
                    },
                  ),
                ],
              );
            },
            onTap: () {
              scrollTo(index);
              final selectedDate = DateTime(selectedYear, selectedMonth, day);
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
                    KDate.listOfDays[weekDay].substring(0, 3),
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
