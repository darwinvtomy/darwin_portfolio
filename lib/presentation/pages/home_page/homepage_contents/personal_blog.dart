import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/service_card.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalBlog extends StatelessWidget {
  PersonalBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        bgColor: ColorManager.content_bg_color_light,
        title: 'MY PERSONAL',
        subTitle: 'BLOG',
        child: SizedBox(),
      );
    });
  }
}
