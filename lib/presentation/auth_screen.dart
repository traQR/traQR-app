import 'package:flutter/material.dart';
import 'package:traqr_app/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create your account!",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.red[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/google_logo.png',
                      height: 30,
                    ),
                    Text(
                      "Sign in with Google",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                onPressed: () {
                  _auth.signInWithGoogle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
