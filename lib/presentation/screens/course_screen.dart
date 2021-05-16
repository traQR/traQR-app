import 'package:flutter/material.dart';
import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/presentation/screens/chat_screen.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:traqr_app/presentation/widgets/attendance_card.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';
import 'package:get/get.dart';
import 'package:traqr_app/services/controllers/attendance_controller.dart';

class CourseScreen extends StatefulWidget {
  final Course course;

  CourseScreen(this.course);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  AttendanceController _controller = Get.find<AttendanceController>();

  @override
  void initState() {
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
      body: Obx(() {
        print(_controller.attendanceList.length);
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
                itemCount: _controller.attendanceList.length,
                itemBuilder: (context, index) {
                  return AttendanceCard(_controller.attendanceList[index]);
                },
              ),
            ],
          ),
        ));
      }),
    );
  }
}
