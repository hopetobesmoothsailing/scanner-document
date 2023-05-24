import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scanner_document/components/OrientationModal.dart';

List<Icon> flashIcons = const [
    Icon(Icons.flash_auto),
    Icon(Icons.flash_on),
    Icon(Icons.flash_off),
    Icon(Icons.highlight_outlined)
];

List<IconData> screenOrientations = [
    Icons.screen_lock_rotation_outlined,
    Icons.screen_lock_landscape_outlined,
    Icons.screen_lock_portrait_outlined
];

List<IconData> cameraMode = [
    Icons.camera,
    Icons.lens_blur
];

class SettingBar extends StatefulWidget {
    int? flashIndex;
    int? soundIndex;
    String? currentItem;
    Function? onItemPressed;

    SettingBar({Key? key, this.currentItem, required this.flashIndex, required this.soundIndex, this.onItemPressed}): super(key: key);

    @override
    _SettingBarState createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
    String? _currentItem;
    bool _moreSettingBar = false;
    int _screenOrientation = 0;
    int _cameraMode = 1;
    String _currentMoreItem = '';

    @override
    void initState() {
        super.initState();
        _currentItem = widget.currentItem ?? '';
    }

    void resetItem() {
        setState(() {
            _currentItem = '';
        });
    }

    void _onItemPressed(item) {
        setState(() {
            _currentItem = item;
            if (item == 'more') {
                _moreSettingBar = !_moreSettingBar;
            } else {
                _moreSettingBar = false;
                _currentMoreItem = '';
            }
        });
        widget.onItemPressed!(item);
    }

    void _setScreenOrientation(index) {
        setState(() {
            _screenOrientation = index;
        });
    }

    @override
    void didUpdateWidget (SettingBar oldWidget) {
        super.didUpdateWidget(oldWidget);
        setState(() {
            _currentItem = widget.currentItem ?? '';
        });
    }
    @override
    Widget build(BuildContext context) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [                
                Container(
                    padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
                    color: const Color.fromRGBO(26, 39, 72, 1),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            IconButton(onPressed: (){_onItemPressed('flash');}, icon: flashIcons[widget.flashIndex!], color: _currentItem == 'flash' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                            IconButton(onPressed: (){_onItemPressed('hd');}, icon: const Icon(Icons.hd), color: _currentItem == 'hd' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                            IconButton(onPressed: (){_onItemPressed('sound');}, icon: widget.soundIndex == 0 ? const Icon(Icons.volume_up_outlined) : const Icon(Icons.volume_off_outlined), color: _currentItem == 'sound' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                            IconButton(onPressed: (){_onItemPressed('more');}, icon: const Icon(Icons.more_vert), color: _currentItem == 'more' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                        ],
                    ),
                ),
                _moreSettingBar ? Container(
                    padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Color.fromRGBO(26, 39, 72, 1),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            TextButton(
                                onPressed: (){},
                                child: Column(
                                    children: const [
                                        Icon(Icons.grid_on, color: Color.fromRGBO(54, 161, 234, 1),),
                                        SizedBox(height: 5,),
                                        Text(
                                            'Сетка',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromRGBO(54, 161, 234, 1)
                                            ),
                                        )
                                    ],
                                ),
                            ),
                            TextButton(
                                onPressed: (){},
                                child: Column(
                                    children: const [
                                        Icon(Icons.mode_standby, color: Color.fromRGBO(54, 161, 234, 1),),
                                        SizedBox(height: 5,),
                                        Text(
                                            'Уровень',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color.fromRGBO(54, 161, 234, 1)
                                            ),
                                        )
                                    ],
                                ),
                            ),
                            TextButton(
                                onPressed: (){
                                    setState(() {
                                        _currentMoreItem = 'orientation';
                                    });
                                    showMaterialModalBottomSheet(
                                        context: context,
                                        builder: (context) => OrientationModal(orientation: _screenOrientation, setOrientation: _setScreenOrientation,),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                        )
                                    ).whenComplete(() => {
                                        setState(() {
                                            _currentMoreItem = '';
                                        })
                                    });
                                },
                                child: Column(
                                    children: [
                                        Icon(screenOrientations[_screenOrientation], color: _currentMoreItem == 'orientation' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                                        const SizedBox(height: 5,),
                                        Text(
                                            'Автоповорот',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: _currentMoreItem == 'orientation' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white
                                            ),
                                        )
                                    ],
                                ),
                            ),
                            TextButton(
                                onPressed: (){
                                    setState(() {
                                        _currentMoreItem = 'camera';
                                        if (_cameraMode == 0) _cameraMode = 1;
                                        else _cameraMode = 0;
                                    });
                                },
                                child: Column(
                                    children: [
                                        Icon(cameraMode[_cameraMode], color: _currentMoreItem == 'camera' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                                        const SizedBox(height: 5,),
                                        Text(
                                            'Автозатвор',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: _currentMoreItem == 'camera' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white
                                            ),
                                        )
                                    ],
                                ),
                            ),
                        ],
                    ),
                )
                : Container()
            ],
        );
    }
}