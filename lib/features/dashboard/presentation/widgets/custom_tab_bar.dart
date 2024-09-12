import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'custom_tabs.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: DefaultTabController(
          length: 4,
          initialIndex: widget.tabController.index,
          child: TabBar(
            controller: widget.tabController,
            onTap: (index) {
              setState(() {});
            },
            indicatorColor: Colors.white.withOpacity(0),
            padding: EdgeInsets.zero,
            splashBorderRadius: BorderRadius.circular(20),
            splashFactory: NoSplash.splashFactory,
            dividerHeight: 0,
            labelPadding: EdgeInsets.zero,
            tabAlignment: TabAlignment.fill,
            tabs: [
              FadeInLeft(
                child: CustomTabs(
                  imagePath: 'f1.png',
                  index: widget.tabController.index,
                  tabIndex: 0,
                ),
              ),
              SlideInLeft(
                child: CustomTabs(
                  imagePath: 'f4.png',
                  index: widget.tabController.index,
                  tabIndex: 1,
                ),
              ),
              SlideInRight(
                child: CustomTabs(
                  imagePath: 'f2.png',
                  index: widget.tabController.index,
                  tabIndex: 2,
                ),
              ),
              FadeInRight(
                child: CustomTabs(
                  imagePath: 'f3.png',
                  index: widget.tabController.index,
                  tabIndex: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
