import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:traqr_app/providers/auth_providers.dart';

class AuthScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _auth = watch(authServicesProvider);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create your account with your VIT email!",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(20),
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  primary: pink,
                ),
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
                  _auth.signInWithGoogle().then((value) async {
                    if (value == false) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Please use your VIT email'),
                        duration: const Duration(seconds: 3),
                      ));
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
