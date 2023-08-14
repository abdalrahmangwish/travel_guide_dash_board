
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_guide/presentation/add_guide.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/presentation/add_places.dart';
import 'package:flutter_travel_guide_dashborad/feature/guide_profile/presentation/guide_profile.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/screen/main_page.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/presentation/user_profile.dart';

class SideMenuTravelGuide extends StatefulWidget {
  const SideMenuTravelGuide({super.key});

  @override
  State<SideMenuTravelGuide> createState() => _SideMenuTravelGuideState();
}

class _SideMenuTravelGuideState extends State<SideMenuTravelGuide> {
  final PageController pageController = PageController();
  final SideMenuController sideMenu = SideMenuController();
  List<SideMenuItem> items = [];
  @override
  void initState() {
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    items = [
      SideMenuItem(
        title: 'Dashboard',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(
          Icons.dashboard_outlined,
        ),
      ),
      SideMenuItem(
        title: 'Add Guide',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.person_add),
      ),
      SideMenuItem(
        title: 'Add Activity',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.add_a_photo_outlined),
      ),
      SideMenuItem(
        title: 'User Profile',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.person_2_outlined),
      ),
      SideMenuItem(
        title: 'update profile',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.supervised_user_circle_rounded),
      ),
      SideMenuItem(
        title: 'FeedBack',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(
          Icons.feedback_outlined,
        ),
      ),
      SideMenuItem(
        title: 'Exit',
        onTap: (index, _) {
          // sl<HomeCubit>().logOut();
        },
        icon: const Icon(Icons.exit_to_app),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              openSideMenuWidth: 200,
              iconSize: 20,
              itemBorderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              showTooltip: true,
              itemHeight: 50.0,
              itemInnerSpacing: 8.0,
              itemOuterPadding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
            controller: sideMenu,
            title: DrawerHeader(child: Image.asset('assets/images/intro.png')),
            items: items,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children:  [
                MainPage(),
                AddGuide(),
                AddPlaces(),
                UserProfile(),
                GuideProfile()
                // MainPage(adsStatus: AppConstant.allAdsStatus),
                // MainPage(adsStatus: AppConstant.pendingStatus),
                // UserProfile(),
                // AddAdsPage(update: false),
                // UpdateAccountPage(),
                // FeedBackPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
