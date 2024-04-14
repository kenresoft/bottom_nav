import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    this.child = const SizedBox(),
    required this.label,
  });

  final dynamic child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: child,
    );
  }
}
