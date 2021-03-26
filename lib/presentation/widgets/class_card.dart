import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';

class ClassCard extends StatelessWidget {
  final Course course;

  ClassCard({this.course});
  @override
  Widget build(BuildContext context) {
    double attendance = course.attendedClasses /
        (course.attendedClasses + course.missedClasses);
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
                children: [
                  Text(course.title),
                  Text(' ${(attendance * 100).round().toString()}% '),
                ],
              ),
              Text(course.slot),
              RichText(
                text: TextSpan(
                  text: course.attendedClasses.toString(),
                  style: TextStyle(color: Colors.green),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' / ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: course.missedClasses.toString(),
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
