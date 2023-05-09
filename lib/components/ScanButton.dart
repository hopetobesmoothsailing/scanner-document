import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
    Function onScan;
    ScanButton({super.key, required this.onScan});


    @override
    Widget build(BuildContext context) {
        return FloatingActionButton(
            onPressed: () => onScan(),
            elevation: 2.0,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                            Color.fromRGBO(54, 161, 234, 1),
                            Color.fromRGBO(180, 225, 255, 1)
                        ]
                    ),
                    shape: BoxShape.circle
                ),
                child: Image.asset('assets/images/icons/scan.png'),
            ),
        );
    }
}