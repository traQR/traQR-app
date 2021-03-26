import 'package:flutter/material.dart';
import 'package:traqr_app/presentation/widgets/class_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClassCard(
            title: 'Pepul',
            attendance: 69,
            slot: 'L51 + L52',
            attendedClasses: 10,
            missedClasses: 3,
          ),
        ],
      ),
    );
  }
}
