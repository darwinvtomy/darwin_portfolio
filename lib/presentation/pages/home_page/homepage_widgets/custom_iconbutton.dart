// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  final String buttonText;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    this.icon,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(buttonText),
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: ColorManager.button_bg_color)),
          ),
          elevation: MaterialStateProperty.all(6),
          backgroundColor:
              MaterialStateProperty.all(ColorManager.button_bg_color),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: AppPadding.p16, horizontal: AppPadding.p30)),
          textStyle: MaterialStateProperty.all(
              getRegularStyle(color: Colors.white, fontSize: 12))),
    );
  }
}
