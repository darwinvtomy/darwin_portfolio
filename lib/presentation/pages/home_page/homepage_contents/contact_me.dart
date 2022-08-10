import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/skills_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../homepage_widgets/contact_form.dart';
import '../homepage_widgets/contact_widget.dart';
import '../homepage_widgets/contents_placeholder.dart';
import '../homepage_widgets/service_card.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentPlaceHolder(
            bgColor: Theme.of(context).canvasColor,
            title: 'SAY HELLO',
            subTitle: 'CONTACT',
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Text(
                  'My Location',
                  style: getMediumStyle(
                      color: ColorManager.title_font_color_light, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: sizeInfo.screenSize.width,
                height: 500,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.509364, -0.128928),
                    zoom: 9.2,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: null,
                    ),
                  ],
                ),
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(right: 30, left: 30, bottom: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get in Touch',
                  style: getMediumStyle(
                      color: ColorManager.title_font_color_light, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                verticalSpace(24),
                SizedBox(
                  height: 170,
                  child: Row(
                    children: [
                      const Expanded(
                        child: ContactWidget(
                          contact: '+91-9895007888',
                          title: 'Call Us',
                          icon: FontAwesomeIcons.mobile,
                        ),
                      ),
                      horizontalSpace(30),
                      const Expanded(
                        child: ContactWidget(
                          contact: 'darwinvtomy@gmail.com',
                          title: 'Email Us',
                          icon: FontAwesomeIcons.envelope,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(48),
                ContactForm(),
                verticalSpace(48),
              ],
            ),
          ),
        ],
      );
    });
  }
}
