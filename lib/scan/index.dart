import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scanner_document/main.dart';
import 'package:scanner_document/components/FlashModal.dart';
import 'package:scanner_document/components/HDModal.dart';
import 'package:scanner_document/scan/ImportFile.dart';
import 'package:scanner_document/scan/ImportImage.dart';
import 'package:scanner_document/scan/SettingBar.dart';

class Scan extends StatefulWidget {
    const Scan({Key? key}): super(key: key);

    @override
    _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> with WidgetsBindingObserver {
    CameraController? controller;
    bool _isCameraInitialized = false;
    int _flashIndex = 0;
    int _soundIndex = 0;
    String _selectedSetting = '';

    void onNewCameraSelected(CameraDescription cameraDescription) async{
        final previousController = controller;
        final CameraController cameraController = CameraController(
            cameraDescription,
            ResolutionPreset.max
        );

        await previousController?.dispose();

        if (mounted) {
            setState(() {
                controller = cameraController;
            });
        }

        cameraController.addListener(() {
            if (mounted) {
                setState(() {});
            }
        });

        try {
            await cameraController.initialize();
        } on CameraException catch (e) {
            print('Error initializing camera $e');
        }

        if (mounted) {
            setState(() {
                _isCameraInitialized = controller!.value.isInitialized;
            });
        }
    }

    @override
    void initState() {
        onNewCameraSelected(cameras![0]);
        WidgetsBinding.instance.addObserver(this);
        super.initState();
    }

    @override
    void dispose() {
        controller?.dispose();
        WidgetsBinding.instance.removeObserver(this);
        super.dispose();
    }

    @override
    void didChangeAppLifecycleState(AppLifecycleState state) {
        final CameraController? cameraController = controller;

        if (cameraController == null || !cameraController.value.isInitialized) return;

        if (state == AppLifecycleState.inactive) {
            cameraController.dispose();
        } else if (state == AppLifecycleState.resumed) {
            onNewCameraSelected(cameraController.description);
        }
    }

    void _setFlashIndex(index) {
        setState(() {
            _flashIndex = index;
        });
    }

    void onSettingItemPress(String? item) {
        if (item == 'flash') {
            setState(() {
                _selectedSetting = 'flash';
            });
            showMaterialModalBottomSheet(
                context: context,
                builder: (context) => FlashModal(setFlashIndex: _setFlashIndex),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                )
            ).whenComplete(() => {
                setState(() {
                    _selectedSetting = '';
                })
            });
        } else if (item == 'hd') {
            setState(() {
                _selectedSetting = 'hd';
            });
            showMaterialModalBottomSheet(
                context: context,
                builder: (context) => HDModal(),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                )
            ).whenComplete(() => {
                setState(() {
                    _selectedSetting = '';
                })
            });
        } else if (item == 'sound') {
            setState(() {
                _selectedSetting = 'sound';
                if (_soundIndex == 0) _soundIndex = 1;
                else _soundIndex = 0;
            });
        } else if (item == 'more') {
            print('More icon pressed');
        }
    }

    @override
    Widget build(BuildContext context) {
        return DefaultTabController(
            length: 9,
            child: Scaffold(
                bottomNavigationBar: BottomAppBar(
                    color: const Color.fromRGBO(26, 39, 72, 1),
                    child: Container(
                        height: 180,
                        child: Column(
                            children: [
                                PreferredSize(
                                    preferredSize: const Size.fromHeight(20.0),
                                    child: TabBar(
                                        isScrollable: true,
                                        unselectedLabelColor: Colors.white.withOpacity(0.3),
                                        indicator: const BoxDecoration(
                                            color: Color.fromRGBO(54, 161, 234, 1),
                                            borderRadius: BorderRadius.all(Radius.circular(10)),
                                        ),
                                        indicatorPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                                        tabs: const [
                                            Tab(
                                                child: Text('PPT'),
                                            ),
                                            Tab(
                                                child: Text('To Excel'),
                                            ),
                                            Tab(
                                                child: Text('To Text'),
                                            ),
                                            Tab(
                                                child: Text('To Word'),
                                            ),
                                            Tab(
                                                child: Text('Single'),
                                            ),
                                            Tab(
                                                child: Text('Batch'),
                                            ),
                                            Tab(
                                                child: Text('ID Cards'),
                                            ),
                                            Tab(
                                                child: Text('Question Set'),
                                            ),
                                            Tab(
                                                child: Text('Translate'),
                                            ),
                                        ],
                                    ),
                                ),
                                Expanded(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                            Expanded(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        TextButton(
                                                            onPressed: (){
                                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ImportFile()));
                                                            },
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: const [
                                                                    Icon(Icons.file_present_outlined, color: Colors.white),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                        'Импортировать\nфайлы',
                                                                        style: TextStyle(
                                                                            fontSize: 10,
                                                                            color: Colors.white
                                                                        ),
                                                                        textAlign: TextAlign.center,
                                                                    )
                                                                ],
                                                            )
                                                        ),
                                                        TextButton(
                                                            onPressed: (){
                                                                Navigator.push(context, MaterialWithModalsPageRoute(builder: (context) => const ImportImage()));
                                                            },
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: const [
                                                                    Icon(Icons.image_outlined, color: Colors.white),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                        'Импорт',
                                                                        style: TextStyle(
                                                                            fontSize: 10,
                                                                            color: Colors.white
                                                                        ),
                                                                        textAlign: TextAlign.center,
                                                                    )
                                                                ],
                                                            )
                                                        ),
                                                        const SizedBox(width: 10,)
                                                    ],
                                                )
                                            ),
                                            FloatingActionButton(
                                                onPressed: (){},
                                                elevation: 3.0,
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
                                                    child: const Icon(
                                                        Icons.photo_camera,
                                                        size: 26,
                                                    ),
                                                ),
                                            ),
                                            Expanded(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                        const SizedBox(width: 10,),
                                                        TextButton(
                                                            onPressed: (){},
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: const [
                                                                    Icon(Icons.layers_outlined, color: Colors.white),
                                                                    SizedBox(height: 5,),
                                                                    Text(
                                                                        'Пакетный\nрежим',
                                                                        style: TextStyle(
                                                                            fontSize: 10,
                                                                            color: Colors.white
                                                                        ),
                                                                        textAlign: TextAlign.center,
                                                                    )
                                                                ],
                                                            )
                                                        )
                                                    ],
                                                )
                                            ),
                                        ],
                                    )
                                ),
                            ],
                        ),
                    ),
                ),
                body: _isCameraInitialized ? 
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                        SettingBar(currentItem: _selectedSetting, flashIndex: _flashIndex, soundIndex: _soundIndex, onItemPressed: onSettingItemPress,),
                        AspectRatio(aspectRatio: controller!.value.aspectRatio, child: controller!.buildPreview(),),
                        Container(),
                    ],
                )
                : const Center(
                    child: Text('Camera is not mounted'),
                )
            )
        );
    }
}