import 'dart:convert';
import 'dart:io';

import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:traqr_app/services/shared_prefs.dart';

class ScanRepository {
  Future scanCode(Map<String, dynamic> jsonResponse) async {
    // json = jsonDecode(jsonResponse);
    var json = jsonResponse;
    DateTime start = DateTime.parse(json['start']);
    DateTime end = DateTime.parse(json['end']);
    if (DateTime.now().isBefore(end)) {
      await markAttendance(true, json['courseID']);
    } else {
      await markAttendance(false, json['courseID']);
    }
  }

  Future markAttendance(bool status, String courseID) async {
    final regNo = sharedPreferences.getString('regNo');
    final _url = BaseUrl + MarkAttendanceRoute;
    await http.post(
      Uri.parse(_url),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
      body: jsonEncode({
        "status": status,
        "regNo": regNo,
        "courseID": courseID,
        "date": DateTime.now()
      }),
    );
  }
}
