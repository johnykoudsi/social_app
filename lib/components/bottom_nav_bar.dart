import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:social_app/utility/app_assets.dart';
import 'package:social_app/utility/app_colors.dart';

import 'bottom_nav_bar_screens.dart';
import 'custom_navigator_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  static _BottomNavBarState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BottomNavBarState>();

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final SharedAxisTransitionType _transitionType = SharedAxisTransitionType.horizontal;
  int selectedIndex = 0;
  bool isNavBarVisible = true;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;

    return ColoredBox(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.kMainColor,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: Visibility(
            visible: isNavBarVisible,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: SizedBox(
                height: getWidth * 0.24,
                child: BottomNavigationBar(
                  selectedFontSize: 0.0,
                  unselectedFontSize: 0.0,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: selectedIndex,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: onItemTapped,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: CustomNavigatorWidget(
                        widgetIndex: 0,
                        svgPath: AppAssets.home,
                        selectedIndex: selectedIndex,
                      ),
                      label: "home",
                      tooltip: "home",
                    ),
                    BottomNavigationBarItem(
                      icon: CustomNavigatorWidget(
                        widgetIndex: 1,
                        svgPath: AppAssets.explore,
                        selectedIndex: selectedIndex,
                      ),
                      label: "explore",
                      tooltip: "explore",
                    ),
                    BottomNavigationBarItem(
                      icon: CustomNavigatorWidget(
                        widgetIndex: 2,
                        svgPath: AppAssets.profile,
                        selectedIndex: selectedIndex,
                      ),
                      label: "profile",
                      tooltip: "profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 600),
            transitionBuilder: (Widget child, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: _transitionType,
                child: child,
              );
            },
            child: GetSelectedScreenByIndex(
              screenIndex: selectedIndex,
              key: Key(selectedIndex.toString()),
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      isNavBarVisible = index != 1; // Hide nav bar for ExplorePage
    });
  }

  void toggleNavBarVisibility() {
    setState(() {
      isNavBarVisible = !isNavBarVisible;
    });
  }
}
