import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:scanner_document/components/BottomBar.dart';
import 'package:scanner_document/components/ImageTextButton.dart';
import 'package:scanner_document/components/ScanButton.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scanner_document/files/index.dart';
import 'package:scanner_document/main.dart';
import 'package:scanner_document/scan/index.dart';

class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int _selectedIndex = 0;

    void _selectedTab(int index) {
        setState(() {
            _selectedIndex = index;
        });
        if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Files()));
        }
    }

    void onScan() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scan()));
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
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
                currentIndex: 0,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                    Container(
                        margin: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                const Text(
                                    'Scanner Document',
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
                                        IconButton(onPressed: () {}, icon: Image.asset('assets/images/icons/leaderboard.png')),
                                    ],
                                )
                            ],
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Column(
                            children: [
                                Row(
                                    children: [
                                        Container(
                                            margin: const EdgeInsets.only(right: 5),
                                            child: const Text(
                                                'Хранилище',
                                                style: TextStyle(
                                                    fontFamily: String.fromEnvironment('SF Pro Display'),
                                                    fontSize: 14,
                                                    fontStyle: FontStyle.normal,
                                                    color: Color.fromRGBO(26, 39, 72, 1)
                                                ),
                                            ),
                                        ),
                                        const Icon(
                                            Icons.cloud_outlined,
                                            color: Color.fromRGBO(141, 156, 165, 1),
                                        ),
                                    ],
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Column(
                                        children: [
                                            LinearPercentIndicator(
                                                progressColor: const Color.fromRGBO(51, 161, 234, 1),
                                                backgroundColor: const Color.fromRGBO(202, 229, 253, 1),
                                                barRadius: const Radius.circular(4),
                                                percent: 0.6,
                                            ),
                                            Transform.translate(
                                                offset: const Offset(10, -10),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                        const Text(
                                                            '5 Мб из 300 Мб использовано',
                                                            style: TextStyle(
                                                                fontFamily: String.fromEnvironment('SF Pro Display'),
                                                                fontSize: 10,
                                                                fontStyle: FontStyle.normal,
                                                                color: Color.fromRGBO(141, 156, 165, 1)
                                                            ),
                                                        ),
                                                        Transform.translate(
                                                            offset: const Offset(-10, 0),
                                                            child: Directionality(
                                                            textDirection: TextDirection.rtl,
                                                            child: TextButton.icon(
                                                                    onPressed: () {},
                                                                    icon: const Icon(Icons.add_circle_outline, size: 12,),
                                                                    label: const Text('Больше места'),
                                                                    style: TextButton.styleFrom(
                                                                        textStyle: const TextStyle(fontSize: 10),
                                                                    )
                                                                ),
                                                            ),
                                                        )
                                                    ],
                                                ),
                                            )
                                        ],
                                    ),
                                )
                            ],
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                ImageTextButton(image: 'assets/images/icons/smart_scan.png', label: 'Умное\nсканирование'),
                                ImageTextButton(image: 'assets/images/icons/pdf_tools.png', label: 'Инструменты\nPDF'),
                                ImageTextButton(image: 'assets/images/icons/import_image.png', label: 'Импорт\nизображения'),
                                ImageTextButton(image: 'assets/images/icons/import_fvylov.png', label: 'Импорт\nфвйлов'),
                            ],
                        ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                ImageTextButton(image: 'assets/images/icons/id_document.png', label: 'Сканировать\nID-документ'),
                                ImageTextButton(image: 'assets/images/icons/image_text.png', label: 'Изображение в\nтекст'),
                                ImageTextButton(image: 'assets/images/icons/portrait.png', label: 'Улучш.\nпортрет'),
                                ImageTextButton(image: 'assets/images/icons/all.png', label: 'Все'),
                            ],
                        ),
                    ),
                    Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(24, 39, 72, 0.12),
                                        blurRadius: 10,
                                        offset: Offset(0, 2)
                                    )
                                ]
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.all(20),
                                        width: double.infinity,
                                        child: const Text(
                                            'Последние документы',
                                            style: TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                fontStyle: FontStyle.normal,
                                                fontSize: 16,
                                                color: Color.fromRGBO(24, 39, 72, 1)
                                            ),
                                        ),
                                    ),
                                    Expanded(
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Image.asset('assets/images/icons/files_large.png'),
                                                Container(
                                                    margin: const EdgeInsets.only(top: 5),
                                                    child: const Text(
                                                        'Недавних файлов нет',
                                                        style: TextStyle(
                                                            fontFamily: 'SF Pro Display',
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 14,
                                                            color: Color.fromRGBO(141, 156, 165, 1)
                                                        ),
                                                    ),
                                                ),
                                                Container(
                                                    margin: const EdgeInsets.only(top: 10),
                                                    child: TextButton(
                                                        onPressed: (){},
                                                        style: ButtonStyle(
                                                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 0, horizontal: 15)),
                                                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                                side: const BorderSide(
                                                                    color: Color.fromRGBO(54, 161, 234, 1),
                                                                ),
                                                                borderRadius: BorderRadius.circular(10),
                                                            ))
                                                        ),
                                                        child: const Text(
                                                            'Сканировать новые документы',
                                                            style: TextStyle(
                                                                fontFamily: 'SF Pro Display',
                                                                fontSize: 14,
                                                                fontStyle: FontStyle.normal,
                                                                color: Color.fromRGBO(54, 161, 234, 1)
                                                            ),
                                                        ),
                                                    ),
                                                )
                                            ],
                                        ),
                                    )
                                ],
                            ),
                        ),
                    )
                ],
            ),
        );
    }
}
