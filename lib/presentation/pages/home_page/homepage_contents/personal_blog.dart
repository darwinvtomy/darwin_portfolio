import 'package:darwin_portfolio/presentation/common/space.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/content_card.dart';
import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/contents_placeholder.dart';
import 'package:darwin_portfolio/presentation/resources/color_manager.dart';
import 'package:darwin_portfolio/presentation/resources/styles_manager.dart';
import 'package:darwin_portfolio/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PersonalBlog extends StatelessWidget {
  PersonalBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return ContentPlaceHolder(
        title: 'MY PERSONAL',
        subTitle: 'BLOG',
        paddingHorizontal: 0,
        child: SizedBox(
          height: 435,
          width: sizeInfo.screenSize.width,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 30),
            scrollDirection: Axis.horizontal,
            itemCount: kDemoImages.length,
            controller: PageController(
                initialPage: 2, viewportFraction: 0.22, keepPage: false),
            itemBuilder: (context, index) {
              return ContentCard(
                  padding: 0,
                  width: 300,
                  color: Theme.of(context).cardColor,
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          boxShadow: kElevationToShadow[2],
                          image: DecorationImage(
                            image: NetworkImage(kDemoImages[index]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: Text(
                          'Loren im parameter must not be null.some random text randum ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1),
                          maxLines: 2,
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: 300,
                          padding: const EdgeInsets.all(AppPadding.p16),
                          child: Text(
                            'Design',
                            style: Theme.of(context).textTheme.bodyText2,
                          ))
                    ],
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return horizontalSpace(32);
            },
          ),
        ),
      );
    });
  }
}

List<String> kDemoImages = [
  'https://i.pinimg.com/originals/7f/91/a1/7f91a18bcfbc35570c82063da8575be8.jpg',
  'https://www.absolutearts.com/portfolio3/a/afifaridasiddique/Still_Life-1545967888l.jpg',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/53415/72138/1597120261997_IMG_20200811_095922__49127.1597493165.jpg?c=2',
  'https://i.pinimg.com/originals/47/7e/15/477e155db1f8f981c4abb6b2f0092836.jpg',
  'https://images.saatchiart.com/saatchi/770124/art/3760260/2830144-QFPTZRUH-7.jpg',
  'https://images.unsplash.com/photo-1471943311424-646960669fbc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8c3RpbGwlMjBsaWZlfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80',
  'https://cdn11.bigcommerce.com/s-x49po/images/stencil/1280x1280/products/40895/55777/1526876829723_P211_24X36__2018_Stilllife_15000_20090__91926.1563511650.jpg?c=2',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIUsxpakPiqVF4W_rOlq6eoLYboOFoxw45qw&usqp=CAU',
  'https://images.mojarto.com/photos/267893/large/DA-SL-01.jpg?1560834975',
];
