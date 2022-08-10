import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/my_services.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/personal_blog.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_contents/portfolio.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/top_banner.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../notifiers/dark_theme_provider.dart';
import 'homepage_contents/about_me.dart';
import 'homepage_contents/contact_me.dart';
import 'homepage_contents/hire_me.dart';
import 'homepage_contents/resume_content.dart';
import 'homepage_contents/testimonial.dart';
import 'homepage_widgets/contact_form.dart';
import 'homepage_widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      drawer: const TopDrawer(),
      body: ResponsiveBuilder(builder: (context, sizeInfo) {
        return Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopBanner(
                        name: 'DARWIN V TOMY',
                        scrollController: controller,
                        imageLink: 'assets/images/banner.jpg'),
                    const AboutMe(),
                    MyServices(),
                    const ResumeContent(),
                    PortFolio(),
                    Testimonial(),
                    const HireMeWidget(),
                    PersonalBlog(),
                    const ContactMe(),
                    Credits(sizeInfo.screenSize.width)
                  ],
                ),
              ),
            ),
            Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                    hoverColor:
                        themeChange.darkTheme ? Colors.white54 : Colors.black54,
                    onPressed: () {
                      themeChange.darkTheme = !themeChange.darkTheme;
                    },
                    icon: FaIcon(themeChange.darkTheme
                        ? FontAwesomeIcons.solidSun
                        : FontAwesomeIcons.solidMoon))),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 45,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
