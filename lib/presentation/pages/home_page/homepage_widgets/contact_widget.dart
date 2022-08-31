import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactWidget extends StatelessWidget {
  final String contact;
  final String title;
  final IconData icon;
  final double? width;
  const ContactWidget(
      {Key? key,
      required this.contact,
      required this.title,
      required this.icon,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentCard(
        width: width,
        padding: 25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon),
            verticalSpace(12),
            Text(
              contact,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1),
              maxLines: 1,
            ),
            verticalSpace(12),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 14),
              maxLines: 1,
            ),
          ],
        ));
  }
}
