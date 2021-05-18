import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';
import 'package:traqr_app/services/api_response.dart';
import 'package:traqr_app/services/controllers/course_controller.dart';
import 'package:get/get.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Course> _courses = [];
  String regNo;
  final CourseController _controller = Get.find<CourseController>();

  @override
  void initState() {
    regNo = sharedPreferences.getString('regNo');
    _controller.getAttendance(regNo);
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(
      () {
        if (_controller.courses != null)
          switch (_controller.coursesDetails.status) {
            case Status.INIT:
              break;
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                child: Text("Scan a QR code to join a course!"),
              );
            case Status.COMPLETED:
              var courses = _controller.courses;
              if (courses.isEmpty)
                return Center(
                  child: Text("Scan a QR code to join a course!"),
                );
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return ClassCard(
                    course: courses[index],
                    push: true,
                  );
                },
              );
          }
        return Center(
          child: Text("Scan a QR code to join a course!"),
        );
      },
    ));
  }
}
