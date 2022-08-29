import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/my_services.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/personal_blog.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/portfolio.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../models/navigation_item.dart';
import '../../../notifiers/dark_theme_provider.dart';
import 'homepage_contents/about_me.dart';
import 'homepage_contents/contact_me.dart';
import 'homepage_contents/hire_me.dart';
import 'homepage_contents/resume_content.dart';
import 'homepage_contents/testimonial.dart';
import 'homepage_widgets/contact_form.dart';
import 'homepage_widgets/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin {
  final topBannerkey = GlobalKey();
  final aboutMekey = GlobalKey();
  final myServiceskey = GlobalKey();
  final resumeContentkey = GlobalKey();
  final portFoliokey = GlobalKey();
  final testimonialkey = GlobalKey();
  final hireMeWidget = GlobalKey();
  final personalBlogkey = GlobalKey();
  final contactMekey = GlobalKey();
  List<NavigationItem> navigationItems = [];
  final ScrollController controller = ScrollController();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem(key: topBannerkey, text: 'HOME'),
        NavigationItem(key: aboutMekey, text: 'ABOUT'),
        NavigationItem(key: myServiceskey, text: 'SERVICES'),
        NavigationItem(key: resumeContentkey, text: 'RESUME'),
        NavigationItem(key: portFoliokey, text: 'PORTFOLIO'),
        NavigationItem(key: testimonialkey, text: 'TESTIMONIAL'),
        NavigationItem(key: hireMeWidget, text: 'HIRE ME'),
        NavigationItem(key: personalBlogkey, text: 'BLOG'),
        NavigationItem(key: contactMekey, text: 'CONTACT'),
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
      child: Scaffold(
        drawer: const TopDrawer(),
        body: ResponsiveBuilder(builder: (context, sizeInfo) {
          double drawerSize = sizeInfo.screenSize.width * 0.18;
          return Row(
            children: [
              if (!sizeInfo.isMobile) TopDrawer(),
              SizedBox(
                height: sizeInfo.screenSize.height,
                width: sizeInfo.isMobile
                    ? sizeInfo.screenSize.width
                    : sizeInfo.screenSize.width - drawerSize,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller: controller,
                      child: Column(
                        children: [
                          TopBanner(
                              name: 'DARWIN V TOMY',
                              scrollController: controller,
                              imageLink: 'assets/images/banner.jpg',
                              key: topBannerkey),
                          AboutMe(key: aboutMekey),
                          MyServices(key: myServiceskey),
                          ResumeContent(key: resumeContentkey),
                          PortFolio(key: portFoliokey),
                          Testimonial(key: testimonialkey),
                          HireMeWidget(key: hireMeWidget),
                          PersonalBlog(key: personalBlogkey),
                          ContactMe(key: contactMekey),
                          Credits(
                            sizeInfo.screenSize.width,
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        top: 20,
                        right: 20,
                        child: IconButton(
                            hoverColor: themeChange.darkTheme
                                ? Colors.white54
                                : Colors.black54,
                            onPressed: () {
                              themeChange.darkTheme = !themeChange.darkTheme;
                            },
                            icon: FaIcon(themeChange.darkTheme
                                ? FontAwesomeIcons.solidSun
                                : FontAwesomeIcons.solidMoon))),
                    if (sizeInfo.isMobile)
                      Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          icon: const Icon(
                            Icons.menu,
                            size: 36,
                          ),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
