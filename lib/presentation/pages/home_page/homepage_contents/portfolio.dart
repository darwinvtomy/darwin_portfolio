import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../resources/color_manager.dart';
import '../homepage_widgets/contents_placeholder.dart';

class PortFolio extends StatelessWidget {
  const PortFolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        bgColor: ColorManager.content_bg_color_light,
        title: 'PORTFOLIO',
        subTitle: 'MY WORKS',
        centerAligned: true,
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [Container()],
        ),
      );
    });
  }
}
