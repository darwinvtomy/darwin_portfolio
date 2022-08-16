import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

Widget verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

double getWindowPadding(BuildContext context) {
  return getValueForScreenType<double>(
    context: context,
    mobile: 10,
    tablet: 30,
    desktop: 60,
  );
}
