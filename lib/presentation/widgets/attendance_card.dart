import 'package:flutter/material.dart';
import 'package:traqr_app/models/attendance.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;

  AttendanceCard(this.attendance);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(15),
            color: Color(0xff252a34),
            child: Row(
              children: [
                Text(attendance.date),
                Spacer(),
                Icon(
                  attendance.attended == true
                      ? Icons.done_rounded
                      : Icons.close_rounded,
                  color:
                      attendance.attended == true ? Colors.green : Colors.red,
                )
              ],
            ),
          )),
    );
  }
}
