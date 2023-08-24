import 'package:comment_tree/comment_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/constant.dart';
import 'package:flutter_travel_guide_dashborad/core/constant/style.dart';
import 'package:flutter_travel_guide_dashborad/core/utils/utils.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/bloc/comment_cubit.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/data/remote/model/comment_models.dart';
import 'package:flutter_travel_guide_dashborad/feature/comment_page/presentation/widget/comments_widgets.dart';
import 'package:flutter_travel_guide_dashborad/feature/home_page/presentation/widget/home_page_widgets.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({
    super.key,
    required this.activityId,
    required this.showAppbar,
  });

  final int activityId;
  final bool showAppbar;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentCubit()..getCommentForCurrentPost(widget.activityId),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: widget.showAppbar
              ? AppBar(
                  backgroundColor: Colors.black26,
                  title: const Text("reviews"),
                )
              : null,
          body: BlocListener(
            listener: (context, state) {
              if (state is AddCommentError) {
                Utils.showCustomToast(state.error);
              }
            },
            bloc: context.read<CommentCubit>(),
            child: BlocBuilder(
              buildWhen: (previous, current) {
                if (current is CompleteGetAllComment) return true;
                if (current is LoadingGetAllComment) return true;
                if (current is ErrorGetAllComment) return true;
                return false;
              },
              bloc: context.read<CommentCubit>(),
              builder: (context, state) {
                if (state is LoadingGetAllComment) {
                  return const CommentLoadingWidget();
                }
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: context.read<CommentCubit>().commentList.isEmpty
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "no comment to show",
                                  style: StylesText.newDefaultTextStyle
                                      .copyWith(color: Colors.black),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<CommentCubit>()
                                        .getCommentForCurrentPost(
                                            widget.activityId);
                                  },
                                  child: Text(
                                    "try again",
                                    style: StylesText.defaultTextStyle.copyWith(
                                        color: Constant.secondaryColor),
                                  ),
                                )
                              ],
                            ))
                          : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return CommentItemBuilder(
                                  commentModel: context
                                      .read<CommentCubit>()
                                      .commentList[index],
                                );
                              },
                              itemCount: context
                                  .read<CommentCubit>()
                                  .commentList
                                  .length,
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}

class CommentItemBuilder extends StatelessWidget {
  const CommentItemBuilder({
    Key? key,
    required this.commentModel,
  }) : super(key: key);
  final CommentModel commentModel;
  @override
  Widget build(BuildContext context) {
    Comment comment = Comment(
      avatar: commentModel.user?.image ?? "",
      userName: commentModel.user?.name,
      content: commentModel.message ?? "",
    );
    return Container(
      margin: const EdgeInsets.all(10),
      child: CommentTreeWidget<Comment, Comment>(
        comment,
        const [],
        treeThemeData:
            const TreeThemeData(lineColor: Colors.transparent, lineWidth: 3),
        avatarRoot: (context, data) => PreferredSize(
          preferredSize: const Size.fromRadius(18),
          child: TravelGuideUserAvatar(
            width: 50,
            imageUrl: data.avatar ?? "",
          ),
        ),
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.userName ?? "",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.content ?? "",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
