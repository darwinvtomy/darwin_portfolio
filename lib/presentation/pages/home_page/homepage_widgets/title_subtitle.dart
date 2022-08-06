import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class TitleAndSub extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextAlign? textAlign;
  const TitleAndSub(
      {Key? key, required this.title, required this.subTitle, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: getLightStyle(color: ColorManager.title_font_color_light),
            textAlign: textAlign ?? TextAlign.left,
          ),
        ),
        Text(
          subTitle,
          style: getLightStyle(
              color: ColorManager.title_font_color_light, fontSize: 30),
          textAlign: textAlign ?? TextAlign.left,
        ),
      ],
    );
  }
}
