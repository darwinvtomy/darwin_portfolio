import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import 'content_card.dart';
import 'skill_item.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({Key? key, this.width, this.year}) : super(key: key);

  final double? width;
  final String? year;

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: AppPadding.p16,
      width: width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: const [
          SkillItem(
            skillTitle: 'Graphic Design',
            skillValue: 0.9,
          ),
          SkillItem(
            skillTitle: 'Logo Design',
            skillValue: 0.6,
          ),
          SkillItem(
            skillTitle: 'Graphic Design',
            skillValue: 0.9,
          ),
          SkillItem(
            skillTitle: 'Graphic Design',
            skillValue: 0.9,
          ),
        ],
      ),
    );
  }
}
