import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/responsive/responsive.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/presentation/comment_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.model}) : super(key: key);
  final ActivityRemoteModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(gradient: Constant.primaryBodyColor),
                child: Padding(
                  padding: EdgeInsets.all(Constant.defaultPadding),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.1)),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: double.infinity,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: CarouselSlider(
                                          items: model.urls
                                              ?.map(
                                                (e) => ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            "${NetworkConfigurations.BaseUrl}${e.url}",
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                          options: CarouselOptions(
                                            autoPlay: false,
                                            padEnds: false,
                                            enlargeCenterPage: true,
                                            aspectRatio: 2,
                                            enableInfiniteScroll: false,
                                            enlargeStrategy:
                                                CenterPageEnlargeStrategy
                                                    .height,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Name",
                                        style: StylesText.newDefaultTextStyle
                                            .copyWith(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                            minHeight: 0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            model.name ?? "",
                                            style: StylesText
                                                .textStyleForDescription
                                                .copyWith(
                                                    color: Colors.black26),
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Region Name",
                                        style: StylesText.newDefaultTextStyle
                                            .copyWith(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                            minHeight: 0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            model.region?.name ?? "",
                                            style: StylesText
                                                .textStyleForDescription
                                                .copyWith(
                                                    color: Colors.black26),
                                          ),
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.00999,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Description",
                                        style: StylesText.newDefaultTextStyle
                                            .copyWith(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000999,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                            minHeight: 0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            model.description ?? "",
                                            style: StylesText
                                                .textStyleForDescription
                                                .copyWith(
                                                    color: Colors.black26),
                                          ),
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.00999,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "City Name",
                                        style: StylesText.newDefaultTextStyle
                                            .copyWith(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000999,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                            minHeight: 0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            model.city?.name ?? "",
                                            style: StylesText
                                                .textStyleForDescription
                                                .copyWith(
                                                    color: Colors.black26),
                                          ),
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.00999,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Rate",
                                        style: StylesText.newDefaultTextStyle
                                            .copyWith(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.000999,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                            minHeight: 0.01),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              Text(
                                                model.rating.toString() ?? "1",
                                                style: StylesText
                                                    .textStyleForDescription
                                                    .copyWith(
                                                        color: Colors.black26),
                                              ),
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.00999,
                                    ),
                                    if (Responsive.isMobile(context))
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        alignment: Alignment.center,
                                        child: CustomBottom(
                                          height: 50,
                                          width: 50.w,
                                          text: 'review',
                                          buttonColor: Colors.green,
                                          onPress: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CommentPage(
                                                  showAppbar: true,
                                                  activityId: model.id ?? -1,
                                                ),
                                              ),
                                            );
                                          },
                                          borderColor: Colors.transparent,
                                          textStyleForButton: StylesText
                                              .newDefaultTextStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.003,
                        ),
                        if (!Responsive.isMobile(context))
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: CommentPage(
                                showAppbar: false,
                                activityId: model.id ?? -1,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
