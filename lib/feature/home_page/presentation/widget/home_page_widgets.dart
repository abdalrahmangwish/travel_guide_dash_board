import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/assets.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/blocs/home_bloc/home_bloc.dart';

class TravelGuideUserAvatar extends StatelessWidget {
  const TravelGuideUserAvatar({
    Key? key,
    required this.imageUrl,
    required this.width,
  }) : super(key: key);
  final String imageUrl;
  final double width;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width / 2,
      backgroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CachedNetworkImage(
          width: width,
          height: width,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, progress) => const Image(
            image: AssetImage(Assets.userAvatarAsset),
            fit: BoxFit.fill,
          ),
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => const Image(
            image: AssetImage(Assets.userAvatarAsset),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class GettingNewAdsTheWholeWidget extends StatelessWidget {
  const GettingNewAdsTheWholeWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<GetAllAdsBloc, GetAllAdsState>(
        buildWhen: (previous, current) {
          if (current is GettingNewPageLoading) {
            return true;
          }
          if (current is CompleteGetAllAds) {
            return true;
          }
          if (current is ErrorGetAllAds) return true;
          return false;
        },
        builder: (context, state) {
          if (context.read<GetAllAdsBloc>().lastPage) {
            return Center(
              child: Text(
                "No more Ads",
                style: StylesText.newDefaultTextStyle,
              ),
            );
          }
          if (state is GettingNewPageLoading) {
            return const LoadingWhileGettingAds();
          }
          return GetNewAdsButton();
        },
      ),
    );
  }
}

class GetNewAdsButton extends StatelessWidget {
  const GetNewAdsButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GetAllAdsBloc>().add(
              GetNewAdsEvents(),
            );
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LoadingWhileGettingAds extends StatelessWidget {
  const LoadingWhileGettingAds({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: const CircularProgressIndicator(
        color: Colors.blue,
        strokeWidth: 1,
      ),
    );
  }
}
