import 'package:flutter/material.dart';

class FlashModal extends StatefulWidget {
	Function? setFlashIndex;

    FlashModal({this.setFlashIndex});

    @override
    _FlashModalState createState() => _FlashModalState();
}

class _FlashModalState extends State<FlashModal> {
    int _flashIndex = 0;

	void _setFlashIndex(index) {
		setState(() {
			_flashIndex = index;
		});
		widget.setFlashIndex!(index);
	}

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
			decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
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
                                    Icon(Icons.flash_auto, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
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
								onPressed: () => _setFlashIndex(0),
								icon: _flashIndex == 0 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _flashIndex == 0 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Icon(Icons.flash_on, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Вспышка ВКЛ',
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
								onPressed: () => _setFlashIndex(1),
								icon: _flashIndex == 1 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _flashIndex == 1 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Icon(Icons.flash_off, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Вспышка ВЫКЛ',
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
								onPressed: () => _setFlashIndex(2),
								icon: _flashIndex == 2 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _flashIndex == 2 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Row(
                                children: const [
                                    Icon(Icons.highlight_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 20,),
                                    SizedBox(width: 10,),
                                    Text(
                                        'Фонарь',
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
								onPressed: () => _setFlashIndex(3),
								icon: _flashIndex == 3 ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
								color: _flashIndex == 3 ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
							)
                        ],
                    )
                ],
            ),
        );
    }
}