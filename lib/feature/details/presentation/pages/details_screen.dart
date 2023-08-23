import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';

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
                  decoration:
                      BoxDecoration(gradient: Constant.primaryBodyColor),
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
                                      border: Border.all()),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
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
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  NetworkImage(
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
                                        Text(
                                          "Name",
                                          style: StylesText.newDefaultTextStyle
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                                minHeight: 0.01),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              model.name ?? "",
                                              style: StylesText
                                                  .textStyleForDescription
                                                  .copyWith(
                                                      color: Colors.black26),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                        Text(
                                          "Description",
                                          style: StylesText.newDefaultTextStyle
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.000999,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                                minHeight: 0.01),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              model.description ?? "",
                                              style: StylesText
                                                  .textStyleForDescription
                                                  .copyWith(
                                                      color: Colors.black26),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5)),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                        Text(
                                          "City Name",
                                          style: StylesText.newDefaultTextStyle
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.000999,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                                minHeight: 0.01),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              model.city?.name ?? "",
                                              style: StylesText
                                                  .textStyleForDescription
                                                  .copyWith(
                                                      color: Colors.black26),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                        Text(
                                          "Rate",
                                          style: StylesText.newDefaultTextStyle
                                              .copyWith(color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.000999,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            constraints: const BoxConstraints(
                                                minHeight: 0.01),
                                            decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              model.rating.toString() ?? "1",
                                              style: StylesText
                                                  .textStyleForDescription
                                                  .copyWith(
                                                      color: Colors.black26),
                                            )),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.00999,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.003,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all()),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
