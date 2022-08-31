import 'package:flutter_svg/flutter_svg.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../homepage_widgets/contents_placeholder.dart';

class Testimonial extends StatelessWidget {
  final PageController controller = PageController();
  Testimonial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        paddingHorizontal: 0,
        bgColor: Theme.of(context).canvasColor,
        title: 'KIND WORDS',
        subTitle: 'TESTIMONIAL',
        centerAligned: true,
        child: Stack(
          children: [
            SizedBox(
              height: sizeInfo.isMobile ? 400 : 300,
              width: sizeInfo.screenSize.width,
              child: PageView(
                controller: controller,
                children: const <Widget>[
                  CardSlide(itemIndex: 1),
                  CardSlide(itemIndex: 2),
                  CardSlide(itemIndex: 3),
                  CardSlide(itemIndex: 4),
                  CardSlide(itemIndex: 5),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                  iconSize: 45,
                  icon: SvgPicture.asset(
                    'assets/svg/swip_right.svg',
                    height: 60,
                    width: 40,
                  ),
                  onPressed: () {
                    controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                  iconSize: 45,
                  icon: SvgPicture.asset(
                    'assets/svg/swipe_left.svg',
                    height: 60,
                    width: 40,
                  ),
                  onPressed: () {
                    controller.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  }),
            ),
          ],
        ),
      );
    });
  }
}

class CardSlide extends StatelessWidget {
  final int itemIndex;
  const CardSlide({
    super.key,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeInfo.isMobile
                ? sizeInfo.screenSize.width * 0.12
                : sizeInfo.screenSize.width * 0.1),
        child: ContentCard(
          height: sizeInfo.isMobile ? 200 : 150,
          width: sizeInfo.screenSize.width * 0.7,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: kElevationToShadow[2],
                    image: DecorationImage(
                      image: NetworkImage(kDemoImages[itemIndex]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Text(
                  '\"Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse.\"',
                  style: getLightStyle(
                      color: (Theme.of(context).brightness == Brightness.dark)
                          ? ColorManager.border_color_light
                          : ColorManager.dark,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Text(
                  '- Anj Joseph, Web Developer',
                  style: getMediumStyle(
                      color: (Theme.of(context).brightness == Brightness.dark)
                          ? ColorManager.border_color_light
                          : ColorManager.dark,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

List<String> kDemoImages = [
  'https://i.pinimg.com/originals/7f/91/a1/7f91a18bcfbc35570c82063da8575be8.jpg',
  'https://www.absolutearts.com/portfolio3/a/afifaridasiddique/Still_Life-1545967888l.jpg',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/53415/72138/1597120261997_IMG_20200811_095922__49127.1597493165.jpg?c=2',
  'https://i.pinimg.com/originals/47/7e/15/477e155db1f8f981c4abb6b2f0092836.jpg',
  'https://images.saatchiart.com/saatchi/770124/art/3760260/2830144-QFPTZRUH-7.jpg',
  'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c3RpbGwlMjBsaWZlfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/40895/55777/1526876829723_P211_24X36__2018_Stilllife_15000_20090__91926.1563511650.jpg?c=2',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIUsxpakPiqVF4W_rOlq6eoLYboOFoxw45qw&usqp=CAU',
  'https://images.mojarto.com/photos/267893/large/DA-SL-01.jpg?1560834975',
];
