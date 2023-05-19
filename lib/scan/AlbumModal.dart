import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumModal extends StatefulWidget {
    Function? setAlbumId;
    List<AssetPathEntity> albums;
    String? albumId;
    AlbumModal({required this.albums, required this.setAlbumId, this.albumId});

    @override
    _AlbumModalState createState() => _AlbumModalState();
}

class _AlbumModalState extends State<AlbumModal> {
    String _albumId = '';

    void _setAlbumId(id) {
        setState(() {
            _albumId = id;
        });
        widget.setAlbumId!(id);
    }

    @override
    void initState() {
        super.initState();
        _albumId = widget.albumId ?? widget.albums.first.id;
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                    for (var album in widget.albums)
                        FutureBuilder(
                            future: album.assetCountAsync,
                            builder: (context, snapshot) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Row(
                                            children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: const Color.fromRGBO(24, 36, 72, 1)),
                                                        borderRadius: const BorderRadius.all(Radius.circular(10))
                                                    ),
                                                    child: Image.asset(
                                                        'assets/images/doc.png',
                                                    ),
                                                ),
                                                const SizedBox(width: 10,),
                                                Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            '${album.id == 'isAll' ? 'Все фотографии' : album.name}',
                                                            style: const TextStyle(
                                                                fontFamily: 'SF Pro Display',
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 14,
                                                                color: Color.fromRGBO(26, 39, 72, 1)
                                                            ),
                                                        ),
                                                        const SizedBox(height: 5,),
                                                        Text(
                                                            '${snapshot.data}',
                                                            style: const TextStyle(
                                                                fontFamily: 'SF Pro Display',
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 13,
                                                                color: Color.fromRGBO(129, 140, 153, 1)
                                                            ),
                                                        )
                                                    ],
                                                )
                                            ],
                                        ),
                                        IconButton(
                                            onPressed: () => _setAlbumId(album.id),
                                            icon: _albumId == album.id ? const Icon(Icons.radio_button_on_outlined) : const Icon(Icons.radio_button_off_outlined),
                                            color: _albumId == album.id ? const Color.fromRGBO(54, 161, 234, 1) : const Color.fromRGBO(141, 156, 165, 1),
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