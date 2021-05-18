import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/presentation/screens/chat_screen.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:traqr_app/presentation/widgets/attendance_card.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';
import 'package:traqr_app/services/api_response.dart';
import 'package:traqr_app/services/controllers/course_controller.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen(this.course);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<Attendance> _attendanceList = [];
  final CourseController _controller = Get.find<CourseController>();
  Course get course => widget.course;

  @override
  void initState() {
    String regNo = sharedPreferences.get('regNo');
    _controller.getAttendanceHistory(regNo, course.id);
    _attendanceList = [
      Attendance(status: 'Present', date: 'Friday 22-4-2021'),
      Attendance(status: 'Absent', date: 'Monday 25-4-2021')
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("traQR"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.chat_bubble_rounded,
          color: grey,
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                course: widget.course,
              ),
            )),
      ),
      body: Obx(
        () {
          if (_controller.attendanceList != null)
            switch (_controller.attendanceHistory.status) {
              case Status.INIT:
                break;
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(
                  child: Text("No history"),
                );
              case Status.COMPLETED:
                var attendanceList = _controller.attendanceList;
                if (attendanceList.isEmpty)
                  return Center(
                    child: Text("No history"),
                  );
                else
                  return Container(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ClassCard(
                          course: widget.course,
                          push: false,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: attendanceList.length,
                          itemBuilder: (context, index) {
                            return AttendanceCard(attendanceList[index]);
                          },
                        ),
                      ],
                    ),
                  ));
            }
          return Center(
            child: Text("No history"),
          );
        },
      ),
    );
  }
}
