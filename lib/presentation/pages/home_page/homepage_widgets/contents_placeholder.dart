import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/title_subtitle.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContentPlaceHolder extends StatelessWidget {
  final Color? bgColor;
  final Widget child;
  final String title;
  final String subTitle;
  final TextAlign? titletextAlign;
  final double? paddingHorizontal;
  final bool centerAligned;

  const ContentPlaceHolder(
      {Key? key,
      this.bgColor,
      required this.child,
      required this.title,
      required this.subTitle,
      this.titletextAlign,
      this.paddingHorizontal,
      this.centerAligned = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        width: sizeInfo.screenSize.width,
        color: bgColor,
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p60,
            horizontal: paddingHorizontal ?? (sizeInfo.isMobile ? 16 : 30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: centerAligned
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: (paddingHorizontal == 0 && !centerAligned) ? 30 : 0),
              child: TitleAndSub(
                title: title,
                subTitle: subTitle,
                centeraligned: centerAligned,
              ),
            ),
            verticalSpace(30),
            child
          ],
        ),
      );
    });
  }
}
