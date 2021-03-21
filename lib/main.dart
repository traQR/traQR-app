import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:traqr_app/presentation/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: Wrapper(),
    ),
  );
}
