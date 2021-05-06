import 'dart:convert';

import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/services/api_response.dart';
import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;

class CourseRepository {
  Future<ApiResponse<CoursesResponse>> getCourseDetails(String regNo) async {
    print("entered getCourseDetails");
    final url = BaseUrl + CoursesGroup;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          {'regNo': regNo},
        ),
      );

      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
              CoursesResponse.fromJson(jsonDecode(response.body)));
      }
    } catch (e) {
      print(e);
    }
  }
}
