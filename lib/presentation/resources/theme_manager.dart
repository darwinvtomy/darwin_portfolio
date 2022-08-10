import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationTheme(
    {required bool isDarkTheme, required BuildContext context}) {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      iconTheme: IconThemeData(
          color: isDarkTheme
              ? ColorManager.very_Light_gray
              : ColorManager.dark_gray),
      canvasColor:
          isDarkTheme ? ColorManager.gray_bg_color : ColorManager.white,
      splashColor: ColorManager.primaryOpacity70,
      scaffoldBackgroundColor: isDarkTheme
          ? ColorManager.darkgray_bg_color
          : ColorManager.lightgray_bg_color,
      // will be used incase of disabled button for example
      //accentColor: ColorManager.grey,
      colorScheme:
          isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light(),
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),

      // Text theme
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
            color: ColorManager.very_Light_gray,
            fontSize: 90,
            fontWeight: FontWeight.w100),
        headline2:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
        headline3:
            getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
        headline4: GoogleFonts.poppins(
            color: isDarkTheme ? Colors.white : ColorManager.darkGrey,
            fontSize: 30,
            fontWeight: FontWeight.w300),
        subtitle1: GoogleFonts.poppins(
            color: isDarkTheme ? Colors.white : ColorManager.darkGrey,
            fontSize: 32,
            fontWeight: FontWeight.w300),
        subtitle2:
            getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
        bodyText2: GoogleFonts.poppins(
            color: isDarkTheme ? Colors.white : ColorManager.darkGrey,
            fontSize: 16,
            height: 1.8,
            fontWeight: FontWeight.w300),
        // bodyText2: getMediumStyle(color: ColorManager.lightGrey),
        caption: GoogleFonts.poppins(
            color: isDarkTheme
                ? ColorManager.very_Light_gray
                : ColorManager.darkGrey,
            fontSize: 12,
            fontWeight: FontWeight.w300),
        //  bodyText1: getRegularStyle(color: ColorManager.grey)
      ),
      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.darkGrey),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
