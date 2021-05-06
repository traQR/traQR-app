import 'package:get/get.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/repos/course_repo.dart';
import 'package:traqr_app/services/api_response.dart';

class CourseController extends GetxController {
  final CourseRepository repository = CourseRepository();

  var coursesDetailsObs = ApiResponse<CoursesResponse>().obs;
  ApiResponse<CoursesResponse> get coursesDetails => coursesDetailsObs.value;
  var courses = <Course>[].obs;

  getCourses(String regNo) async {
    coursesDetailsObs.value = ApiResponse<CoursesResponse>.loading();
    final response = await repository.getCourseDetails(regNo);
    if (response.status == Status.COMPLETED) {
      coursesDetailsObs.value = response;
      update();
    }
    coursesDetailsObs.value = response;
    update();
  }
}
