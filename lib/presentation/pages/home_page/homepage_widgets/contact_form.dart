import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/space.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      double? boxSize =
          sizeInfo.isMobile ? null : (sizeInfo.screenSize.width / 2) - 160;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Contact Form',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.left,
            ),
          ),
          verticalSpace(24),
          Flex(
            mainAxisSize: MainAxisSize.min,
            direction: sizeInfo.isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Flexible(
                flex: sizeInfo.isMobile ? 0 : 1,
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(labletext: 'Your Name*'),
                ),
              ),
              sizeInfo.isMobile ? verticalSpace(30) : horizontalSpace(30),
              Flexible(
                flex: sizeInfo.isMobile ? 0 : 1,
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: getInputDecoration(labletext: 'Your Email*'),
                ),
              ),
            ],
          ),
          verticalSpace(30),
          TextFormField(
            cursorColor: Colors.black,
            decoration: getInputDecoration(labletext: 'Your Subject...'),
          ),
          verticalSpace(30),
          TextFormField(
            cursorColor: Colors.black,
            decoration: getInputDecoration(labletext: 'Your message...'),
            maxLines: 4,
          ),
          verticalSpace(40),
          CustomIconButton(onPressed: () {}, buttonText: 'SUBMIT'),
        ],
      );
    });
  }
}

class Credits extends StatelessWidget {
  final double width;
  const Credits(
    this.width, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 50),
      color: Theme.of(context).canvasColor,
      child: Text(
        'Designed and Developed By Darwin V Tomy',
        style: getLightStyle(
            color: ColorManager.content_font_color_light, fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }
}
