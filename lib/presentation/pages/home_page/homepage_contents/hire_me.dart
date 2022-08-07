import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/custom_iconbutton.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class HireMeWidget extends StatelessWidget {
  const HireMeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 290,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/freelance.jpg',
            fit: BoxFit.fitWidth,
          ),
          Container(
            color: ColorManager.title_font_color_light.withOpacity(0.9),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'LET\'S WORK TOGETHER!',
                style: getRegularStyle(color: Colors.white, fontSize: 30),
              ),
              verticalSpace(48),
              CustomIconButton(onPressed: () {}, buttonText: 'HIRE ME!')
            ],
          )
        ],
      ),
    );
  }
}
