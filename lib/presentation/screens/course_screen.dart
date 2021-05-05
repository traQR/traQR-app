import 'package:flutter/material.dart';
import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/presentation/widgets/attendance_card.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen(this.course);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<Attendance> _attendanceList = [];

  @override
  void initState() {
    _attendanceList = [
      Attendance(attended: true, date: 'Friday 22-4-2021'),
      Attendance(attended: false, date: 'Monday 25-4-2021')
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("traQR"),
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ClassCard(
              course: widget.course,
              push: false,
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
      )),
    );
  }
}
