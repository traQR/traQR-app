import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
          color: grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      course.title,
                      overflow: TextOverflow.visible,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                          color: blu, borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        course.slot,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                course.attendedClasses.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(5),
                            color: pink,
                            child: Center(
                              child: Text(
                                course.missedClasses.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 10.0,
                percent: attendance,
                center: Text(' ${(attendance * 100).round().toString()}% '),
                backgroundColor: Colors.grey,
                progressColor: attendance > 0.75 ? green : pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
