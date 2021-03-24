import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traqr_app/presentation/screens/auth_screen.dart';
import 'package:traqr_app/presentation/screens/home_screen.dart';
import 'package:traqr_app/providers/auth_providers.dart';

class SplashScreen extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong. :("),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done)
          return AuthChecker();

        return Scaffold(
          body: Center(
            child: Image.asset('assets/traQR.png'),
          ),
        );
      },
    );
  }
}

class AuthChecker extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(
      data: (value) {
        if (value != null) return HomeScreen();

        return AuthScreen();
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: Image.asset('assets/traQR.png'),
          ),
        );
      },
      error: (_, __) {
        return Scaffold(
          body: Center(
            child: Text("Something went wrong. :("),
          ),
        );
      },
    );
  }
}
