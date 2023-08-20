import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/screen/login_page.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_guide/presentation/add_guide.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/presentation/add_places.dart';
import 'package:flutter_travel_guide_dashborad/feature/guide_profile/presentation/guide_profile.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/blocs/main_bloc/main_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/screen/main_page.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/presentation/user_profile.dart';
import 'package:flutter_travel_guide_dashborad/service_locator.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
        title: 'dashboard',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(
          Icons.dashboard_outlined,
        ),
      ),
      SideMenuItem(
        title: 'add guide',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.person_add_rounded),
      ),
      SideMenuItem(
        title: 'add activity',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.add_photo_alternate_rounded),
      ),
      SideMenuItem(
        title: 'users',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.person_2_outlined),
      ),
      SideMenuItem(
        title: 'guides',
        onTap: (index, _) {
          sideMenu.changePage(index);
        },
        icon: const Icon(Icons.supervised_user_circle_rounded),
      ),
      SideMenuItem(
        title: 'exit',
        onTap: (index, _) {
          sl<MainCubit>().logout();
        },
        icon: const Icon(Icons.exit_to_app),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      child: BlocListener<MainCubit, MainState>(
        bloc: sl<MainCubit>(),
        listener: (context, state) {
          if (state is LogoutLoaded) {
            context.loaderOverlay.hide();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
                  (route) => false,
            );
          } else if (state is LogoutError) {
            context.loaderOverlay.hide();
            Utils.showCustomToast("error while logging out");
          } else if (state is LogoutLoading) {
            context.loaderOverlay.show();
          }
        },
        child: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                style: SideMenuStyle(
                  selectedTitleTextStyle:
                      StylesText.newDefaultTextStyle.copyWith(color: Colors.black),
                  unselectedTitleTextStyle:
                      StylesText.newDefaultTextStyle.copyWith(color: Colors.grey),
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
                  children: const [
                    MainPage(),
                    AddGuide(),
                    AddPlaces(),
                    UserProfile(),
                    GuideProfile()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
