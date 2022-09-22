import 'package:darwin_portfolio/models/navigation_item.dart';
import 'package:darwin_portfolio/presentation/common/hover_extensions.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../homepage_models/resume_model.dart';
import 'drawer_icon.dart';

class TopDrawer extends StatelessWidget {
  final double drawerwidth;
  final bool? isamobileScreen;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Profile>? profiles;
  const TopDrawer(
      {Key? key,
      required this.drawerwidth,
      this.isamobileScreen,
      required this.scaffoldKey,
      this.profiles})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    if (isamobileScreen ?? false) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerContent(
              profiles: profiles,
              drawerwidth: drawerwidth,
              navigationItems: navigationItems,
              scrollController: scrollController),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: DrawerIcon(
              isDraweropen: true,
              scaffoldKey: scaffoldKey,
            ),
          )
        ],
      );
    } else {
      return DrawerContent(
          profiles: profiles,
          drawerwidth: drawerwidth,
          navigationItems: navigationItems,
          scrollController: scrollController);
    }
  }
}

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
    required this.drawerwidth,
    required this.navigationItems,
    required this.scrollController,
    this.profiles,
  });

  final double drawerwidth;
  final List<NavigationItem> navigationItems;
  final ScrollController scrollController;
  final List<Profile>? profiles;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: drawerwidth,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: ColorManager.gray_bg_color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorManager.card_bordercolor_dark)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(AppPadding.p10),
                  padding: const EdgeInsets.all(AppPadding.p10),
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border: Border.all(
                        color: ColorManager.photo_border_color,
                        style: BorderStyle.solid,
                        width: 1.0,
                      )),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.asset(
                        'assets/images/about.jpg',
                        height: 160,
                        width: 160,
                      )),
                ),
                for (var item in navigationItems)
                  DrawerTextButton(
                    text: item.text,
                    onClick: () {
                      scrollController.animateTo(item.position,
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut);
                    },
                  ).moveUpOnHoverWithoutshadow,
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: LinkButtons(
              profiles: profiles,
            ),
          )
        ],
      ),
    );
  }
}

class LinkButtons extends StatelessWidget {
  final List<Profile>? profiles;
  const LinkButtons({Key? key, this.profiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: GradientManager.commonGradient),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (Profile profile in profiles!)
              LinkIconButton(
                iconData: IconDataBrands(int.parse(profile.icon!)),
                onPressed: () {
                  launchUrl(Uri.parse(profile.url!));
                },
              ),
          ],
        ),
      ),
    );
  }
}

class LinkIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;
  const LinkIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(0),
      icon: FaIcon(
        iconData,
      ),
      onPressed: onPressed,
      color: Colors.white,
      iconSize: 16,
    );
  }
}

class DrawerTextButton extends StatefulWidget {
  final String text;
  final Function onClick;

  const DrawerTextButton({Key? key, required this.text, required this.onClick})
      : super(key: key);

  @override
  State<DrawerTextButton> createState() => _DrawerTextButtonState();
}

class _DrawerTextButtonState extends State<DrawerTextButton> {
  Color textColor = Colors.white54;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => {
        setState(() {
          textColor = Colors.white;
        })
      },
      onExit: (_) => {
        setState(() {
          textColor = Colors.white54;
        })
      },
      child: TextButton(
        onPressed: () {
          widget.onClick();
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Text(
            widget.text,
            style: getRegularStyle(color: textColor).copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
