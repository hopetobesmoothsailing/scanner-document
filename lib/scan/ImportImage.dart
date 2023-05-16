import 'package:flutter/material.dart';

class ImportImage extends StatefulWidget {
    const ImportImage({Key? key}): super(key: key);

    @override
    _ImportImageState createState() => _ImportImageState();
}

class _ImportImageState extends State<ImportImage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
            body: Column(
                children: [
                    Row(
                        children: [
                            Row(
                                children: [
                                    IconButton(onPressed: (){}, icon: const Icon(Icons.close_outlined)),
                                    Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextButton.icon(
                                        onPressed: (){},
                                        icon: const Icon(
                                            Icons.expand_more,
                                            color: Color.fromRGBO(26, 39, 72, 1),
                                        ),
                                        label: const Text(
                                            'Bce(0)',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16,
                                                color: Color.fromRGBO(26, 39, 72, 1),
                                            ),
                                        ),
                                        style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.all(const Color.fromRGBO(26, 39, 72, 0.08))
                                        ),
                                    ),
                                ),
                                ],
                            )
                        ],
                    )
                ],
            ),
        );
    }
}