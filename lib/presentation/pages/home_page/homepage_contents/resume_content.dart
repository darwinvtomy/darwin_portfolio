import 'package:darwin_portfolio/presentation/common/hover_extensions.dart';
import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/skills_card.dart';
import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../resources/values_manager.dart';
import '../homepage_models/resume_model.dart';
import '../homepage_widgets/contents_placeholder.dart';
import '../homepage_widgets/experience_card.dart';

class ResumeContent extends StatelessWidget {
  final List<WorkHistory>? workHistory;
  final List<Education>? education;
  final List<Coding>? codingSkills;
  final List<LanguageSkill>? languageSkills;
  const ResumeContent(
      {Key? key,
      this.workHistory,
      this.education,
      this.codingSkills,
      this.languageSkills})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      double halfsize = (sizeInfo.screenSize.width / 2) - 50;
      return ContentPlaceHolder(
          bgColor: Theme.of(context).canvasColor,
          title: AppStrings.my_resume.tr(),
          subTitle: AppStrings.my_expertises.tr(),
          child: Column(
            children: [
              Container(
                width: sizeInfo.screenSize.width,
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Text(
                  AppStrings.my_experience.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: sizeInfo.isMobile ? 1 : 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  mainAxisExtent: sizeInfo.isMobile ? 240 : 240,
                ),
                children: [
                  for (WorkHistory service in workHistory!)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: ExperienceCard(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        //     width: (sizeInfo.screenSize.width - 90) / 2,
                        year:
                            '${service.startDate} - ${service.endDate} | ${service.companyName}',
                        title: service.role!,
                        description: service.descripton.toString(),
                      ).moveUpOnHover,
                    ),
                ],
              ),
              Container(
                width: sizeInfo.screenSize.width,
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Text(
                  AppStrings.my_education.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
              ),
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: sizeInfo.isMobile ? 1 : 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  mainAxisExtent: sizeInfo.isMobile ? 240 : 240,
                ),
                children: [
                  for (Education service in education!)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p24),
                      child: ExperienceCard(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        year: 'START DATE - END DATE | ${service.instution!}',
                        title: service.degree!,
                        description: service.instution!,
                      ).moveUpOnHover,
                    ),
                ],
              ),
              Flex(
                mainAxisSize: MainAxisSize.min,
                direction: sizeInfo.isMobile ? Axis.vertical : Axis.horizontal,
                children: [
                  if (codingSkills != null)
                    Flexible(
                      flex: sizeInfo.isMobile ? 0 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppPadding.p24),
                            child: Text(
                              AppStrings.coding_skills.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SkillsCard(
                            codingSkills: codingSkills,
                          ).moveUpOnHover
                        ],
                      ),
                    ),
                  sizeInfo.isMobile ? verticalSpace(30) : horizontalSpace(30),
                  if (languageSkills != null)
                    Flexible(
                      flex: sizeInfo.isMobile ? 0 : 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppPadding.p24),
                            child: Text(
                              AppStrings.language_skills.tr(),
                              style: Theme.of(context).textTheme.titleMedium,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SkillsCard(
                            languageSkills: languageSkills,
                          ).moveUpOnHover
                        ],
                      ),
                    )
                ],
              ),
            ],
          ));
    });
  }
}
