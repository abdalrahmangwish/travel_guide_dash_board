// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:shimmer/shimmer.dart';
//
// class HomeLoadingWidget extends StatelessWidget {
//   const HomeLoadingWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: BoxConstraints(minHeight: 90.h),
//       child: Shimmer.fromColors(
//         baseColor: Colors.grey.shade300,
//         highlightColor: Colors.grey.shade100,
//         enabled: true,
//         child: const SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               BannerPlaceholder(),
//               TitlePlaceholder(width: double.infinity),
//               SizedBox(height: 16.0),
//               ContentPlaceholder(
//                 lineType: ContentLineType.threeLines,
//               ),
//               SizedBox(height: 16.0),
//               TitlePlaceholder(width: 200.0),
//               SizedBox(height: 16.0),
//               ContentPlaceholder(
//                 lineType: ContentLineType.twoLines,
//               ),
//               SizedBox(height: 16.0),
//               TitlePlaceholder(width: 200.0),
//               SizedBox(height: 16.0),
//               ContentPlaceholder(
//                 lineType: ContentLineType.twoLines,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class BannerPlaceholder extends StatelessWidget {
//   const BannerPlaceholder({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 200.0,
//       margin: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12.0),
//         color: Colors.white,
//       ),
//     );
//   }
// }
//
// class TitlePlaceholder extends StatelessWidget {
//   final double width;
//
//   const TitlePlaceholder({
//     Key? key,
//     required this.width,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: width,
//             height: 12.0,
//             color: Colors.white,
//           ),
//           const SizedBox(height: 8.0),
//           Container(
//             width: width,
//             height: 12.0,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// enum ContentLineType {
//   twoLines,
//   threeLines,
// }
//
// class ContentPlaceholder extends StatelessWidget {
//   final ContentLineType lineType;
//
//   const ContentPlaceholder({
//     Key? key,
//     required this.lineType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: 96.0,
//             height: 72.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.0),
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(width: 12.0),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 10.0,
//                   color: Colors.white,
//                   margin: const EdgeInsets.only(bottom: 8.0),
//                 ),
//                 if (lineType == ContentLineType.threeLines)
//                   Container(
//                     width: double.infinity,
//                     height: 10.0,
//                     color: Colors.white,
//                     margin: const EdgeInsets.only(bottom: 8.0),
//                   ),
//                 Container(
//                   width: 100.0,
//                   height: 10.0,
//                   color: Colors.white,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class E3lanatyUserAvatar extends StatelessWidget {
//   const E3lanatyUserAvatar({
//     Key? key,
//     required this.imageUrl,
//     required this.width,
//   }) : super(key: key);
//   final String imageUrl;
//   final double width;
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: width / 2,
//       backgroundColor: Colors.grey,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(50),
//         child: CachedNetworkImage(
//           width: width,
//           height: width,
//           fit: BoxFit.fill,
//           progressIndicatorBuilder: (context, url, progress) => const Image(
//             image: AssetImage(Assets.userAvatarAsset),
//             fit: BoxFit.fill,
//           ),
//           imageUrl:
//               "${NetworkConfigurations.BaseUrl}${NetworkConfigurations.kGetImagePath}/$imageUrl",
//           errorWidget: (context, url, error) => const Image(
//             image: AssetImage(Assets.userAvatarAsset),
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class GetNewAdsButton extends StatelessWidget {
//   const GetNewAdsButton({
//     Key? key,
//     required this.adsStatus,
//   }) : super(key: key);
//   final int adsStatus;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         context.read<GetAllAdsBloc>().add(
//               GetNewAdsEvents(adsStatus),
//             );
//       },
//       child: Container(
//         alignment: Alignment.center,
//         width: 50,
//         height: 50,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.black,
//             width: 1,
//           ),
//         ),
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
// class LoadingWhileGettingAds extends StatelessWidget {
//   const LoadingWhileGettingAds({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: 50,
//       height: 50,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: Colors.black,
//           width: 1,
//         ),
//       ),
//       child: const CircularProgressIndicator(
//         color: Colors.blue,
//         strokeWidth: 1,
//       ),
//     );
//   }
// }
//
// class GettingNewAdsTheWholeWidget extends StatelessWidget {
//   const GettingNewAdsTheWholeWidget({
//     Key? key,
//     required this.adsStatus,
//   }) : super(key: key);
//   final int adsStatus;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       child: BlocBuilder<GetAllAdsBloc, GetAllAdsState>(
//         buildWhen: (previous, current) {
//           if (current is GettingNewPageLoading) {
//             return true;
//           }
//           if (current is CompleteGetAllAds) {
//             return true;
//           }
//           if (current is ErrorGetAllAds) return true;
//           return false;
//         },
//         builder: (context, state) {
//           if (context.read<GetAllAdsBloc>().lastPage) {
//             return Center(
//               child: Text(
//                 "No more Ads",
//                 style: StylesText.defaultTextStyle,
//               ),
//             );
//           }
//           if (state is GettingNewPageLoading) {
//             return const LoadingWhileGettingAds();
//           }
//           return GetNewAdsButton(
//             adsStatus: adsStatus,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/assets.dart';

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

