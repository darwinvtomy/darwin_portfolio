import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/dark_theme_provider.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/resources/theme_manager.dart';

void main() {
  runApp(const MyApp());
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

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          title: 'DARWIN V TOMY',
          theme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.darkTheme),
          darkTheme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.darkTheme),
          //   themeMode: ThemeMode.light,
          home: HomePage(),
        );
      }),
    );
  }
}
