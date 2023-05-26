import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    this.child = const SizedBox(),
    required this.label,
  }) : super(key: key);

  final dynamic child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
