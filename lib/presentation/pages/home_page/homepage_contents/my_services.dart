import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/service_card.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyServices extends StatelessWidget {
  MyServices({Key? key}) : super(key: key);
  final List<Service> services = [
    Service(
        index: '01',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
    Service(
        index: '02',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
    Service(
        index: '03',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
    Service(
        index: '04',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
    Service(
        index: '05',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
    Service(
        index: '06',
        icondata: FontAwesomeIcons.paintbrush,
        title: 'Graphic Design',
        description:
            'Modern and mobile-ready website that will help of your marketing.'),
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        //  bgColor: ColorManager.content_bg_color_light,
        title: 'WHAT I DO',
        subTitle: 'MY SERVICES',
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            for (Service service in services)
              ServiceExpCard(
                  width: (sizeInfo.screenSize.width - 90) / 2,
                  height: sizeInfo.isMobile ? 280 : 250,
                  title: service.title,
                  description: service.description,
                  icon: FaIcon(service.icondata),
                  index: service.index)
          ],
        ),
      );
    });
  }
}

class Service {
  final IconData icondata;
  final String title;
  final String description;
  final String index;

  Service(
      {required this.index,
      required this.icondata,
      required this.title,
      required this.description});
}