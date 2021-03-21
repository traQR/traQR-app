import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traqr_app/presentation/auth_screen.dart';
import 'package:traqr_app/presentation/home_screen.dart';
import 'package:traqr_app/services/auth.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user != null) {
            return HomeScreen(user: user);
          }
          return LoginScreen();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
