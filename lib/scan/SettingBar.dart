import 'package:flutter/material.dart';

List<Icon> flashIcons = const [
    Icon(Icons.flash_auto),
    Icon(Icons.flash_on),
    Icon(Icons.flash_off),
    Icon(Icons.highlight_outlined)
];

class SettingBar extends StatefulWidget {
    int? flashIndex;
    String? currentItem;
    Function? onItemPressed;

    SettingBar({Key? key, this.currentItem, required this.flashIndex, this.onItemPressed}): super(key: key);

    @override
    _SettingBarState createState() => _SettingBarState();
}

class _SettingBarState extends State<SettingBar> {
    String? _currentItem;

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
        });
        widget.onItemPressed!(item);
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
        return Container(
            padding: const EdgeInsets.only(top: 30, left: 5, right: 5),
            color: const Color.fromRGBO(26, 39, 72, 1),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                    IconButton(onPressed: (){_onItemPressed('flash');}, icon: flashIcons[widget.flashIndex!], color: _currentItem == 'flash' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                    IconButton(onPressed: (){_onItemPressed('hd');}, icon: const Icon(Icons.hd),color: _currentItem == 'hd' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                    IconButton(onPressed: (){_onItemPressed('sound');}, icon: const Icon(Icons.volume_up_outlined),color: _currentItem == 'sound' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                    IconButton(onPressed: (){_onItemPressed('more');}, icon: const Icon(Icons.more_vert),color: _currentItem == 'more' ? const Color.fromRGBO(54, 161, 234, 1) : Colors.white,),
                ],
            ),
        );
    }
}