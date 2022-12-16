import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/my_services.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/personal_blog.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/portfolio.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_providers/resume_provider.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/top_banner.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';

import '../../../models/navigation_item.dart';
import '../../../notifiers/dark_theme_provider.dart';
import '../../resources/language_manager.dart';
import '../../resources/strings_manager.dart';
import 'homepage_contents/about_me.dart';
import 'homepage_contents/contact_me.dart';
import 'homepage_contents/hire_me.dart';
import 'homepage_contents/resume_content.dart';
import 'homepage_contents/testimonial.dart';
import 'homepage_widgets/contact_form.dart';
import 'homepage_widgets/drawer.dart';
import 'homepage_widgets/drawer_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final topBannerkey = GlobalKey();
  final aboutMekey = GlobalKey();
  final myServiceskey = GlobalKey();
  final resumeContentkey = GlobalKey();
  final portFoliokey = GlobalKey();
  final testimonialkey = GlobalKey();
  final hireMeWidget = GlobalKey();
  final personalBlogkey = GlobalKey();
  final contactMekey = GlobalKey();
  String languageCode = 'en';
  List<NavigationItem> navigationItems = [];
  final ScrollController controller = ScrollController(
    initialScrollOffset: 0,
  );

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem(key: topBannerkey, text: AppStrings.home.tr()),
        NavigationItem(key: aboutMekey, text: AppStrings.about.tr()),
        NavigationItem(key: myServiceskey, text: AppStrings.services.tr()),
        NavigationItem(key: resumeContentkey, text: AppStrings.resume.tr()),
        NavigationItem(key: portFoliokey, text: AppStrings.portfolio.tr()),
        NavigationItem(key: testimonialkey, text: AppStrings.testimonial.tr()),
        NavigationItem(key: hireMeWidget, text: AppStrings.hire_me.tr()),
        NavigationItem(key: personalBlogkey, text: AppStrings.blog.tr()),
        NavigationItem(key: contactMekey, text: AppStrings.contact.tr()),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return MultiProvider(
        providers: [
          ProxyProvider0<List<NavigationItem>>(update: (_, __) {
            return navigationItems;
          }),
          ChangeNotifierProvider<ScrollController>(create: (_) {
            return controller;
          }),
        ],
        child: Consumer<Resumeprovider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return Scaffold(
                  body: Center(
                      child: SpinKitSquareCircle(
                color: ColorManager.button_bg_color,
                size: 70.0,
              )));
            } else {
              return ResponsiveBuilder(builder: (_, sizeInfo) {
                final double width = sizeInfo.screenSize.width;
                double drawerwidth = width * 0.18;
                final double drawerWidth = sizeInfo.isMobile
                    ? width * 0.59
                    : drawerwidth <= 181.44
                        ? 181.44
                        : drawerwidth;
                return Scaffold(
                  key: _scaffoldKey,
                  drawer: TopDrawer(
                    drawerwidth: drawerWidth,
                    isamobileScreen: true,
                    scaffoldKey: _scaffoldKey,
                    profiles: value.resume.profiles,
                  ),
                  body: Row(
                    children: [
                      if (!sizeInfo.isMobile)
                        TopDrawer(
                          drawerwidth: drawerWidth,
                          isamobileScreen: false,
                          scaffoldKey: _scaffoldKey,
                          profiles: value.resume.profiles,
                        ),
                      SizedBox(
                        height: sizeInfo.screenSize.height,
                        width: sizeInfo.isMobile
                            ? sizeInfo.screenSize.width
                            : sizeInfo.screenSize.width - drawerWidth,
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              key: const Key('long_list'),
                              controller: controller,
                              child: Column(
                                children: [
                                  TopBanner(
                                      name: value.resume.name!,
                                      scrollController: controller,
                                      imageLink: value.resume.bannerPicture!,
                                      key: topBannerkey),
                                  AboutMe(
                                    key: aboutMekey,
                                    address: value.resume.address1!,
                                    age: value.resume.age!,
                                    avatarLink: value.resume.avatarPicture!,
                                    dob: value.resume.dob!,
                                    email: value.resume.email!,
                                    name: value.resume.name!,
                                    phNo: value.resume.pno1!,
                                    summery: value.resume
                                        .getProfessionalSummery(languageCode)!,
                                  ),
                                  MyServices(
                                    key: myServiceskey,
                                    services: value.resume
                                        .getServicesList(languageCode),
                                  ),
                                  ResumeContent(
                                    key: resumeContentkey,
                                    workHistory: value.resume
                                        .getWorkHistory(languageCode),
                                    education: value.resume
                                        .getEducationHistory(languageCode),
                                    codingSkills: value.resume.coding,
                                    languageSkills: value.resume
                                        .getLanguageSkills(languageCode),
                                  ),
                                  PortFolio(
                                      key: portFoliokey,
                                      portfolio: value.resume
                                          .getPortfolioList(languageCode)),
                                  TestimonialSection(
                                      key: testimonialkey,
                                      testimonials: value.resume
                                          .getTestimonials(languageCode)),
                                  HireMeWidget(key: hireMeWidget),
                                  PersonalBlog(
                                    key: personalBlogkey,
                                    blogs: value.resume
                                        .getPersonalBlogs(languageCode),
                                  ),
                                  ContactMe(
                                    key: contactMekey,
                                    contactNo: value.resume.pno1!,
                                    email: value.resume.email!,
                                    currentLocation:
                                        value.resume.currentLocation,
                                    markerImage: value.resume.aboutPicture,
                                  ),
                                  Credits(
                                    sizeInfo.screenSize.width,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 20,
                              right: 20,
                              child: Column(
                                children: [
                                  IconButton(
                                    hoverColor: themeChange.isDarkTheme
                                        ? Colors.white54
                                        : Colors.black54,
                                    onPressed: () {
                                      themeChange.isDarkTheme =
                                          !themeChange.isDarkTheme;
                                    },
                                    icon: FaIcon(themeChange.isDarkTheme
                                        ? FontAwesomeIcons.solidSun
                                        : FontAwesomeIcons.solidMoon),
                                  ),
                                  verticalSpace(10),
                                  TextButton(
                                      onPressed: () {
                                        //context.setLocale(Locale('de', 'DE'));

                                        print(context.locale.languageCode);
                                        setState(() {
                                          if (context.locale.languageCode ==
                                              'de') {
                                            languageCode = 'en';
                                            context.setLocale(ENGLISH_LOCAL);
                                          } else {
                                            languageCode = 'de';
                                            context.setLocale(DEUTSCHE_LOCAL);
                                          }
                                        });
                                      },
                                      child: Text('EN/DE',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!))
                                ],
                              ),
                            ),
                            if (sizeInfo.isMobile)
                              Positioned(
                                left: 10,
                                top: 10,
                                child: DrawerIcon(
                                  scaffoldKey: _scaffoldKey,
                                  isDraweropen: false,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
            }
          },
        ));
  }
}
