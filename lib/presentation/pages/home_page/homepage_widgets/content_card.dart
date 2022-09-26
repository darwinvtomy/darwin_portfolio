import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class ContentCard extends StatelessWidget {
  const ContentCard(
      {Key? key,
      required this.child,
      this.padding,
      this.color,
      this.height,
      this.width,
      this.onclick})
      : super(key: key);
  final Widget child;
  final double? padding;
  final Color? color;
  final double? height;
  final double? width;
  final Function? onclick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Onclick");
        onclick;
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: (Theme.of(context).brightness == Brightness.dark)
                  ? ColorManager.card_bordercolor_dark
                  : ColorManager.card_bordercolor_light,
            )),
        padding: EdgeInsets.all(padding ?? AppPadding.p8),
        child: child,
      ),
    );
  }
}
