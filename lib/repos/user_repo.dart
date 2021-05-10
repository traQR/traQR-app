import 'dart:convert';
import 'dart:io';

import 'package:traqr_app/services/api_routes.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future addUser(String regNo, String name) async {
    print("entered addUser");
    final url = BaseUrl + NewUserRoute;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode({
          "isStudent": false,
          "regNo": regNo,
          "studentName": name,
        }),
      );

      print(response.statusCode);
    } catch (e) {
      print(e);
    }
  }
}
