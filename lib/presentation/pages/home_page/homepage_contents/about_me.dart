// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';

import '../../../resources/styles_manager.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
          title: 'GET TO KNOW',
          subTitle: 'ABOUT ME',
          bgColor: Theme.of(context).canvasColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: ColorManager.border_color_light,
                      )),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: Image.asset('assets/images/avatar.jpg')),
              verticalSpace(sizeInfo.isMobile ? AppPadding.p40 : 0.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I\'m Darwin V Tomy ',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Proin laoreet elementum ligula, ac tincidunt lorem accumsan nec. Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.',
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.left,
                  ),
                  verticalSpace(16),
                  ContentCard(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BioDetails(
                              title: 'From', detail: 'Bengaluru India'),
                          const BioDetails(title: 'Age', detail: '33'),
                          const BioDetails(
                              title: 'Phone', detail: '+91-9113835612'),
                          const BioDetails(
                              title: 'Email', detail: 'darwinvtomy@gmail.com'),
                          verticalSpace(24),
                          CustomIconButton(
                            onPressed: () {},
                            buttonText: 'DOWNLOAD CV',
                            icon: const FaIcon(
                              FontAwesomeIcons.download,
                              size: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ));
    });
  }
}

class BioDetails extends StatelessWidget {
  final String title;
  final String detail;
  const BioDetails({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$title : ',
            style: getMediumStyle(
                color: ColorManager.title_font_color_light, fontSize: 14),
            textAlign: TextAlign.left,
          ),
          horizontalSpace(4),
          Text(
            detail,
            style: getLightStyle(
                color: ColorManager.content_font_color_light, fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
