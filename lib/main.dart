 import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/presentation/screen/login_page.dart';
import 'package:flutter_travel_guide_dashborad/feature/main_page/presentation/pages/slide_menu.dart';

void main (){
  runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SideMenuTravelGuide(),
     );
   }
 }
