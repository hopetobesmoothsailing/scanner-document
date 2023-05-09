import 'package:flutter/material.dart';
import '../components/ScanButton.dart';

class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            floatingActionButton: ScanButton(onScan: () => print('Scan is activated'),),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                notchMargin: 5,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                        IconButton(icon: Icon(Icons.menu, color: Colors.blue,), onPressed: () {},),
                        IconButton(icon: Icon(Icons.search, color: Colors.blue,), onPressed: () {},),
                        IconButton(icon: Icon(Icons.print, color: Colors.blue,), onPressed: () {},),
                        IconButton(icon: Icon(Icons.people, color: Colors.blue,), onPressed: () {},),
                    ],
                ),
            ),
            body: const Center(child: Text('This is Home Scene')),
        );
    }
}
