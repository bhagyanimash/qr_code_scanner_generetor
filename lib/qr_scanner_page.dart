import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQRpage extends StatefulWidget {
  const ScanQRpage({super.key});

  @override
  State<ScanQRpage> createState() => _ScanQRpageState();
}

class _ScanQRpageState extends State<ScanQRpage> {
  String qrResult = "Scanned data will apear here";
  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancle', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = 'Fail to read QR Code';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan QR Code"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              '$qrResult',
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: scanQR, child: const Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
