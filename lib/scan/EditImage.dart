import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:edge_detection/edge_detection.dart';

class EditImage extends StatefulWidget {
    List<AssetEntity>? images;
    EditImage({Key? key, required this.images}): super(key: key);

    @override
    _EditImageState createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
    double _angle = 0;
    bool showProgressBar = false;

    @override
    void initState() {
        super.initState();
        getImage();
    }

    Future<void> getImage() async {
        String? imagePath = '/storage/emulated/0';
        print(widget.images![0].relativePath! + '/' + widget.images![0].title!);
        try {
            var result = await EdgeDetection.detectEdge(widget.images![0].relativePath! + '/' + widget.images![0].title!);
            print(result);
        } on PlatformException catch (e) {
            imagePath = e.toString();
            print(e.toString());
        }
    }

    void _setAngle(angle) {
        setState(() {
            _angle += angle;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                    Container(
                        padding: const EdgeInsets.only(top: 30, left: 5, right: 15, bottom: 8),
                        color: const Color.fromRGBO(30, 39, 73, 1),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                IconButton(
                                    onPressed: (){
                                        Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.arrow_back),
                                    color: Colors.white,
                                ),
                                TextButton(
                                    onPressed: (){},
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 0)),
                                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(54, 161, 234, 1)),
                                        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        )),
                                        overlayColor: MaterialStateProperty.all(const Color.fromRGBO(26, 39, 72, 0.08))
                                    ),
                                    child: const Text(
                                        'Далее',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 12,
                                        ),
                                    )
                                )
                            ],
                        ),
                    ),
                    Expanded(
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                            color: const Color.fromRGBO(72, 79, 106, 1),
                            child: FutureBuilder(
                                future: widget.images![0].thumbnailDataWithSize(const ThumbnailSize(1080, 1920)),
                                builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.done) {
                                        return Transform.rotate(
                                            angle: _angle,
                                            child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: Image(image: MemoryImage(snapshot.data!)),
                                            ),
                                        );
                                    }
                                    return Container();
                                },
                            ),
                        )
                    ),
                    Container(
                        color: const Color.fromRGBO(30, 39, 73, 1),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                        onTap: () => _setAngle(-0.5 * pi),
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                            child: Column(
                                                children: const [
                                                    Icon(Icons.rotate_90_degrees_ccw_outlined, color: Colors.white,),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                        'Влево',
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(141, 156, 165, 1),
                                                            fontFamily: 'SF Pro Display',
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                    ),
                                ),
                                Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                        onTap: () => _setAngle(0.5 * pi),
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                            child: Column(
                                                children: const [
                                                    Icon(Icons.rotate_90_degrees_cw_outlined, color: Colors.white,),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                        'Вправо',
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(141, 156, 165, 1),
                                                            fontFamily: 'SF Pro Display',
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                    ),
                                ),
                                Material(
                                    type: MaterialType.transparency,
                                    child: InkWell(
                                        onTap: (){},
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                            child: Column(
                                                children: const [
                                                    Icon(Icons.fullscreen_outlined, color: Colors.white,),
                                                    SizedBox(height: 5,),
                                                    Text(
                                                        'Выбрать все',
                                                        style: TextStyle(
                                                            color: Color.fromRGBO(141, 156, 165, 1),
                                                            fontFamily: 'SF Pro Display',
                                                            fontSize: 10,
                                                            fontWeight: FontWeight.w400
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                    ),
                                )
                            ],
                        ),
                    )
                ],
            ),
        );
    }
}