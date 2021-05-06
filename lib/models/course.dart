class Course {
  String id;
  String title;
  String slot;
  int attendedClasses;
  int missedClasses;

  Course({this.title, this.slot, this.attendedClasses, this.missedClasses});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['courseID'];
    title = json['courseName'];
    slot = json['slot'];
  }
}

class CoursesResponse {
  List<Course> courses;

  CoursesResponse({this.courses});

  CoursesResponse.fromJson(Map<String, dynamic> json) {
    if (json['coursestaken'] != null) courses = <Course>[];
    json['courses'].forEach((c) {
      courses.add(Course.fromJson(c));
    });
  }
}
