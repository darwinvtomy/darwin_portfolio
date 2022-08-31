import 'package:flutter/material.dart';

class DrawerIcon extends StatefulWidget {
  final bool isDraweropen;
  const DrawerIcon({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
    required this.isDraweropen,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  State<DrawerIcon> createState() => _DrawerIconState();
}

class _DrawerIconState extends State<DrawerIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        size: 36,
        icon: widget.isDraweropen
            ? AnimatedIcons.close_menu
            : AnimatedIcons.menu_close,
        progress: _animationController,
      ),
      onPressed: () {
        widget.isDraweropen
            ? widget._scaffoldKey.currentState?.closeDrawer()
            : widget._scaffoldKey.currentState?.openDrawer();
        isPlaying = !isPlaying;
        print(
            'Drawer Open or not ${widget._scaffoldKey.currentState?.isDrawerOpen}');
        // widget.isDraweropen
        //     ? _animationController.reverse()
        //     : _animationController.forward();
      },
    );
  }
}
