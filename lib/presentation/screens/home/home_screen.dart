import 'package:flutter/material.dart';
import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/presentation/widgets/attendance_card.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Course> _courses = [];
  List<Attendance> _attendanceList = [];

  @override
  void initState() {
    _courses = [
      Course(
          title: 'Software Engineering',
          slot: 'L51 + L52',
          attendedClasses: 10,
          missedClasses: 4),
      Course(
          title: 'Network and Communication',
          slot: 'L31 + L32',
          attendedClasses: 12,
          missedClasses: 2)
    ];
    _attendanceList = [
      Attendance(attended: true, date: 'Friday 22-4-2021'),
      Attendance(attended: false, date: 'Monday 25-4-2021')
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _courses.length,
            itemBuilder: (context, index) {
              return ClassCard(
                course: _courses[index],
              );
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _attendanceList.length,
            itemBuilder: (context, index) {
              return AttendanceCard(_attendanceList[index]);
            },
          ),
        ],
      ),
    ));
  }
}
