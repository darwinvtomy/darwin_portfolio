import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../homepage_models/resume_model.dart';
import 'content_card.dart';
import 'skill_item.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard(
      {Key? key, this.width, this.year, this.codingSkills, this.languageSkills})
      : super(key: key);

  final double? width;
  final String? year;
  final List<Coding>? codingSkills;
  final List<LanguageSkill>? languageSkills;

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: AppPadding.p16,
      width: width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          if (codingSkills != null)
            for (Coding coding in codingSkills!)
              SkillItem(
                skillTitle: coding.skill!,
                skillValue: coding.level! / 5,
              ),
          if (languageSkills != null)
            for (LanguageSkill language in languageSkills!)
              SkillItem(
                skillTitle: language.language!,
                skillValue: language.level! / 5,
              ),
        ],
      ),
    );
  }
}
