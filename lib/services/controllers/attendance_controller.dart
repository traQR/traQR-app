import 'package:get/get.dart';
import 'package:traqr_app/models/attendance.dart';

class AttendanceController extends GetxController {
  var attendanceList = <Attendance>[].obs;

  fakeGetAttendance() {
    attendanceList.value = [
      Attendance(attended: true, date: 'Friday 22-4-2021'),
      Attendance(attended: false, date: 'Monday 25-4-2021')
    ];
  }
}
