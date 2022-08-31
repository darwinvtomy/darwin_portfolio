import 'package:darwin_portfolio/presentation/common/hover_extensions.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/service_card.dart';
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
      double halfsize = (sizeInfo.screenSize.width / 2) - 50;
      return ContentPlaceHolder(
        title: 'WHAT I DO',
        subTitle: 'MY SERVICES',
        child: GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: sizeInfo.isMobile ? 1 : 2,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            mainAxisExtent: sizeInfo.isMobile ? 240 : 240, //
          ),
          children: [
            for (Service service in services)
              ServiceCard(
                      color: Theme.of(context).backgroundColor,
                      width: sizeInfo.isMobile
                          ? sizeInfo.screenSize.width * 0.99
                          : halfsize,
                      title: service.title,
                      description: service.description,
                      icon: FaIcon(service.icondata),
                      index: service.index)
                  .moveUpOnHover
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
