import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scanbot_sdk/scanbot_sdk.dart';
import 'package:scanbot_sdk/scanbot_sdk_models.dart';
import 'dart:async';
import 'home/index.dart';

List<CameraDescription>? cameras;
String ScanBotSdk_License = 
  "NW5zftOegpKQE8RdGUePC1cCWfoYPj" +
  "j/9feFekJkbKzFQSWR1ezR0u12Hwlr" +
  "F+k4wBEyGP/k3kgP9jslYYt86aTCcf" +
  "rcUuZ3DVUms0vv+iY+guX0lxJhionE" +
  "5N8L/UrdzUy1kE2++g7+WeuzWoZMux" +
  "eJdGFm2h3aWisgji+h/EsbjeeoY8Qp" +
  "GvqdPKgZ2IVvMb96itZQ4My6Oltu54" +
  "LF24z36+0KmuLvCNEA8N8U+vacn2VP" +
  "f/SjiHnG2KG7LU6rKLOUznQFo1SyOx" +
  "k1ILNaozZrXe752mj63fwaRY2T/1oi" +
  "wHyDqtWnwVZpJQ0L/Z+WHSsxQc0fET" +
  "gdi7bURiumiQ==\nU2NhbmJvdFNESw" +
  "pTY2FubmVyRG9jdW1lbnQKMTY4NTE0" +
  "NTU5OQo4Mzg4NjA3CjE5\n";

Future<void> main() async{
    try {
        WidgetsFlutterBinding.ensureInitialized();
        cameras = await availableCameras();
    } on CameraException catch (e) {
        print('Error in fetching the cameras: $e');
    }
    // await ScanbotSdk.initScanbotSdk(ScanbotSdkConfig(licenseKey: ScanBotSdk_License));
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
    const MainApp({super.key});

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen());
    }
}

class SplashScreen extends StatefulWidget {
    const SplashScreen({Key? key}) : super(key: key);

    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    bool storagePermissionGranted = false;
    bool cameraPersmissionGranted = false;

    @override
    void initState() {
        super.initState();
        Future.delayed(const Duration(seconds: 3), () {
            _getStoragePermission();
            _getCameraPermission();
        });
    }

    @override
    void dispose() {
        super.dispose();
    }

    Future _getStoragePermission() async {
        if (await Permission.storage.request().isGranted) {
            setState(() {
                storagePermissionGranted = true;
                print('StoragePermission is granted');
            });
        } else if (await Permission.storage.request().isPermanentlyDenied) {
            await openAppSettings();
        } else if (await Permission.storage.request().isDenied) {
            setState(() {
                print('StoragePermission is denied');
                storagePermissionGranted = false;
            });
        }
    }

    Future _getCameraPermission() async {
        print('_getCameraPermission');
        if (await Permission.camera.request().isGranted) {
            setState(() {
                print('CameraPermission is granted');
                cameraPersmissionGranted = true;
            });
        } else if (await Permission.camera.request().isPermanentlyDenied) {
            await openAppSettings();
        } else if (await Permission.camera.request().isDenied) {
            setState(() {
                print('CameraPermission is denied');
                cameraPersmissionGranted = false;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        if (cameraPersmissionGranted && storagePermissionGranted) {
            return const Home();
        } else  {
            return Scaffold(
                body: Container(
                    color: Colors.blue,
                    child: Stack(
                        fit: StackFit.expand,
                        children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Image.asset(
                                            'assets/images/icon.png',
                                            alignment: Alignment.center,
                                        ),
                                        const Text(
                                            'Scanner Document',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.white,
                                        ),
                                    )
                                ],
                            ),
                            Positioned.fill(
                                bottom: 150,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        alignment: Alignment.center,
                                        child: const CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3,
                                        ),
                                    ),
                                )
                            )
                        ],
                    ),
                ),
            );
        }
    }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Hello world'),
    );
  }
}
