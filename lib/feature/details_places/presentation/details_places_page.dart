import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
class DetailsPlacesPage extends StatelessWidget {
  const DetailsPlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  decoration:
                  BoxDecoration(gradient: Constant.primaryBodyColor),
                  child: Padding(
                    padding: EdgeInsets.all(Constant.defaultPadding),
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5), // Shadow color
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: double.infinity,
                        child:
                        Text("asdasd")
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
