import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/values_manager.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, required this.child, this.padding})
      : super(key: key);
  final Widget child;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: ColorManager.card_bordercolor_light,
          )),
      padding: EdgeInsets.all(padding ?? AppPadding.p8),
      child: child,
    );
  }
}
