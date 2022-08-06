import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import 'content_card.dart';

class SkillsCard extends StatelessWidget {
  const SkillsCard({Key? key, this.width, this.year}) : super(key: key);

  final double? width;
  final String? year;

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: AppPadding.p16,
      width: width,
      color: Colors.white,
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

class SkillItem extends StatelessWidget {
  final String skillTitle;
  final double skillValue;
  const SkillItem(
      {Key? key, required this.skillTitle, required this.skillValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skillTitle,
          style: getRegularStyle(
              fontSize: 14, color: ColorManager.title_font_color_light),
          textAlign: TextAlign.left,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              HexColor.fromHex('#D36453'),
            ),
            backgroundColor: HexColor.fromHex('#2A2D35'),
            minHeight: 8,
            value: skillValue,
            semanticsLabel: 'Linear progress indicator',
          ),
        ),
        verticalSpace(24)
      ],
    );
  }
}
