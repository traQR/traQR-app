import 'package:get/get.dart';
import 'package:traqr_app/services/controllers/attendance_controller.dart';

import 'controllers/course_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());
    Get.put(AttendanceController());
  }
}
