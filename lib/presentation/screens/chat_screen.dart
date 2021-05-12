import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';

class ChatScreen extends StatefulWidget {
  final Course course;

  ChatScreen({this.course});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Course get course => widget.course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title + ' Chatroom',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
