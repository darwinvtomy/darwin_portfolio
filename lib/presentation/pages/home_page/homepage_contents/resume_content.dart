import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/skills_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../homepage_widgets/contents_placeholder.dart';
import '../homepage_widgets/service_card.dart';

class ResumeContent extends StatelessWidget {
  const ResumeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
          bgColor: ColorManager.white,
          title: 'MY RESUME',
          subTitle: 'MY EXPERTISES',
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'My Experience',
                        style: getMediumStyle(
                            color: ColorManager.title_font_color_light,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    for (int i = 0; i <= 3; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: AppPadding.p24),
                        child: ServiceExpCard(
                          width: (sizeInfo.screenSize.width - 90) / 2,
                          year: '2013 - 2015 | Facebook Inc',
                          title: 'Senior Architect',
                          description:
                              'Collaborate with creative and development teams on the execution of ideas.',
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'Design Skills',
                        style: getMediumStyle(
                            color: ColorManager.title_font_color_light,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SkillsCard()
                  ],
                ),
              ),
              horizontalSpace(30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'My Experience',
                        style: getMediumStyle(
                            color: ColorManager.title_font_color_light,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    for (int i = 0; i <= 3; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: AppPadding.p24),
                        child: ServiceExpCard(
                          width: (sizeInfo.screenSize.width - 90) / 2,
                          year: '2013 - 2015 | Facebook Inc',
                          title: 'Senior Architect',
                          description:
                              'Collaborate with creative and development teams on the execution of ideas.',
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'Design Skills',
                        style: getMediumStyle(
                            color: ColorManager.title_font_color_light,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SkillsCard()
                  ],
                ),
              )
            ],
          ));
    });
  }
}
