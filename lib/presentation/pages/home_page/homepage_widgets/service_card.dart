import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:flutter/material.dart';

import '../../../common/space.dart';
import '../../../resources/color_manager.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard(
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
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
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
                    if (widget.icon != null) widget.icon ?? const SizedBox(),
                    verticalSpace(35),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.left,
                    ),
                    verticalSpace(15),
                    Text(
                      widget.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              if (widget.index != null && showindex)
                Positioned(
                  top: -40,
                  right: 20,
                  child: Text(
                    widget.index!,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: (Theme.of(context).brightness ==
                                  Brightness.dark)
                              ? ColorManager.border_color_light.withOpacity(0.1)
                              : ColorManager.title_font_color_light
                                  .withOpacity(0.1),
                        ),
                    textAlign: TextAlign.left,
                  ),
                ),
            ],
          )),
    );
  }
}
