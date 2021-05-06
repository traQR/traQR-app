import 'package:get/get.dart';

import 'controllers/course_controller.dart';

class InitBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());
  }
}
