class Attendance {
  String date;
  String status;

  Attendance({this.date, this.status});

  Attendance.fromJson(Map<String, dynamic> json) {
    date = json['attendanceDate'];
    status = json['status'];
  }
}

class AttendanceResponse {
  List<Attendance> attendanceList;

  AttendanceResponse({this.attendanceList});

  AttendanceResponse.fromJson(Map<String, dynamic> json) {
    if (json != null) attendanceList = <Attendance>[];
    json['historyOfAttendance'].forEach((a) {
      attendanceList.add(Attendance.fromJson(a));
    });
  }
}
