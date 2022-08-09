import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/font_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactWidget extends StatelessWidget {
  final String contact;
  final String title;
  final IconData icon;
  const ContactWidget(
      {Key? key,
      required this.contact,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentCard(
        padding: 25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon),
            verticalSpace(12),
            Text(
              contact,
              style:
                  getMediumStyle(color: Colors.black, fontSize: FontSize.s18),
              maxLines: 1,
            ),
            verticalSpace(12),
            Text(
              title,
              style: getLightStyle(
                  color: ColorManager.content_font_color_light,
                  fontSize: FontSize.s14),
              maxLines: 1,
            ),
          ],
        ));
  }
}
