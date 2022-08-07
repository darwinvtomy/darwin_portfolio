import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/space.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class ServiceExpCard extends StatelessWidget {
  const ServiceExpCard(
      {Key? key,
      required this.title,
      required this.description,
      this.icon,
      this.index,
      this.height,
      this.width,
      this.year})
      : super(key: key);
  final String title;
  final String description;
  final Widget? icon;
  final String? index;
  final double? height;
  final double? width;
  final String? year;

  @override
  Widget build(BuildContext context) {
    return ContentCard(
        width: width,
        height: height,
        padding: 0,
        color: Colors.white,
        child: Stack(
          //  fit: StackFit.expand,
          children: [
            Container(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null)
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p16),
                      child: icon ?? SizedBox(),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppPadding.p16),
                    child: Text(
                      title,
                      style: getMediumStyle(
                          color: ColorManager.title_font_color_light,
                          fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (year != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: GradientManager.commonGradient),
                        child: Text(
                          year!,
                          style: getBoldStyle(color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  Text(
                    description,
                    style: getLightStyle(
                        color: ColorManager.content_font_color_light,
                        fontSize: 14),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            if (index != null)
              Positioned(
                top: -40,
                right: 20,
                child: Text(
                  index!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w100,
                      color:
                          ColorManager.title_font_color_light.withOpacity(0.1),
                      fontSize: 90,
                      height: 0),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ));
  }
}
