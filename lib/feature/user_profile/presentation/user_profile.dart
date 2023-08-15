import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/widget/home_page_widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              color:
                                  Colors.black.withOpacity(0.5), // Shadow color
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
                        child: ListView.builder(
                          itemBuilder: (context, index) => UserItem(),
                          itemCount: 2,
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const TravelGuideUserAvatar(
                    imageUrl: "",
                    width: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0099,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('name '),
                      SizedBox(height: 10),
                      Text('email '),
                    ],
                  ),
                  const Spacer(),
                  BlockCustomBottom(
                      width: MediaQuery.of(context).size.width * 0.065,
                      text: "delete",
                      height: 40,
                      onPress: () {},
                      borderColor: Colors.grey,
                      textStyleForButton: StylesText.newTextStyleForAppBar
                          .copyWith(fontSize: 14),
                      color: Colors.red)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
