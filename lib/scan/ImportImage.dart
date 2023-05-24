import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:photo_manager/photo_manager.dart';
import 'dart:typed_data';

import 'package:scanner_document/components/AlbumModal.dart';
import 'package:scanner_document/scan/EditImage.dart';


class ImportImage extends StatefulWidget {
    const ImportImage({Key? key}): super(key: key);

    @override
    _ImportImageState createState() => _ImportImageState();
}

class _ImportImageState extends State<ImportImage> {
    List<AssetEntity> _mediaList = [];
    List<AssetPathEntity> _albums = [];
    List<AssetEntity> _selectedAssets = [];
    String _currentAlbumId = 'isAll';

    Future _getImages() async {
        final PermissionState _ps = await PhotoManager.requestPermissionExtend();
        if (_ps.isAuth) {
            final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(type: RequestType.image);
            List<AssetEntity> media = [];
            media.addAll(await albums[0].getAssetListRange(start: 0, end: 60));
            setState(() {
                _mediaList = media;
                _albums = albums;
            });
        }
    }

    void _setAlbumId(String id) {
        setState(() {
            _currentAlbumId = id;
        });
    }

    void _selectAsset(AssetEntity asset) {
        setState(() {
            if (_selectedAssets.contains(asset)) _selectedAssets.remove(asset);
            else _selectedAssets.add(asset);
        });
    }
    
    @override
    void initState() {
        super.initState();
        _getImages();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                    Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 30, right: 10, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                Row(
                                    children: [
                                        IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.close_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 28,)),
                                        Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextButton.icon(
                                            onPressed: (){
                                                showMaterialModalBottomSheet(
                                                    context: context,
                                                    builder: (context) => AlbumModal(albums: _albums, setAlbumId: _setAlbumId, albumId: _currentAlbumId),
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                                    )
                                                );
                                            },
                                            icon: const Icon(
                                                Icons.expand_more,
                                                color: Color.fromRGBO(54, 161, 234, 1),
                                            ),
                                            label: Text(
                                                _currentAlbumId == 'isAll' ? 'Выбрать' : '${_albums.firstWhere((element) => element.id == _currentAlbumId).name}',
                                                style: const TextStyle(
                                                    fontFamily: 'SF Pro Display',
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: Color.fromRGBO(26, 39, 72, 1),
                                                ),
                                            ),
                                            style: ButtonStyle(
                                                overlayColor: MaterialStateProperty.all(const Color.fromRGBO(26, 39, 72, 0.08))
                                            ),
                                        ),
                                    ),
                                    ],
                                ),
                                TextButton(
                                    onPressed: _selectedAssets.isNotEmpty ? (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditImage(images: _selectedAssets)));
                                    } : null,
                                    style: ButtonStyle(
                                        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 0)),
                                        backgroundColor: _selectedAssets.isNotEmpty ? MaterialStateProperty.all(const Color.fromRGBO(54, 161, 234, 1)) : MaterialStateProperty.all(const Color.fromRGBO(204, 204, 204, 1)),
                                        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7))
                                        )),
                                        overlayColor: MaterialStateProperty.all(const Color.fromRGBO(26, 39, 72, 0.08))
                                    ),
                                    child: Text(
                                        _selectedAssets.isNotEmpty ? 'Импортировать (${_selectedAssets.length})' : 'Импортировать',
                                        style: TextStyle(
                                            color: _selectedAssets.isNotEmpty ? Colors.white : const Color.fromRGBO(26, 39, 72, 0.6),
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 12,
                                        ),
                                    )
                                )
                            ],
                        ),
                    ),
                    Expanded(
                        child: GridView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                            itemCount: _mediaList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20.0,
                                mainAxisSpacing: 20.0
                            ),
                            itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                    onTap: () => _selectAsset(_mediaList[index]),
                                    child: FutureBuilder(
                                        future: _mediaList[index].thumbnailDataWithSize(const ThumbnailSize(200, 200)), //resolution of thumbnail
                                        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
                                            if (snapshot.connectionState == ConnectionState.done) {
                                                return Stack(
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
                                                                color: _selectedAssets.contains(_mediaList[index]) ? const Color.fromRGBO(54, 161, 234, 0.6) : null
                                                            ),
                                                            child: Center(
                                                                child: _selectedAssets.contains(_mediaList[index]) ? const Icon(Icons.check_circle, color: Colors.white, size: 35,) : const Icon(Icons.radio_button_unchecked_outlined, color: Color.fromRGBO(54, 161, 234, 0.6), size: 35,),
                                                            ),
                                                        )
                                                    ],
                                                );
                                            }
                                            return Container();
                                        },
                                    ),
                                );
                            }
                        )
                    ),
                ],
            ),
        );
    }
}