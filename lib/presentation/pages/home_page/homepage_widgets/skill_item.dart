import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../../../common/space.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class SkillItem extends StatefulWidget {
  final String skillTitle;
  final double skillValue;
  const SkillItem(
      {Key? key, required this.skillTitle, required this.skillValue})
      : super(key: key);

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem>
    with TickerProviderStateMixin, AfterLayoutMixin {
  late AnimationController controller;
  late Animation _animation;
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    _animation = Tween(begin: 0.0, end: widget.skillValue).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.skillTitle,
          style: getRegularStyle(
              fontSize: 14,
              color: (Theme.of(context).brightness == Brightness.dark)
                  ? ColorManager.border_color_light
                  : ColorManager.dark),
          textAlign: TextAlign.left,
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              HexColor.fromHex('#D36453'),
            ),
            backgroundColor: HexColor.fromHex('#2A2D35'),
            minHeight: 8,
            value: _animation.value,
            semanticsLabel: 'Linear progress indicator',
          ),
        ),
        verticalSpace(24)
      ],
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    controller.forward();
  }
}
