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

class _SkillItemState extends State<SkillItem> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation _animation;
  int count = 0;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        if (_animation.value == count / 5) {
          controller.stop(canceled: false);
        }
        setState(() {});
      });
    // ignore: avoid_single_cascade_in_expression_statements
    controller.addStatusListener((AnimationStatus status) {});
    _animation = Tween<double>(
      begin: 0,
      end: widget.skillValue,
    ).animate(controller);
    controller.forward();
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
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
}
