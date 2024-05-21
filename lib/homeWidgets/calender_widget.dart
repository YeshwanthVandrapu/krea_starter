import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/event.dart';

class CalenderCard extends StatefulWidget {
  const CalenderCard({super.key});

  @override
  State<CalenderCard> createState() => _CalenderCardState();
}

class _CalenderCardState extends State<CalenderCard> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  TextEditingController eventController = TextEditingController();
  Map<DateTime, List<Event>> events = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        eventLoader: (day) =>
            //  day == DateTime.now()
            //     ? [
            //         {"Tilte": "test"}
            //       ]
            //     : []
            [
          if (day.compareTo(DateTime.now()) == 1) {"Tilte": "test"}
        ],
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2000, 1, 1),
        lastDay: DateTime.utc(2100, 1, 1),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: _onDaySelected,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Add Event'),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: eventController,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        events.addAll({
                          _selectedDay!: [Event(eventController.text)]
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add Event'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
