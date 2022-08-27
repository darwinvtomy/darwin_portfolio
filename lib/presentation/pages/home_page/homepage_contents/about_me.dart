import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      double imageSize = sizeInfo.screenSize.width * 0.3;
      return ContentPlaceHolder(
          title: 'GET TO KNOW',
          subTitle: 'ABOUT ME',
          bgColor: Theme.of(context).canvasColor,
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 30,
            spacing: 30,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? ColorManager.card_bordercolor_dark
                            : ColorManager.card_bordercolor_light,
                      )),
                  padding: const EdgeInsets.all(4),
                  child: Image.asset(
                    'assets/images/avatar.jpg',
                    width: sizeInfo.isMobile
                        ? sizeInfo.screenSize.width - 30
                        : imageSize,
                    fit: BoxFit.fitWidth,
                  )),
              // verticalSpace(sizeInfo.isMobile ? AppPadding.p40 : 0.0),
              Container(
                padding: EdgeInsets.only(
                    left: sizeInfo.isMobile ? 0.0 : AppPadding.p30),
                width: sizeInfo.isMobile
                    ? sizeInfo.screenSize.width - 30
                    : sizeInfo.screenSize.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(sizeInfo.isMobile ? AppPadding.p40 : 0.0),
                    Text(
                      'I\'m Darwin V Tomy ',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Proin laoreet elementum ligula, ac tincidunt lorem accumsan nec. Fusce eget urna ante. Donec massa velit, varius a accumsan ac, tempor iaculis massa. Sed placerat justo sed libero varius vulputate. Ut a mi tempus massa malesuada fermentum.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(height: 2),
                      textAlign: TextAlign.left,
                    ),
                    verticalSpace(16),
                    ContentCard(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: sizeInfo.isMobile
                              ? sizeInfo.screenSize.width - 30
                              : sizeInfo.screenSize.width * 0.6,
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.p20),
                            child: Wrap(
                              spacing: 30,
                              runSpacing: 30,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                BioDetails(
                                    title: 'From', detail: 'Bengaluru India'),
                                BioDetails(title: 'Age', detail: '33'),
                                BioDetails(
                                    title: 'Phone', detail: '+91-9113835612'),
                                BioDetails(
                                    title: 'Email',
                                    detail: 'darwinvtomy@gmail.com'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(30),
                    CustomIconButton(
                      onPressed: () {},
                      buttonText: 'DOWNLOAD CV',
                      icon: const FaIcon(
                        FontAwesomeIcons.download,
                        color: Colors.white,
                        size: 12,
                      ),
                    )
                  ],
                ),
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
    return Wrap(
      alignment: WrapAlignment.start,
      children: [
        Text(
          '$title : ',
          style: Theme.of(context).textTheme.subtitle2,
          textAlign: TextAlign.left,
        ),
        horizontalSpace(4),
        SizedBox(
          width: 210,
          child: Text(
            detail,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
