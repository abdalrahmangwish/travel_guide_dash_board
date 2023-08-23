import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/feature/account/data/models/remote/add_guide_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/guide_profile/presentation/blocs/guides_cubit/guides_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/widget/home_page_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

class GuideProfile extends StatelessWidget {
  const GuideProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuidesCubit()..getGuides(),
      child: Builder(builder: (context) {
        return LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: SpinKitSpinningLines(
              color: Colors.white,
              size: 50.0,
            ),
          ),
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(gradient: Constant.primaryBodyColor),
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
                    child: BlocBuilder<GuidesCubit, GuidesState>(
                      buildWhen: (previous, current) {
                        if (current is GetGuideError) return true;
                        if (current is GetGuideLoading) return true;
                        if (current is GetGuideLoaded) return true;
                        if (current is DeleteGuideLoaded) {
                          context.loaderOverlay.hide();
                          return true;
                        }
                        if (current is DeleteGuideLoading) {
                          context.loaderOverlay.show();
                        }
                        if (current is DeleteGuideError) {
                          context.loaderOverlay.hide();
                        }

                        return false;
                      },
                      builder: (context, state) {
                        if (state is GetGuideLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (context.read<GuidesCubit>().guides.isEmpty) {
                          return Center(
                            child: Text(
                              "no data to show",
                              style: StylesText.newDefaultTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemBuilder: (context, index) => UserItem(
                            model: context.read<GuidesCubit>().guides[index],
                          ),
                          itemCount: context.read<GuidesCubit>().guides.length,
                        );
                      },
                    )),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class UserItem extends StatefulWidget {
  const UserItem({Key? key, required this.model}) : super(key: key);
  final GuideModel model;
  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  bool open = false;

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TravelGuideUserAvatar(
                    imageUrl:
                        "${NetworkConfigurations.BaseUrl}/${widget.model.image}",
                    width: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.0099,
                  ),
                  Text(widget.model.name ?? ""),
                  const Spacer(),
                  Row(
                    children: [
                      BlockCustomBottom(
                        width: MediaQuery.of(context).size.width * 0.065,
                        text: "delete",
                        height: 40,
                        onPress: () {
                          context
                              .read<GuidesCubit>()
                              .deleteGuide(widget.model.id ?? -1);
                        },
                        borderColor: Colors.grey,
                        textStyleForButton: StylesText.newTextStyleForAppBar
                            .copyWith(fontSize: 14),
                        color: Colors.red,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            open = !open;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (open)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'gender: ',
                                style: StylesText.textStyleForDescription
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0999,
                              ),
                              Text(
                                'male',
                                style: StylesText.textStyleForDescription,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                'age: ',
                                style: StylesText.textStyleForDescription
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0999,
                              ),
                              Text(
                                widget.model.age.toString(),
                                style: StylesText.textStyleForDescription,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                'Years Of Experience :',
                                style: StylesText.textStyleForDescription
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0999,
                              ),
                              Text(
                                widget.model.yearsofExperience.toString(),
                                style: StylesText.textStyleForDescription,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'location: ',
                                style: StylesText.textStyleForDescription
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0999,
                              ),
                              Text(
                                widget.model.location ?? "",
                                style: StylesText.textStyleForDescription,
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                'bio: ',
                                style: StylesText.textStyleForDescription
                                    .copyWith(color: Colors.grey),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.0999,
                              ),
                              Text(
                                widget.model.bio ?? "",
                                style: StylesText.textStyleForDescription,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
