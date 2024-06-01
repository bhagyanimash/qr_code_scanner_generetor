import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generetor/firebase_options.dart';
import 'package:qr_code_scanner_generetor/qr_generator_page.dart';
import 'package:qr_code_scanner_generetor/qr_scanner_page.dart';
import 'package:qr_code_scanner_generetor/result_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "scanPage": (context) => const ScanQRpage(),
        "generatePage": (context) => const GenerateQRpage(),
        "resultPage": (context) => ResultPage(
              qrResult: '',
            )
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner and Generator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "scanPage");
              },
              child: const Text("Scan QR Code"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "generatePage");
              },
              child: const Text("Generate QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
