import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:traqr_app/models/attendance.dart';
import 'package:traqr_app/presentation/theme.dart';

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
            color: grey,
            child: Row(
              children: [
                Text(DateFormat.yMMMMEEEEd()
                    .format(DateTime.parse(attendance.date))
                    .toString()),
                Spacer(),
                Icon(
                  attendance.status == 'Present'
                      ? Icons.done_rounded
                      : Icons.close_rounded,
                  color: attendance.status == 'Present' ? green : pink,
                )
              ],
            ),
          )),
    );
  }
}
