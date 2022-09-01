import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppCalendar {
  static Future<void> show(BuildContext context) =>
      showModalBottomSheet(
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
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 2 / 3),
                    child: TableCalendar<Widget>(
                      lastDay: DateTime.utc(2030, 1, 1),
                      firstDay: DateTime.utc(2022, 1, 1),
                      focusedDay: DateTime.now(),
                      rowHeight: 40,
                      calendarFormat: CalendarFormat.month,
                      // selectedDayPredicate: (DateTime day) {
                      //   // return isSameDay(a, b);
                      // },
                      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                        // if (!isSameDay(_selectedDay, selectedDay)) {
                        //   setState(() {
                        //     _selectedDay = selectedDay;
                        //     _focusedDay = focusedDay;
                        //   });
                        // }
                      },
                      headerVisible: true,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                    )
                )
            );
          }
      );
}