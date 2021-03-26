import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                primary: Colors.green[400],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/traQR.png',
                    height: 80,
                  ),
                  Text(
                    "Scan QR Code",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
