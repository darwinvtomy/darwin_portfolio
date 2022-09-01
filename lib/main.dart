import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'app/app_prefs.dart';
import 'notifiers/dark_theme_provider.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/resources/language_manager.dart';
import 'presentation/resources/strings_manager.dart';
import 'presentation/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [ENGLISH_LOCAL, DEUTSCHE_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      fallbackLocale: DEUTSCHE_LOCAL,
      startLocale: DEUTSCHE_LOCAL,
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  late List data;

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString(AppStrings.data_location);
    setState(() {
      print(jsonText);
      data = json.decode(jsonText);
    });
    return 'success';
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    loadJsonData();
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'DARWIN V TOMY',
          theme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.darkTheme),
          darkTheme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.darkTheme),
          //   themeMode: ThemeMode.light,
          home: const HomePage(),
        );
      }),
    );
  }
}
