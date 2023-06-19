import 'package:darwin_portfolio/presentation/common/hover_extensions.dart';
import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by 'flutter_map.dart'
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/values_manager.dart';
import '../homepage_models/resume_model.dart';
import '../homepage_widgets/contact_form.dart';
import '../homepage_widgets/contact_widget.dart';
import '../homepage_widgets/contents_placeholder.dart';

class ContactMe extends StatelessWidget {
  final String contactNo;
  final String email;
  final CurrentLocation? currentLocation;
  final String? markerImage;
  const ContactMe(
      {Key? key,
      required this.contactNo,
      required this.email,
      this.currentLocation,
      this.markerImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      double halfsize = sizeInfo.screenSize.width * 0.9;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContentPlaceHolder(
            bgColor: Theme.of(context).canvasColor,
            title: AppStrings.say_hello.tr(),
            subTitle: AppStrings.contact.tr(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(bottom: AppPadding.p24),
                child: Text(
                  AppStrings.my_location.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                width:
                    sizeInfo.screenSize.width - (sizeInfo.isMobile ? 30 : 60),
                height: 500,
                child: FlutterMap(
                  options: MapOptions(
                    center:
                        LatLng(currentLocation!.lat!, currentLocation!.long!),
                    zoom: 15,
                  ),
                  nonRotatedChildren: [
                    // AttributionWidget.defaultWidget( //TODO-Check this on later
                    //   source: 'Chittady, Palakkad',
                    //   onSourceTapped: () {},
                    // ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: [
                      Marker(
                        width: 80,
                        height: 80,
                        point: LatLng(
                            currentLocation!.lat!, currentLocation!.long!),
                        builder: (ctx) => Container(
                          margin: const EdgeInsets.all(AppPadding.p2),
                          padding: const EdgeInsets.all(AppPadding.p2),
                          height: 80,
                          width: 80,
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
                                markerImage!,
                                height: 160,
                                width: 160,
                              )),
                        ),
                      )
                    ]),
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
                  AppStrings.get_in_touch.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpace(24),
                SizedBox(
                  width: sizeInfo.screenSize.width,
                  child: Flex(
                    mainAxisSize: MainAxisSize.min,
                    direction:
                        sizeInfo.isMobile ? Axis.vertical : Axis.horizontal,
                    children: [
                      Flexible(
                        flex: sizeInfo.isMobile ? 0 : 1,
                        child: ContactWidget(
                          onClick: () {
                            launchUrl(Uri.parse("tel://$contactNo"));
                          },
                          width: sizeInfo.isMobile
                              ? halfsize
                              : (sizeInfo.screenSize.width / 2) - 50,
                          contact: contactNo,
                          title: AppStrings.call_us.tr(),
                          icon: FontAwesomeIcons.mobileScreen,
                        ).moveUpOnHover,
                      ),
                      sizeInfo.isMobile
                          ? verticalSpace(30)
                          : horizontalSpace(30),
                      Flexible(
                        flex: sizeInfo.isMobile ? 0 : 1,
                        child: ContactWidget(
                          onClick: () {
                            launchUrl(Uri(
                              scheme: 'mailto',
                              path: email,
                            ));
                          },
                          width: sizeInfo.isMobile
                              ? halfsize
                              : (sizeInfo.screenSize.width / 2) - 50,
                          contact: email,
                          title: AppStrings.email_us.tr(),
                          icon: FontAwesomeIcons.solidEnvelope,
                        ).moveUpOnHover,
                      ),
                    ],
                  ),
                ),
                verticalSpace(48),
                const ContactForm(),
                verticalSpace(48),
              ],
            ),
          ),
        ],
      );
    });
  }
}
