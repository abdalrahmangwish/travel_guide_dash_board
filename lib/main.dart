import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/feature/main_page/presentation/pages/slide_menu.dart';
import 'package:flutter_travel_guide_dashborad/service_locator.dart';
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
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SideMenuTravelGuide(),
      );
    });
  }
}
