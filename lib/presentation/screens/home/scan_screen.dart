import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:traqr_app/presentation/theme.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    startBarcodeScanStream() async {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
              "#ff6666", "Cancel", true, ScanMode.BARCODE)
          .listen((barcode) => print(barcode));
    }

    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff44C951", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
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
              onPressed: () {
                scanQR();
              },
            ),
          ),
          Text('Scan result : $_scanBarcode\n', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
