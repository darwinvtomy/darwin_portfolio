import 'dart:ui';

import 'package:darwin_portfolio/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../homepage_models/resume_model.dart';
import '../homepage_widgets/contents_placeholder.dart';
import '../homepage_widgets/portfolio_item.dart';

class PortFolio extends StatefulWidget {
  final List<Portfolio>? portfolio;
  const PortFolio({Key? key, this.portfolio}) : super(key: key);

  @override
  State<PortFolio> createState() => _PortFolioState();
}

class _PortFolioState extends State<PortFolio> {
  final double _itemExtent = 270;
  late InfiniteScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = InfiniteScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        paddingHorizontal: 0,
        title: AppStrings.portfolio.tr(),
        subTitle: AppStrings.my_works.tr(),
        centerAligned: true,
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: InfiniteCarousel.builder(
                itemCount: widget.portfolio!.length,
                itemExtent: _itemExtent,
                center: true,
                anchor: 0.0,
                velocityFactor: 1.0,
                scrollBehavior: kIsWeb
                    ? ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse
                        },
                      )
                    : null,
                controller: _controller,
                itemBuilder: (context, itemIndex, realIndex) {
                  final currentOffset = _itemExtent * realIndex;
                  return AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final diff = (_controller.offset - currentOffset);
                      const maxPadding = 18.0;
                      final carouselRatio = _itemExtent / maxPadding;

                      return Padding(
                        padding: EdgeInsets.only(
                          top: (diff / carouselRatio).abs(),
                          bottom: (diff / carouselRatio).abs(),
                        ),
                        child: child,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: PortfolioItem(
                        title: widget.portfolio![itemIndex].title!,
                        type: widget.portfolio![itemIndex].type!,
                        imageUrl: widget.portfolio![itemIndex].image!,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
