import 'package:flutter/material.dart';

class HoverScaleIcon extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color color;

  const HoverScaleIcon({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
  });

  @override
  State<HoverScaleIcon> createState() => _HoverScaleIconState();
}

class _HoverScaleIconState extends State<HoverScaleIcon> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: _isHovering ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
        child: Icon(
          widget.icon,
          size: widget.size,
          color: _isHovering ? Colors.white : widget.color,
        ),
      ),
    );
  }

  void _toggleHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}