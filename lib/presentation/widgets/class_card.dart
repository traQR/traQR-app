import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final String title;
  final double attendance;
  final String slot;
  final int attendedClasses;
  final int missedClasses;

  ClassCard(
      {this.title,
      this.attendance,
      this.slot,
      this.attendedClasses,
      this.missedClasses});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(15),
          color: Colors.indigo[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(title), Text(attendance.toString())],
              ),
              Text(slot),
              RichText(
                text: TextSpan(
                  text: attendedClasses.toString(),
                  style: TextStyle(color: Colors.green),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' / ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: missedClasses.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
