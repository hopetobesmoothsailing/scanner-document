import 'package:flutter/material.dart';

class HDModal extends StatefulWidget {

    @override
    _HDModalState createState() => _HDModalState();
}

class _HDModalState extends State<HDModal> {
    int _hdIndex = 0;

    void _setHDIndex(index) {
        setState(() {
            _hdIndex = index;
        });
    }
    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '12M (4000 x 3000)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Image.asset(
                                        'assets/images/icons/leaderboard.png',
                                        width: 15,
                                        height: 15,
                                    ),
                                    IconButton(
                                        onPressed: () => _setHDIndex(0),
                                        icon: _hdIndex == 0 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
                                        color: _hdIndex == 0 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
                                    )
                                ],
                            )
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '12M (4000 x 3000)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Image.asset(
                                        'assets/images/icons/leaderboard.png',
                                        width: 15,
                                        height: 15,
                                    ),
                                    IconButton(
                                        onPressed: () => _setHDIndex(1),
                                        icon: _hdIndex == 1 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
                                        color: _hdIndex == 1 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
                                    )
                                ],
                            )
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '8M (3840 x 2160)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(2),
								icon: _hdIndex == 2 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 2 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '5M (2592 x 1944)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(3),
								icon: _hdIndex == 3 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 3 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '3M (2048 x 1536)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(4),
								icon: _hdIndex == 4 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 4 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '2M (1920 x 1080)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(5),
								icon: _hdIndex == 5 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 5 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '2M (1600 x 1200)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(6),
								icon: _hdIndex == 6 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 6 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '2M (1440 x 1080)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(7),
								icon: _hdIndex == 7 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 7 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '1M (1280 x 960)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(8),
								icon: _hdIndex == 8 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 8 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '983K (1280 x 768)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(9),
								icon: _hdIndex == 9 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 9 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Text(
                                        '921K (1280 x 720)',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Display',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14,
                                            color: Color.fromRGBO(26, 39, 72, 1)
                                        ),
                                    )
                                ],
                            ),
                            IconButton(
								onPressed: () => _setHDIndex(10),
								icon: _hdIndex == 10 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _hdIndex == 10 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    )
                ],
            ),
        );
    }
}