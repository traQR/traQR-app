import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traqr_app/services/init_bindings.dart';
import 'package:traqr_app/services/shared_prefs.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/theme.dart';
import 'package:get/get.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        primaryColor: blu,
        scaffoldBackgroundColor: Colors.black,
      ),
      initialBinding: InitBindings(),
      home: SplashScreen(),
    );
  }
}
