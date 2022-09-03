import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class AppCalendar extends HookConsumerWidget {
  const AppCalendar({Key? key}) : super(key: key);

  static Future<DateTime?> show(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: const AppCalendar()));
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<DateTime?> _date = useState<DateTime?>(null);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // This invisible Done makes Date align center
            const Text('Done', style: TextStyle(fontSize: 16, color: Colors.transparent)),
            const Text('Date', style: TextStyle(fontSize: 18),),
            GestureDetector(
              onTap: () => Navigator.pop(context, _date.value),
              child: const Text(
                'Done',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16),
              ),
            )
          ],
        ),
        TableCalendar<Widget>(
          lastDay: DateTime.utc(2030, 1, 1),
          firstDay: DateTime.utc(2022, 1, 1),
          focusedDay: DateTime.now(),
          rowHeight: 40,
          calendarFormat: CalendarFormat.month,
          selectedDayPredicate: (DateTime day) {
            return isSameDay(_date.value, day);
          },
          onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
            if (!isSameDay(_date.value, selectedDay)) {
              _date.value = selectedDay;
            }
          },
          headerVisible: true,
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        ),
      ],
    );
  }
}
