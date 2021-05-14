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
  String regNo;
  final CourseController _controller = Get.find<CourseController>();

  @override
  void initState() {
    regNo = sharedPreferences.getString('regNo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(
      () {
        print(_controller.courses.length);
        if (_controller.courses != null) {
          // switch (_controller.coursesDetails.status) {
          //   case Status.INIT:
          //     return Container();
          //     break;
          //   case Status.LOADING:
          //     return Center(child: CircularProgressIndicator());
          //   case Status.ERROR:
          //     return Center(
          //       child: Text("Scan a QR code to join a course!"),
          //     );
          //   case Status.COMPLETED:
          var courses = _controller.courses;
          if (courses.isEmpty)
            return Center(
              child: Text("Scan a QR code to join a course!!"),
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
          // }
          print(_controller.courses.length);
        } else {
          return Center(
            child: Text("Scan a QR code to join a course!!!"),
          );
        }
      },
    ));
  }
}
