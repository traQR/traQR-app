import 'dart:convert';
import 'dart:io';

import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:traqr_app/services/controllers/attendance_controller.dart';
import 'package:traqr_app/services/controllers/course_controller.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class ScanRepository {
  CourseController _coursesController = Get.find<CourseController>();
  AttendanceController _attendanceController = Get.find<AttendanceController>();

  Future scanCode(Map<String, dynamic> jsonResponse) async {
    // json = jsonDecode(jsonResponse);
    var json = jsonResponse;
    DateTime start = DateTime.parse(json['start']);
    DateTime end = DateTime.parse(json['end']);
    String courseID = json['courseID'];
    String courseName = json['courseName'];
    String slot = json['slot'];
    print(end);
    print(DateTime.now().isBefore(end));
    if (DateTime.now().isBefore(end)) {
      await _markAttendance(true, courseID).then((value) async {
        if (value == 400) {
          await _addStudent(courseID, courseName, slot);
        }
      });
    } else {
      await _markAttendance(false, courseID).then((value) async {
        if (value == 400) {
          await _addStudent(courseID, courseName, slot);
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

  Future _addStudent(String courseID, String courseName, String slot) async {
    print("Entered addStudent route ");
    final regNo = sharedPreferences.getString('regNo');
    final _url = BaseUrl + AddStudentRoute;
    final response = await http.post(
      Uri.parse(_url),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode({
        "regNo": regNo,
        "courseID": courseID,
        "courseName": courseName,
        "slot": slot
      }),
    );

    print(response.statusCode);
    print(response.body);
  }

  fakeScanCode() {
    fakeMarkAttendance();
  }

  fakeMarkAttendance() {
    _coursesController.fakeAddCourse(
        'Data Structures and Algorithms', 'D1+ TD1');
    _attendanceController.attendanceList
        .add(Attendance(attended: true, date: 'Friday 15-5-2021'));
    // print(_attendanceController.attendanceList.length);
    print(_coursesController.courses.length);
  }

  _fakeAddStudent() {
    _coursesController.fakeAddCourse(
        'Data Structures and Algorithms', 'D1+ TD1');
  }
}
