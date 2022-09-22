import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../homepage_models/resume_model.dart';
import '../homepage_widgets/contents_placeholder.dart';

class TestimonialSection extends StatelessWidget {
  final PageController controller = PageController();
  final List<Testimonial>? testimonials;
  TestimonialSection({Key? key, this.testimonials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        paddingHorizontal: 0,
        bgColor: Theme.of(context).canvasColor,
        title: AppStrings.kind_words.tr(),
        subTitle: AppStrings.testimonial.tr(),
        centerAligned: true,
        child: Stack(
          children: [
            SizedBox(
              height: sizeInfo.isMobile ? 400 : 300,
              width: sizeInfo.screenSize.width,
              child: PageView(
                controller: controller,
                children: <Widget>[
                  for (Testimonial testimonial in testimonials!)
                    CardSlide(
                      testimonial: testimonial,
                    ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: IconButton(
                  iconSize: 30,
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
                  iconSize: 30,
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
  final Testimonial testimonial;
  const CardSlide({
    super.key,
    required this.testimonial,
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
                      image: NetworkImage(testimonial.image!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                child: Text(
                  testimonial.description!,
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
                  testimonial.name!,
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
