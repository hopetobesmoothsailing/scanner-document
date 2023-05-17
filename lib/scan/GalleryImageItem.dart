import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';

class GalleryImageItem extends StatefulWidget {
    AssetEntity? asset;
    Function? selectAsset;
    GalleryImageItem({required this.asset, required this.selectAsset});

    @override
    _GalleryImageItemState createState() => _GalleryImageItemState();
}

class _GalleryImageItemState extends State<GalleryImageItem> {
    bool _isSelected = false;

    void _selectAsset(id) {
        widget.selectAsset!(id);
        setState(() {
            _isSelected = !_isSelected;
        });
    }

    @override
    Widget build(BuildContext context) {
        return FutureBuilder(
            future: widget.asset!.thumbnailDataWithSize(const ThumbnailSize(200, 200)), //resolution of thumbnail
            builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                    return Material(
                        type: MaterialType.transparency,
                        child: InkWell(
                            onTap: () => _selectAsset(widget.asset!.id),
                            child: Stack(
                                children: <Widget>[
                                    Positioned.fill(
                                        child: ClipRRect(
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            child: Image.memory(
                                                snapshot.data!,
                                                fit: BoxFit.cover,
                                            ),
                                        ),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            color: _isSelected ? const Color.fromRGBO(54, 161, 234, 0.6) : null
                                        ),
                                        child: Center(
                                            child: _isSelected ? const Icon(Icons.check_circle, color: Colors.white, size: 35,) : const Icon(Icons.radio_button_unchecked_outlined, color: Color.fromRGBO(54, 161, 234, 0.6), size: 35,),
                                        ),
                                    )
                                ],
                            ),
                        ),
                    );
                }
                return Container();
            },
        );
    }
}