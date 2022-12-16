import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifiers/dark_theme_provider.dart';
import 'presentation/pages/home_page/home_page.dart';
import 'presentation/pages/home_page/homepage_providers/resume_provider.dart';
import 'presentation/resources/language_manager.dart';
import 'presentation/resources/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [ENGLISH_LOCAL, DEUTSCHE_LOCAL],
      path: ASSETS_PATH_LOCALISATIONS,
      fallbackLocale: ENGLISH_LOCAL,
      startLocale: ENGLISH_LOCAL,
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  Resumeprovider resumeProvider = Resumeprovider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    getResumeData();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.isDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  void getResumeData() async {
    resumeProvider.getAllResumeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(create: (_) {
          return themeChangeProvider;
        }),
        ChangeNotifierProvider<Resumeprovider>(create: (_) {
          return resumeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'DARWIN V TOMY',
          theme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.isDarkTheme),
          darkTheme: getApplicationTheme(
              context: context, isDarkTheme: themeChangeProvider.isDarkTheme),
          //   themeMode: ThemeMode.light,
          home: const HomePage(),
        );
      }),
    );
  }
}
