import 'package:flutter/material.dart';
import 'package:traqr_app/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 15),

          Consumer(builder: (context, watch, child) {
            final _auth = watch(authServicesProvider);
            return ListTile(
              title: Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => _auth.signOut(),
            );
          })
        ],
      ),
    );
  }
}
