import 'package:darwin_portfolio/presentation/common/hover_extensions.dart';
import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/skills_card.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../resources/values_manager.dart';
import '../homepage_widgets/contents_placeholder.dart';
import '../homepage_widgets/experience_card.dart';

class ResumeContent extends StatelessWidget {
  const ResumeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
          bgColor: Theme.of(context).canvasColor,
          title: 'MY RESUME',
          subTitle: 'MY EXPERTISES',
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            direction: sizeInfo.isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Flexible(
                flex: sizeInfo.isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'My Experience',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    for (int i = 0; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p24),
                        child: ExperienceCard(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          //     width: (sizeInfo.screenSize.width - 90) / 2,
                          year: '2013 - 2015 | Facebook Inc',
                          title: 'Senior Architect',
                          description:
                              'Collaborate with creative and development teams on the execution of ideas.',
                        ).moveUpOnHover,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'Design Skills',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SkillsCard().moveUpOnHover
                  ],
                ),
              ),
              sizeInfo.isMobile ? verticalSpace(30) : horizontalSpace(30),
              Flexible(
                flex: sizeInfo.isMobile ? 0 : 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'My Experience',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    for (int i = 0; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p24),
                        child: ExperienceCard(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          //  width: (sizeInfo.screenSize.width - 90) / 2,
                          year: '2013 - 2015 | Facebook Inc',
                          title: 'Senior Architect',
                          description:
                              'Collaborate with creative and development teams on the execution of ideas.',
                        ).moveUpOnHover,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: Text(
                        'Design Skills',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SkillsCard().moveUpOnHover
                  ],
                ),
              )
            ],
          ));
    });
  }
}
