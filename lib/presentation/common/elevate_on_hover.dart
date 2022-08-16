import 'package:flutter/material.dart';

class ElevateOnHover extends StatefulWidget {
  final Widget child;
  const ElevateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _ElevateOnHoverState createState() => _ElevateOnHoverState();
}

class _ElevateOnHoverState extends State<ElevateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0.0, 0.0, 0.0);
  final hoverTransform = Matrix4.identity()..translate(0.0, -3.0, 0.0);
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => mouseEnter(true),
      onExit: (event) => mouseEnter(false),
      child: AnimatedContainer(
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color:
                  hovering ? Colors.grey.withOpacity(0.3) : Colors.transparent,
              offset: const Offset(
                0.7,
                0.4,
              ),
              blurRadius: 3.0,
              spreadRadius: 0.5,
            ), //BoxShadow
          ],
        ),
        duration: Duration(milliseconds: 200),
        child: widget.child,
        transform: hovering ? hoverTransform : nonHoverTransform,
      ),
    );
  }

  void mouseEnter(bool hover) {
    setState(() {
      hovering = hover;
    });
  }
}
