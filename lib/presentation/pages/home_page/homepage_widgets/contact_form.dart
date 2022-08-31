import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.contact_form.tr(),
              style: Theme.of(context).textTheme.titleMedium,
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
                  decoration:
                      getInputDecoration(labletext: AppStrings.your_name.tr()),
                ),
              ),
              sizeInfo.isMobile ? verticalSpace(30) : horizontalSpace(30),
              Flexible(
                flex: sizeInfo.isMobile ? 0 : 1,
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration:
                      getInputDecoration(labletext: AppStrings.your_email.tr()),
                ),
              ),
            ],
          ),
          verticalSpace(30),
          TextFormField(
            cursorColor: Colors.black,
            decoration:
                getInputDecoration(labletext: AppStrings.your_subject.tr()),
          ),
          verticalSpace(30),
          TextFormField(
            cursorColor: Colors.black,
            decoration:
                getInputDecoration(labletext: AppStrings.your_message.tr()),
            maxLines: 4,
          ),
          verticalSpace(40),
          CustomIconButton(
              onPressed: () {}, buttonText: AppStrings.submit.tr()),
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
        AppStrings.designed_and_developedby.tr(),
        style: getLightStyle(
            color: ColorManager.content_font_color_light, fontSize: 16),
        textAlign: TextAlign.left,
      ),
    );
  }
}
