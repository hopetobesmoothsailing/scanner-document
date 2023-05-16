import 'package:flutter/material.dart';
import 'package:scanner_document/components/BottomBar.dart';
import 'package:scanner_document/components/ScanButton.dart';
import 'package:scanner_document/home/index.dart';
import 'package:scanner_document/scan/index.dart';

class Files extends StatefulWidget {
    const Files({Key? key}): super(key: key);

    @override
    _FilesState createState() => _FilesState();
}

class _FilesState extends State<Files> {
    int _selectedIndex = 1;

    @override
    void initState() {
        super.initState();
    }

    void _selectedTab(int index) {
        setState(() {
            _selectedIndex = index;
        });
        if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
        }
    }

    void onScan() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scan()));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: ScanButton(onScan: () => onScan()),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomBar(
                onTabSelected: _selectedTab,
                items: [
                    BottomBarItem(icon: 'assets/images/icons/home.png', label: 'Home', hasNotification: false),
                    BottomBarItem(icon: 'assets/images/icons/files.png', label: 'Files', hasNotification: false),
                    BottomBarItem(icon: 'assets/images/icons/tools.png', label: 'Tools', hasNotification: false),
                    BottomBarItem(icon: 'assets/images/icons/profile.png', label: 'Profile', hasNotification: true),
                ],
                currentIndex: 1,
            ),
            body: Column(
                children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30, left: 15, bottom: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                const Text(
                                    'Файлы',
                                    style: TextStyle(
                                        color: Color.fromRGBO(26, 39, 72, 1),
                                        fontFamily: String.fromEnvironment('SF Pro Display'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ),
                                ),
                                Row(
                                    children: [
                                        IconButton(onPressed: () {}, icon: Image.asset('assets/images/icons/search.png')),
                                        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                                    ],
                                )
                            ],
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.create_new_folder_outlined), iconSize: 20, color: const Color.fromRGBO(141, 156, 165, 1)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.unfold_more), iconSize: 20, color: const Color.fromRGBO(141, 156, 165, 1)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.grid_view), iconSize: 20,  color: const Color.fromRGBO(141, 156, 165, 1)),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.check_box_outlined), iconSize: 22,  color: const Color.fromRGBO(141, 156, 165, 1)),
                                    ],
                                )
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}