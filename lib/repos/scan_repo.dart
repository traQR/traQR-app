import 'dart:convert';
import 'dart:io';

import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:traqr_app/services/controllers/course_controller.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class ScanRepository {
  CourseController _coursesController = Get.find<CourseController>();

  Future scanCode(List<String> strings) async {
    String courseID = strings[0].substring(1);
    DateTime start = DateTime.parse(strings[1]);
    DateTime end =
        DateTime.parse(strings[2].substring(0, strings[2].length - 1));
    var inCourse = await _checkCourse(courseID);
    if (inCourse == false) {
      if (DateTime.now().isBefore(end)) {
        await _markAttendance(true, courseID);
      } else {
        await _markAttendance(false, courseID);
      }
    } else {
      await _addStudent(courseID).then((value) async {
        if (DateTime.now().isBefore(end)) {
          await _markAttendance(true, courseID);
        } else {
          await _markAttendance(false, courseID);
        }
      });
    }
  }

  Future _markAttendance(bool status, String courseID) async {
    print("Entered markAttendance route " + status.toString());
    final regNo = sharedPreferences.getString('regNo');
    final _url = BaseUrl + MarkAttendanceRoute;
    final response = await http.post(
      Uri.parse(_url),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode({
        "status": status,
        "regNo": regNo,
        "courseID": courseID,
        "date": DateTime.now().toString()
      }),
    );

    print(response.statusCode);
    print(response.body);

    return response.statusCode;
  }

  Future _addStudent(String courseID) async {
    print("Entered addStudent route ");
    final regNo = sharedPreferences.getString('regNo');
    final _url = BaseUrl + AddStudentRoute;
    final response = await http.post(
      Uri.parse(_url),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode({
        "regNo": regNo,
        "courseID": courseID,
      }),
    );

    print(response.statusCode);
    print(response.body);
  }

  Future _checkCourse(String courseID) async {
    print("Entered checkCourse route");
    final regNo = sharedPreferences.getString('regNo');
    final _url = BaseUrl + CheckCourseRoute;
    print(courseID);
    final response = await http.post(
      Uri.parse(_url),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode({
        "regNo": regNo,
        "courseID": courseID,
      }),
    );

    var result = jsonDecode(response.body)['isNew'];
    print(result);
    return result;
  }

  // fakeScanCode() {
  //   fakeMarkAttendance();
  // }

  // fakeMarkAttendance() {
  //   _coursesController.fakeAddCourse('Software Engineering', 'D1');
  //   _attendanceController.attendanceList
  //       .add(Attendance(status: true, date: 'Friday 15-05-2021'));
  //   // print(_attendanceController.attendanceList.length);
  //   print(_coursesController.courses.length);
  // }

  // _fakeAddStudent() {
  //   _coursesController.fakeAddCourse(
  //     'Software Engineering',
  //     'D1',
  //   );
  // }
}
