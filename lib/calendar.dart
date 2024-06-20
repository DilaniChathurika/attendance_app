import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  bool isDateSelected = false; // To track if a date is selected
  bool showDetailsForDescription1 = false;
  bool showDetailsForDescription2 = false;
  bool showDetailsForDescription3 = false;

  final TextEditingController description1Controller = TextEditingController();
  final TextEditingController description2Controller = TextEditingController();
  final TextEditingController description3Controller = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController attendeesController = TextEditingController();
  final TextEditingController absenteesController = TextEditingController();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      isDateSelected = true;
      showDetailsForDescription1 = false;
      showDetailsForDescription2 = false;
      showDetailsForDescription3 = false;
    });
  }

  @override
  void dispose() {
    description1Controller.dispose();
    description2Controller.dispose();
    description3Controller.dispose();
    timeController.dispose();
    attendeesController.dispose();
    absenteesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        backgroundColor: Colors.purple,
      ),
      body: content(),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Selected Date - " + today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2018, 01, 01),
              lastDay: DateTime.utc(2050, 12, 31),
              onDaySelected: _onDaySelected,
            ),
          ),
          if (isDateSelected) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDetailsForDescription1 = !showDetailsForDescription1;
                    showDetailsForDescription2 = false;
                    showDetailsForDescription3 = false;
                  });
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: description1Controller,
                    decoration: InputDecoration(labelText: 'Description 1'),
                  ),
                ),
              ),
            ),
            if (showDetailsForDescription1) buildDetailFields(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDetailsForDescription2 = !showDetailsForDescription2;
                    showDetailsForDescription1 = false;
                    showDetailsForDescription3 = false;
                  });
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: description2Controller,
                    decoration: InputDecoration(labelText: 'Description 2'),
                  ),
                ),
              ),
            ),
            if (showDetailsForDescription2) buildDetailFields(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDetailsForDescription3 = !showDetailsForDescription3;
                    showDetailsForDescription1 = false;
                    showDetailsForDescription2 = false;
                  });
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: description3Controller,
                    decoration: InputDecoration(labelText: 'Description 3'),
                  ),
                ),
              ),
            ),
            if (showDetailsForDescription3) buildDetailFields(),
          ]
        ],
      ),
    );
  }

  Widget buildDetailFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: timeController,
            decoration: InputDecoration(labelText: 'Time'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: attendeesController,
            decoration: InputDecoration(labelText: 'Attendees'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: absenteesController,
            decoration: InputDecoration(labelText: 'Absentees'),
          ),
        ),
      ],
    );
  }
}