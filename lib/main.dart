import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() {
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
