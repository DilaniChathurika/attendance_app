import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HASTHIYA IT'),
        centerTitle: true,
      ),
      backgroundColor: Colors.purple[100], // Set background color here
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AttendanceCard(
              icon: Icons.person, // Replaced gps_fixed with person icon
              text: 'EMPLOYEE',
              onTap: () {
                // Handle tap
              },
              isFirstCard: true, // Indicate this is the first card
            ),
            SizedBox(height: 20.0),
            AttendanceCard(
              icon: Icons.calendar_today,
              text: 'ATTENDANCE',
              onTap: () {
                Navigator.pushNamed(context, "");
              },
            ),
            SizedBox(height: 20.0),
            AttendanceCard(
              icon: Icons.meeting_room, // Replaced info with meeting icon
              text: 'CREATE MEETING',
              onTap: () {
                Navigator.pushNamed(context, "ScheduleMeetingScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  final bool isFirstCard;

  AttendanceCard({required this.icon, required this.text, required this.onTap, this.isFirstCard = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 50,
                color: Colors.purple,
              ),
              SizedBox(height: 16.0),
              Text(
                text,
                style: TextStyle(fontSize: 16.0),
              ),
              if (isFirstCard) ...[
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "AddEmployee");
                      },
                      child: Text('Add Button'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "ViewEmployee");
                      },
                      child: Text('View Button'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}