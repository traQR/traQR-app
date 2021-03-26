import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traqr_app/presentation/screens/auth_screen.dart';
import 'package:traqr_app/providers/auth_providers.dart';

import 'home/base_screen.dart';

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _authState = watch(authStateProvider);
    return _authState.when(
      data: (value) {
        if (value != null)
          return BaseScreen();
        else
          return AuthScreen();
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: Image.asset('assets/traQR.png'),
          ),
        );
      },
      error: (error, stackTrace) {
        return Scaffold(
          body: Center(
            child: Text("Something went wrong. :("),
          ),
        );
      },
    );
  }
}
