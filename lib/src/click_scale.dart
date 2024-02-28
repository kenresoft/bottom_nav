import 'package:flutter/material.dart';

class ClickScaleIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  const ClickScaleIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  State<ClickScaleIcon> createState() => _ClickScaleIconState();
}

class _ClickScaleIconState extends State<ClickScaleIcon> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*onTap: () {
        setState(() {
          _isClicked = !_isClicked;
        });
      },*/
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isClicked ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
        child: Icon(
          widget.icon,
          size: widget.size,
          color: _isClicked ? Colors.white : widget.color,
        ),
      ),
    );
  }
}