import 'package:darwin_portfolio/presentation/pages/home_page/homepage_widgets/top_banner.dart';
import 'package:flutter/material.dart';

import 'homepage_widgets/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TopDrawer(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBanner(
                  name: 'DARWIN V TOMY',
                  scrollController: controller,
                  imageLink: 'assets/images/banner.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
