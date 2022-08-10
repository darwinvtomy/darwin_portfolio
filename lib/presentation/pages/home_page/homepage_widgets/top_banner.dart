import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../notifiers/dark_theme_provider.dart';

class TopBanner extends StatelessWidget {
  final String name;
  final ScrollController scrollController;
  final String imageLink;

  const TopBanner(
      {Key? key,
      required this.name,
      required this.scrollController,
      required this.imageLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Stack(alignment: Alignment.center, children: [
        Image.asset(
          imageLink,
          height: sizeInfo.screenSize.height,
          width: sizeInfo.screenSize.width,
          fit: BoxFit.cover,
          alignment: Alignment.bottomRight,
        ),
        CircularParticle(
          key: UniqueKey(),
          awayRadius: 80,
          numberOfParticles: 100,
          speedOfParticles: 0.7,
          height: sizeInfo.screenSize.height,
          width: sizeInfo.screenSize.width,
          onTapAnimation: true,
          particleColor: Colors.white.withAlpha(100),
          awayAnimationDuration: Duration(milliseconds: 900),
          maxParticleSize: 3,
          isRandSize: true,
          isRandomColor: true,
          randColorList: [
            Colors.white.withAlpha(200),
            Colors.white.withAlpha(150),
            Colors.white.withAlpha(100),
            Colors.white.withAlpha(60),
          ],
          awayAnimationCurve: Curves.easeInOutBack,
          enableHover: true,
          hoverColor: Colors.white,
          hoverRadius: 90,
          connectDots: true, //not recommended
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Checkbox(
        //     value: themeChange.darkTheme,
        //     onChanged: (bool? value) {
        //       themeChange.darkTheme = value ?? false;
        //     }),
      ]);
    });
  }
}
