import 'package:flutter/material.dart';

class OrientationModal extends StatefulWidget {
    int? orientation;
    Function? setOrientation;
    OrientationModal({required this.orientation, required this.setOrientation});

    @override
    _OrientationModalState createState() => _OrientationModalState();
}

class _OrientationModalState extends State<OrientationModal> {
    int _screenOrientation = 0;

    @override
    void initState() {
        _screenOrientation = widget.orientation!;
        super.initState();
    }

    void _setScreenOrientation(index) {
        setState(() {
            _screenOrientation = index;
        });
        widget.setOrientation!(index);
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
                                    Icon(Icons.screen_lock_rotation_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Вспышка Авто',
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
								onPressed: () => _setScreenOrientation(0),
								icon: _screenOrientation == 0 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _screenOrientation == 0 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Icon(Icons.screen_lock_landscape_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Вспышка Авто',
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
								onPressed: () => _setScreenOrientation(1),
								icon: _screenOrientation == 1 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _screenOrientation == 1 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Icon(Icons.screen_lock_portrait_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Вспышка Авто',
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
								onPressed: () => _setScreenOrientation(2),
								icon: _screenOrientation == 2 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _screenOrientation == 2 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                ],
            ),
        );
    }
}