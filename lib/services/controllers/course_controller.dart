import 'package:get/get.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/repos/course_repo.dart';
import 'package:traqr_app/services/api_response.dart';

class CourseController extends GetxController {
  final CourseRepository repository = CourseRepository();

  var courses = ApiResponse<Course>().obs;
}
