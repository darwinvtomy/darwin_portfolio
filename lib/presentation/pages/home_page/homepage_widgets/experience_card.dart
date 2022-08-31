import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard(
      {Key? key,
      required this.title,
      required this.description,
      this.icon,
      this.index,
      this.height,
      this.width,
      this.year,
      this.color})
      : super(key: key);
  final String title;
  final String description;
  final Widget? icon;
  final String? index;
  final double? height;
  final double? width;
  final String? year;
  final Color? color;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool showindex = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => {
        setState(() {
          showindex = true;
        })
      },
      onExit: (_) => {
        setState(() {
          showindex = false;
        })
      },
      child: ContentCard(
          width: widget.width,
          height: widget.height,
          padding: 0,
          color: widget.color ?? Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            //  fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.left,
                    ),
                    verticalSpace(16),
                    Container(
                      // height: 20,
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: GradientManager.commonGradient),
                      child: Text(
                        widget.year!,
                        style: getBoldStyle(
                          color: Colors.white,
                        ).copyWith(
                          height: 0,
                        ),
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                    ),
                    verticalSpace(16),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
