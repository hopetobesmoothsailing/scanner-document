import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ImportFile extends StatefulWidget {

    @override
    _ImportFileState createState() => _ImportFileState();
}

class _ImportFileState extends State<ImportFile> {
    List<File> _documentFiles = [];
    List<File> _selectedFiles = [];

    @override
    void initState() {
        getAllFiles();
    }

    void getAllFiles() async {
        final Directory dir = Directory('storage/emulated/0');
        final String path = dir.path;

        final List<FileSystemEntity> files = Directory(path).listSync(recursive: true);
        setState(() {
            _documentFiles = files.where((file) => 
                file.path.endsWith('.pdf') ||
                file.path.endsWith('.doc') ||
                file.path.endsWith('.docx') ||
                file.path.endsWith('.ppt') ||
                file.path.endsWith('.pptx')).whereType<File>().toList();
        });
    }

    void selectFile(file) {
        setState(() {
            if (_selectedFiles.contains(file)) _selectedFiles.remove(file);
            else _selectedFiles.add(file);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
                children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            Container(
                                padding: const EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 10),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                                IconButton(onPressed: (){
                                                    Navigator.pop(context);
                                                }, icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(54, 161, 234, 1),)),
                                                const SizedBox(width: 10,),
                                                Text(
                                                    _selectedFiles.length > 0 ? '${_selectedFiles.length} выбрано' : 'Импорт файлов',
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(26, 39, 72, 1),
                                                        fontFamily: 'SF Pro Display',
                                                        fontSize: 23,
                                                        fontWeight: FontWeight.w600,
                                                    ),
                                                )
                                            ],
                                        ),
                                        IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined, color: Color.fromRGBO(141, 156, 165, 1), size: 30,))
                                    ],
                                ),
                            ),
                            Expanded(
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            TextButton.icon(
                                                onPressed: (){},
                                                icon: Image.asset('assets/images/icons/file_manager.png'),
                                                label: const Text(
                                                    'Файловый менеджер',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(26, 39, 72, 1),
                                                        fontFamily: 'SF Pro Display',
                                                        fontSize: 14
                                                    )
                                                )
                                            ),
                                            TextButton.icon(
                                                onPressed: (){},
                                                icon: Image.asset('assets/images/icons/google_drive.png'),
                                                label: const Text(
                                                    'Диск',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(26, 39, 72, 1),
                                                        fontFamily: 'SF Pro Display',
                                                        fontSize: 14
                                                    )
                                                )
                                            ),
                                            TextButton.icon(
                                                onPressed: (){},
                                                icon: Image.asset('assets/images/icons/conductor.png'),
                                                label: const Text(
                                                    'Проводник',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(26, 39, 72, 1),
                                                        fontFamily: 'SF Pro Display',
                                                        fontSize: 14
                                                    )
                                                )
                                            ),
                                            Expanded(
                                                child: ListView.builder(
                                                    padding: const EdgeInsets.only(top: 5, bottom: 40),
                                                    itemCount: _documentFiles.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                        final file = _documentFiles[index];
                                                        final Directory parentDirectory = Directory(dirname(file.path));
                                                        return Container(
                                                            padding: const EdgeInsets.only(left: 10, bottom: 10),
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                    Row(
                                                                        mainAxisSize: MainAxisSize.min,
                                                                        children: [
                                                                            Container(
                                                                                width: 40,
                                                                                height: 40,
                                                                                margin: const EdgeInsets.only(right: 10),
                                                                                decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8),
                                                                                    border: Border.all(color: const Color.fromRGBO(26, 39, 72, 1), width: 0.5),
                                                                                    image: const DecorationImage(image: AssetImage('assets/images/doc.png'), fit: BoxFit.contain)
                                                                                ),
                                                                            ),
                                                                            Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                    Text(
                                                                                        basename(file.path),
                                                                                        style: const TextStyle(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 14,
                                                                                            color: Color.fromRGBO(26, 39, 72, 1)
                                                                                        ),
                                                                                    ),
                                                                                    const SizedBox(height: 5,),
                                                                                    Text(
                                                                                        parentDirectory.path.replaceFirst('storage/emulated/0', ''),
                                                                                        style: const TextStyle(
                                                                                            fontFamily: 'SF Pro Display',
                                                                                            fontSize: 13,
                                                                                            color: Color.fromRGBO(129, 140, 153, 1)
                                                                                        ),
                                                                                    )
                                                                                ],
                                                                            )
                                                                        ],
                                                                    ),
                                                                    IconButton(
                                                                        onPressed: () => selectFile(file),
                                                                        icon: _selectedFiles.contains(file) ? const Icon(Icons.check_box_rounded, color: Color.fromRGBO(54, 161, 234, 1),) : const Icon(Icons.check_box_outline_blank_rounded, color: Color.fromRGBO(141, 156, 165, 1),),
                                                                    )
                                                                ],
                                                            ),
                                                        );
                                                    }
                                                ),
                                            )
                                        ],
                                    ),
                                )
                            ),
                        ],
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            child: TextButton(
                                onPressed: _selectedFiles.length > 0 ? (){} : null,
                                style: ButtonStyle(
                                    backgroundColor: _selectedFiles.length > 0 ? MaterialStateProperty.all(const Color.fromRGBO(54, 161, 234, 1)) : MaterialStateProperty.all(const Color.fromRGBO(54, 161, 234, 0.4)),
                                    shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8)))),
                                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                                    overlayColor: MaterialStateProperty.all(const Color.fromRGBO(26, 39, 72, 0.08))
                                ),
                                child: const Text(
                                    'Импортировать файлы',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'SF Pro Display',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                    ),
                                ),
                            ),
                        )
                    )
                ],
            ),
        );
    }
}