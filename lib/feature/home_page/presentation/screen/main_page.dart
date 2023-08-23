import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/services/network/network_configration.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/data/models/remote/get_activity_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/add_places/domain/use_cases/get_all_activity_use_case.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/widget/home_page_widgets.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../details/presentation/pages/details_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllAdsBloc()..add(GetNewAdsEvents()),
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
                            child: BlocBuilder<GetAllAdsBloc, GetAllAdsState>(
                              buildWhen: (previous, current) {
                                if (current is CompleteGetAllAds) return true;
                                if (current is LoadingGetAllAds) return true;
                                if (current is ErrorGetAllAds) return true;
                                return false;
                              },
                              builder: (context, state) {
                                if (state is LoadingGetAllAds) {
                                  return const HomeLoadingWidget();
                                }
                                return context
                                        .read<GetAllAdsBloc>()
                                        .listOfAllActivity
                                        .isEmpty
                                    ? Center(
                                        child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "no data to show",
                                            style:
                                                StylesText.newDefaultTextStyle,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context.read<GetAllAdsBloc>().add(
                                                    ReGetEvent(),
                                                  );
                                            },
                                            child: Text(
                                              "try again",
                                              style:
                                                  StylesText.defaultTextStyle,
                                            ),
                                          )
                                        ],
                                      ))
                                    : ScrollConfiguration(
                                        behavior:
                                            ScrollConfiguration.of(context)
                                                .copyWith(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          dragDevices: {
                                            PointerDeviceKind.touch,
                                            PointerDeviceKind.mouse,
                                            PointerDeviceKind.trackpad
                                          },
                                        ),
                                        child: RefreshIndicator(
                                          color: Colors.blue,
                                          onRefresh: () async {
                                            final result =
                                                await GetAllActivityUseCase()
                                                    .call(
                                              GetActivityParamsModel(1),
                                            );
                                            result.fold(
                                              (l) => context
                                                  .read<GetAllAdsBloc>()
                                                  .add(UpdateAllPostPage(
                                                      list: const [])),
                                              (r) {
                                                context
                                                    .read<GetAllAdsBloc>()
                                                    .add(UpdateAllPostPage(
                                                        list: r.data?.data ??
                                                            []));
                                              },
                                            );
                                          },
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              if (index ==
                                                  context
                                                      .read<GetAllAdsBloc>()
                                                      .listOfAllActivity
                                                      .length) {
                                                return const GettingNewAdsTheWholeWidget();
                                              }
                                              return InkWell(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsScreen(
                                                              model:context
                                                                  .read<GetAllAdsBloc>()
                                                                  .listOfAllActivity[index],
                                                            ))),
                                                child: ItemBuilderAds(
                                                  model: context
                                                      .read<GetAllAdsBloc>()
                                                      .listOfAllActivity[index],
                                                ),
                                              );
                                            },
                                            itemCount: context
                                                    .read<GetAllAdsBloc>()
                                                    .listOfAllActivity
                                                    .length +
                                                1,
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ItemBuilderAds extends StatelessWidget {
  const ItemBuilderAds({
    Key? key,
    required this.model,
  }) : super(key: key);
  final ActivityRemoteModel model;
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
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (model.urls?.isNotEmpty ?? true)
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: CarouselSlider(
                          items: model.urls
                              ?.map(
                                (e) => ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          model.name ?? "",
                          style: StylesText.newDefaultTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          model.price.toString(),
                          style: StylesText.newDefaultTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          model.region?.name ?? "",
                          style: StylesText.newDefaultTextStyle
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          model.type ?? "",
                          style: StylesText.newDefaultTextStyle
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
