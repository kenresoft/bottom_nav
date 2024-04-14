import 'dart:developer' as d;

import 'package:flutter/material.dart';

import 'bottom_navigation_item.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({
    super.key,
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
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(18.0),
    this.borderRadius,
    this.height = 78,
    this.divider,
    this.labelStyle = const TextStyle(),
  }) : overlayWidth = 70;

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
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final Widget? divider;
  final TextStyle labelStyle;

  final double overlayWidth;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            height: widget.height,
            width: width,
            decoration: BoxDecoration(color: widget.backgroundColor, borderRadius: widget.borderRadius),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              widget.divider == null ? const SizedBox() : widget.divider!,
              Container(
                margin: widget.margin.log,
                padding: widget.padding.log,
                //width: width,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, mainAxisSize: MainAxisSize.max, children: [
                  for (var i = 0; i < widget.items.length; ++i) _buildBottomNavItem(i),
                ]),
              ),
            ]),
          ),
          for (var i = 0; i < widget.items.length; ++i)
            Container(
              margin: widget.margin,
              padding: EdgeInsets.symmetric(
                horizontal: widget.padding.resolve(TextDirection.ltr).left.log,
              ).copyWith(
                top: 10,
                bottom: 10,
              ),
              width: width,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: FractionalOffset.fromOffsetAndSize(
                  Offset(
                    i * (width / widget.items.length) + widget.padding.resolve(TextDirection.ltr).left - widget.margin.resolve(TextDirection.ltr).left - 2,
                    0,
                  ),
                  Size.fromWidth(
                    width - (widget.padding.horizontal) - (widget.margin.horizontal) - spaceFactor,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: widget.overlayWidth,
                ),
              ),
            ),
        ],
      ),
    );
  }

  double get spaceFactor => widget.overlayWidth - 30;

  BottomNavItem _buildBottomNavItem(int i) {
    return BottomNavItem(
      label: widget.items[i].label,
      child: widget.items[i].child is IconData
          ? GestureDetector(
              onTap: () {
                widget.onTap == null ? {} : widget.onTap!(i);
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget? child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        transform: i == widget.indexSelected ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
                        decoration: i == widget.indexSelected
                            ? BoxDecoration(color: widget.backgroundSelected, borderRadius: widget.backgroundRadius)
                            : BoxDecoration(color: Colors.transparent, borderRadius: widget.backgroundRadius),
                        child: Column(
                          children: [
                            Icon(widget.items[i].child, size: widget.iconSize, color: i == widget.indexSelected ? widget.colorSelected : widget.color),
                            Text(
                              widget.items[i].label,
                              style: TextStyle(
                                color: i == widget.indexSelected ? widget.colorSelected : widget.color,
                                fontSize: widget.labelSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          : widget.items[i].child is Icon
              ? GestureDetector(
                  onTap: () => widget.onTap == null ? {} : widget.onTap!(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        transform: i == widget.indexSelected ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
                        decoration: i == widget.indexSelected
                            ? BoxDecoration(color: widget.backgroundSelected, borderRadius: widget.backgroundRadius)
                            : BoxDecoration(color: Colors.transparent, borderRadius: widget.backgroundRadius),
                        child: Column(
                          children: [
                            Icon(
                              (widget.items[i].child as Icon).icon,
                              size: widget.iconSize,
                              color: i == widget.indexSelected ? widget.colorSelected : widget.color,
                            ),
                            Text(
                              widget.items[i].label,
                              style: TextStyle(
                                color: i == widget.indexSelected ? widget.colorSelected : widget.color,
                                fontSize: widget.labelSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : GestureDetector(
                  onTap: () => widget.onTap == null ? {} : widget.onTap!(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        transform: i == widget.indexSelected ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
                        decoration: i == widget.indexSelected
                            ? BoxDecoration(color: widget.backgroundSelected, borderRadius: widget.backgroundRadius)
                            : BoxDecoration(color: Colors.transparent, borderRadius: widget.backgroundRadius),
                        child: Column(
                          children: [
                            widget.items[i].child,
                            Text(
                              widget.items[i].label,
                              style: TextStyle(
                                color: i == widget.indexSelected ? widget.colorSelected : widget.color,
                                fontSize: widget.labelSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

/*BottomNavItem _buildBottomNavItem(int i) {
    return BottomNavItem(
      label: widget.items[i].label,
      child: widget.items[i].child is IconData
          ? GestureDetector(
              onTap: () {
                widget.onTap == null ? {} : widget.onTap!(i);
                _controller.forward(from: 0.0);
              },
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    transform: i == widget.indexSelected ? Matrix4.diagonal3Values(1.2, 1.2, 1.0) : Matrix4.identity(),
                    color: i == widget.indexSelected ? Colors.white : widget.color,
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
                              ? Container(padding: const EdgeInsets.all(10), child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.colorSelected))
                              : Container(padding: const EdgeInsets.all(10), child: Icon(widget.items[i].child, size: widget.iconSize, color: widget.color)),
                      i == widget.indexSelected
                          ? Text(widget.items[i].label, style: widget.labelStyle.copyWith(color: widget.colorSelected, fontSize: widget.labelSize))
                          : Text(widget.items[i].label, style: widget.labelStyle.copyWith(color: widget.color, fontSize: widget.labelSize)),
                    ]),
                  );
                }
              ),
            )
          : GestureDetector(
              onTap: () => widget.onTap == null ? {} : widget.onTap!(i),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.items[i].child,
                  widget.items[i].child is SizedBox
                      ? i == widget.indexSelected
                          ? Text(widget.items[i].label, style: TextStyle(color: widget.colorSelected, fontSize: widget.labelSize))
                          : Text(widget.items[i].label, style: TextStyle(color: widget.color, fontSize: widget.labelSize))
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }*/
}

extension Log<T> on T {
  T get log {
    d.log(toString());
    return this;
  }
}
