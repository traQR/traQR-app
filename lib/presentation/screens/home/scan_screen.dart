import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:traqr_app/presentation/theme.dart';
import 'package:traqr_app/repos/scan_repo.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _scanBarcode = 'Unknown';
  Map<String, dynamic> jsonResponse;
  final ScanRepository _repository = ScanRepository();

  @override
  void initState() {
    startBarcodeScanStream() async {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
              "#ff6666", "Cancel", true, ScanMode.BARCODE)
          .listen((barcode) => print(barcode));
    }

    jsonResponse = {
      "facID": "askmaslkd",
      "courseID": "abcdef",
      "courseName": "DSA",
      "slot": "C1",
      "start": "2021-05-11T14:14:00.000",
      "end": "2021-05-11T16:45:00.000"
    };
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff44C951", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                primary: green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Scan QR Code",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Image.asset(
                    'assets/traQR.png',
                    height: 80,
                  ),
                ],
              ),
              onPressed: () async {
                await scanQR();
                var strings = _scanBarcode.split(';');
                _repository.scanCode(strings);
                // _repository.fakeScanCode();
              },
            ),
          ),
          // Text('Scan result : $_scanBarcode\n', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
