import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:scanner_document/main.dart';
import 'package:scanner_document/scan/FlashModal.dart';
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
            print('HD icon pressed');
        } else if (item == 'sound') {
            print('Sound icon pressed');
        } else if (item == 'more') {
            print('More icon pressed');
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: _isCameraInitialized ? 
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                    SettingBar(currentItem: _selectedSetting, flashIndex: _flashIndex, onItemPressed: onSettingItemPress,),
                    AspectRatio(aspectRatio: controller!.value.aspectRatio, child: controller!.buildPreview(),),
                    Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        height: 150,
                        color: const Color.fromRGBO(26, 39, 72, 1),
                    ),
                ],
            )
            : const Center(
                child: Text('Camera is not mounted'),
            )
        );
    }
}