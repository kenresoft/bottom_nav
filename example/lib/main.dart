import 'package:bottom_nav/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(),
      body: const Center(),
      bottomNavigationBar: const BottomNav(items: [
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
