import 'package:bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(),
      body: const Center(),
      bottomNavigationBar: BottomNav(
          onTap: (p0) {
            print(p0.toString());
          },
          items: const [
            BottomNavItem(
              label: 'Home',
              child: FlutterLogo(),
            ),
            BottomNavItem(
              label: 'Home',
              child: FlutterLogo(),
            ),
          ]),
    ),
  ));
}
