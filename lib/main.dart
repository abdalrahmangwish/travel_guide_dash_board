import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/services/app_settings/app_settings.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/screen/login_page.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/blocs/main_bloc/main_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/main_page/presentation/pages/slide_menu.dart';
import 'package:flutter_travel_guide_dashborad/service_locator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 50.0,
              ),
            ),
            child: SideMenuTravelGuide(),),
        navigatorKey: AppSettings().navigatorKey,
      );
    });
  }
}
