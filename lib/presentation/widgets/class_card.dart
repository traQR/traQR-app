import 'package:flutter/material.dart';
import 'package:traqr_app/models/course.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
          color: Colors.blue[100],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.title,
                      overflow: TextOverflow.visible,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      course.slot,
                      style: TextStyle(fontSize: 18),
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
                            color: Colors.red[500],
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
                progressColor: attendance > 0.75 ? Colors.green : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
