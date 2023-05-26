import 'package:flutter/material.dart';

import 'bottom_navigation_item.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    Key? key,
    required this.items,
    this.onTap,
    this.color = Colors.white,
    this.indexSelected = 0,
    this.enableItemBackground = false,
    this.colorSelected = Colors.lightBlueAccent,
    this.backgroundSelected = Colors.transparent,
    this.backgroundRadius = const BorderRadius.all(Radius.circular(50)),
    this.backgroundColor = Colors.grey,
    this.iconSize = 26,
    this.labelSize = 11,
    this.margin,
    this.padding = const EdgeInsets.all(18.0),
    this.borderRadius,
    this.height = 70,
    this.divider,
    this.labelStyle = const TextStyle(),
  }) : super(key: key);

  final List<BottomNavItem> items;
  final Color color;
  final Color colorSelected;
  final bool enableItemBackground;
  final Color backgroundSelected;
  final BorderRadiusGeometry backgroundRadius;
  final Function(int)? onTap;
  final int indexSelected;
  final Color backgroundColor;
  final double iconSize;
  final double labelSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry padding;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget? divider;
  final TextStyle labelStyle;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(color: widget.backgroundColor, borderRadius: widget.borderRadius),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        widget.divider == null ? const SizedBox() : widget.divider!,
        Container(
          margin: widget.margin,
          padding: widget.padding,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (var i = 0; i < widget.items.length; ++i)
              BottomNavItem(
                label: widget.items[i].label,
                child: widget.items[i].child is IconData
                    ? GestureDetector(
                  onTap: () {
                    widget.onTap!(i);
                  },
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    widget.enableItemBackground
                        ? i == widget.indexSelected
                        ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: widget.backgroundSelected, borderRadius: widget.backgroundRadius),
                        child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.colorSelected))
                        : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.transparent, borderRadius: widget.backgroundRadius),
                        child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.color))
                        : i == widget.indexSelected
                        ? Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.colorSelected))
                        : Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.color)),
                    i == widget.indexSelected
                        ? Text(widget.items[i].label, style: widget.labelStyle.copyWith(color: widget.colorSelected, fontSize: widget.labelSize))
                        : Text(widget.items[i].label, style: widget.labelStyle.copyWith(color: widget.color, fontSize: widget.labelSize)),
                  ]),
                )
                    : GestureDetector(
                  onTap: () => widget.onTap!(i),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    widget.items[i].child,
                    widget.items[i].child is SizedBox
                        ? i == widget.indexSelected
                        ? Text(widget.items[i].label, style: TextStyle(color: widget.colorSelected, fontSize: widget.labelSize))
                        : Text(widget.items[i].label, style: TextStyle(color: widget.color, fontSize: widget.labelSize))
                        : const SizedBox(),
                  ]),
                ),
              ),
          ]),
        ),
      ]),
    );
  }
}

