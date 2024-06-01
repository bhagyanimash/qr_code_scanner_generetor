import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ResultPage extends StatefulWidget {
  final String qrResult;

  const ResultPage({super.key, required this.qrResult});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  get qrResult => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rusult"),
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
          ],
        ),
      ),
    );
    ;
  }
}
