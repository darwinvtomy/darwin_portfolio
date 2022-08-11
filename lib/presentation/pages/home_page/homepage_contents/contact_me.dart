import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';
import '../../../resources/values_manager.dart';
import '../homepage_widgets/contact_form.dart';
import '../homepage_widgets/contact_widget.dart';
import '../homepage_widgets/contents_placeholder.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      double halfsize = sizeInfo.screenSize.width * 0.9;
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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              SizedBox(
                width:
                    sizeInfo.screenSize.width - (sizeInfo.isMobile ? 30 : 60),
                height: 500,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(10.550762, 76.534538),
                    zoom: 18.2,
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
                      source: 'Chittady, Palakkad',
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
                verticalSpace(30),
                Text(
                  'Get in Touch',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                verticalSpace(24),
                SizedBox(
                  width: sizeInfo.screenSize.width,
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    children: [
                      ContactWidget(
                        width: sizeInfo.isMobile
                            ? halfsize
                            : (sizeInfo.screenSize.width / 2) - 50,
                        contact: '+91-9895007888',
                        title: 'Call Us',
                        icon: FontAwesomeIcons.mobileScreen,
                      ),
                      ContactWidget(
                        width: sizeInfo.isMobile
                            ? halfsize
                            : (sizeInfo.screenSize.width / 2) - 50,
                        contact: 'darwinvtomy@gmail.com',
                        title: 'Email Us',
                        icon: FontAwesomeIcons.solidEnvelope,
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
