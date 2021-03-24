import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traqr_app/services/auth.dart';

final authServicesProvider = Provider<Auth>((ref) {
  return Auth();
});

final authStateProvider = StreamProvider<User>((ref) {
  return ref.watch(authServicesProvider).authStateChange;
});
