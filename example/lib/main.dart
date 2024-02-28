import 'package:bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(),
      /*bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: '1',
              icon: Icon(Icons.add_box_rounded),
            ),
            BottomNavigationBarItem(
              label: '2',
              icon: Icon(Icons.add_box_rounded),
            ),
            BottomNavigationBarItem(
              label: '3',
              icon: Icon(Icons.add_box_rounded),
            ),
          ],
        ),*/
      bottomNavigationBar: BottomNav(
        onTap: (p0) {
          print(p0.toString());
          setState(() {
            index = p0;
          });
        },
        indexSelected: index,
        items: const [
          BottomNavItem(
            label: 'Home',
            child: Icon(Icons.content_paste_rounded, size: 24, color: Colors.blue),
          ),
          BottomNavItem(
            label: 'Home',
            child: Icons.content_paste_rounded,
          ),
          BottomNavItem(
            label: 'Home',
            child: FlutterLogo(),
          ), BottomNavItem(
            label: 'Home',
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
