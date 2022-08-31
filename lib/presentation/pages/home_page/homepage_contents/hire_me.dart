import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../utils/parallax_flow_delegate.dart';

class HireMeWidget extends StatelessWidget {
  HireMeWidget({Key? key}) : super(key: key);
  final GlobalKey _backgroundImageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 290,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Flow(
            delegate: ParallaxFlowDelegate(
              scrollable: Scrollable.of(context)!,
              listItemContext: context,
              backgroundImageKey: _backgroundImageKey,
            ),
            children: [
              Image.asset(
                'assets/images/freelance.jpg',
                fit: BoxFit.fitWidth,
                key: _backgroundImageKey,
              )
            ],
          ),
          Container(
            color: ColorManager.title_font_color_light.withOpacity(0.9),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.lets_work_together.tr(),
                style: getRegularStyle(color: Colors.white, fontSize: 30),
              ),
              verticalSpace(48),
              CustomIconButton(
                  onPressed: () {}, buttonText: AppStrings.hire_me.tr())
            ],
          )
        ],
      ),
    );
  }
}
