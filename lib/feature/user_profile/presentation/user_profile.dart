import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/global_widget/global_widget.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/widget/home_page_widgets.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/data/model/user_model.dart';
import 'package:flutter_travel_guide_dashborad/feature/user_profile/presentation/bloc/user_cubit.dart';
import 'package:loader_overlay/loader_overlay.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      child: BlocProvider(
        create: (context) => UserCubit()..getUser(),
        child: Builder(builder: (context) {
          return Scaffold(
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
                    child: BlocBuilder<UserCubit, UserCubitState>(
                      buildWhen: (previous, current) {
                        if (current is GetUserError) return true;
                        if (current is GetUserLoaded) return true;
                        if (current is GetUserLoading) return true;
                        if (current is DeleteUserLoaded) {
                          context.loaderOverlay.hide();
                          return true;
                        }
                        if (current is DeleteUserLoading) {
                          context.loaderOverlay.show();
                        }
                        if (current is DeleteUserError) {
                          context.loaderOverlay.hide();
                          Utils.showCustomToast("error while deleting");
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if (state is GetUserLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (context.read<UserCubit>().users.isEmpty) {
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
                            model: context.read<UserCubit>().users[index],
                          ),
                          itemCount: context.read<UserCubit>().users.length,
                        );
                      },
                    )),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.model}) : super(key: key);
  final UserModel model;

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.name ?? ""),
                      SizedBox(height: 10),
                      Text(model.email ?? ""),
                    ],
                  ),
                  const Spacer(),
                  BlockCustomBottom(
                      width: MediaQuery.of(context).size.width * 0.065,
                      text: "delete",
                      height: 40,
                      onPress: () {
                        context.read<UserCubit>().deleteUser(model.id ?? -1);
                      },
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
