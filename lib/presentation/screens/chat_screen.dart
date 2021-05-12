import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';
import 'package:traqr_app/models/message.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:traqr_app/services/shared_prefs.dart';

class ChatScreen extends StatefulWidget {
  final Course course;

  ChatScreen({this.course});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Course get course => widget.course;
  List<Message> _messages = <Message>[];
  String regNo;

  @override
  void initState() {
    _messages = [
      Message(
        text: 'Does anyone have any doubts?',
        isUpvoted: true,
        upvotes: 15,
        sentBy: 'Faculty',
      ),
      Message(
        text: 'How 2 make UI???',
        isUpvoted: false,
        upvotes: 2,
        sentBy: '20BCE0110',
      ),
      Message(
        text: '+1 lol',
        isUpvoted: false,
        upvotes: 2,
        sentBy: '19BCE0110',
      ),
    ];
    regNo = sharedPreferences.getString('regNo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title + ' Chatroom',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _messages.length,
          itemBuilder: (context, index) {
            var message = _messages[index];
            bool isSentByUser = message.sentBy == regNo;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: isSentByUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      message.sentBy == 'Faculty'
                          ? Text(
                              'Faculty',
                              style: TextStyle(color: pink),
                            )
                          : isSentByUser
                              ? Container()
                              : Text(
                                  'Student',
                                  style: TextStyle(color: blu),
                                ),
                      isSentByUser ? Container() : SizedBox(height: 15),
                      Text(message.text),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
