import 'dart:convert';
import 'dart:io';

import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/services/api_response.dart';
import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  Future<ApiResponse<CoursesResponse>> getAttendance(String regNo) async {
    print("entered getAttendance");
    final url = BaseUrl + AttendanceGroup;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({"regNo": regNo}),
      );

      print(response.statusCode);
      print(response.body);

      switch (response.statusCode) {
        case 200:
          if (response.body.isNotEmpty) {
            return ApiResponse.completed(
                CoursesResponse.fromJson(jsonDecode(response.body)));
          } else {
            return ApiResponse.error('No classes.');
          }
      }
    } catch (e) {
      print(e);
    }
  }
}
