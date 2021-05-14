import 'package:get/get.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/repos/course_repo.dart';
import 'package:traqr_app/services/api_response.dart';

class CourseController extends GetxController {
  final CourseRepository repository = CourseRepository();

  var coursesDetailsObs = ApiResponse<CoursesResponse>().obs;
  ApiResponse<CoursesResponse> get coursesDetails => coursesDetailsObs.value;
  var courses = <Course>[].obs;

  getAttendance(String regNo) async {
    coursesDetailsObs.value = ApiResponse<CoursesResponse>.loading();
    final response = await repository.getAttendance(regNo);
    if (response.status == Status.COMPLETED) {
      courses.value = response.data.courses;
      update();
    }
    coursesDetailsObs.value = response;
    update();
  }

  fakeGetAttendance() {
    coursesDetailsObs.value = ApiResponse<CoursesResponse>.loading();
    courses.value = [
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
    coursesDetailsObs.value = ApiResponse<CoursesResponse>.completed(
        CoursesResponse(courses: courses.value));
    update();
  }

  fakeAddCourse(String title, String slot) {
    courses.value.add(
        Course(title: title, slot: slot, attendedClasses: 1, missedClasses: 0));
    courses.toSet().toList();
    update();
  }
}
