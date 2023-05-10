import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
    final String image;
    final String label;
    Function? onPressed;
    ImageTextButton({required this.image, required this.label, this.onPressed});

    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Container(
                    decoration: const BoxDecoration(
                        boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(24, 39, 72, 0.08),
                                blurRadius: 10,
                                offset: Offset(0, 4)
                            )
                        ]
                    ),
                    child: IconButton(
                        onPressed: () => onPressed, icon: Image.asset(image),
                        iconSize: 56,
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(10),
                            shadowColor: MaterialStateProperty.all(Color.fromRGBO(24, 39, 72, 0.12)),
                        ),
                    ),
                ),
                Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontStyle: FontStyle.normal,
                        fontSize: 10,
                        color: Color.fromRGBO(26, 39, 72, 1)
                    ),
                )
            ],
        );
    }
}