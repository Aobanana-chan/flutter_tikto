import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:flutter_tiktok/page/widget/video_widget.dart';
import 'package:flutter_tiktok/res/colors.dart';
import 'package:like_button/like_button.dart';

class VideoRightBarWidget extends StatefulWidget {
  final Function onClickComment;
  final Function onClickShare;
  final Function onClickHeader;
  final bool showFocusButton;
  final FeedListList video;
  const VideoRightBarWidget(
      {Key key,
      this.onClickComment,
      this.onClickShare,
      this.showFocusButton,
      this.onClickHeader,
      this.video})
      : super(key: key);

  @override
  _VideoRightBarWidgetState createState() {
    return _VideoRightBarWidgetState();
  }
}

class _VideoRightBarWidgetState extends State<VideoRightBarWidget> {
  final double _widgetWidth = 50;
  ValueNotifier<int> likeCount;
  @override
  void initState() {
    super.initState();
    likeCount = ValueNotifier<int>(widget.video.likeCount);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: _widgetWidth,
      ),
      child: Column(
        children: [
          _getHeader(),
          const SizedBox(
            height: 25,
          ),
          _getLikeButton(),
          const SizedBox(
            height: 20,
          ),
          _getCommentButton(),
          const SizedBox(
            height: 20,
          ),
          _getShareButton(),
        ],
      ),
    );
  }

  //头像
  _getHeader() {
    String headerUrl = '';
    if (widget.video != null) headerUrl = widget.video.user.portrait;
    return InkWell(
      onTap: () {
        widget.onClickHeader?.call();
      },
      child: SizedBox(
        width: _widgetWidth,
        height: _widgetWidth + _widgetWidth / 8 * 3 / 2,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: _widgetWidth / 8 * 3 / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_widgetWidth / 2),
                  border: const Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 2)),
                  image: DecorationImage(
                      image: headerUrl == null
                          ? const AssetImage('assets/images/person_holder.png')
                          : NetworkImage(headerUrl),
                      fit: BoxFit.cover)),
            ),
            widget.showFocusButton == true
                ? Positioned(
                    child: Container(
                    width: _widgetWidth / 8 * 3,
                    height: _widgetWidth / 8 * 3,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_widgetWidth / 8 * 3 / 2),
                      color: ColorRes.color_3,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ))
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }

  //获取点赞按钮
  _getLikeButton() {
    // int likeCount = widget.video.likeCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LikeButton(
          likeCount: likeCount.value,
          isLiked: widget.video.isLike ?? false,
          size: 40,
          circleColor:
              const CircleColor(start: ColorRes.color_3, end: ColorRes.color_3),
          likeBuilder: (isLike) {
            return isLike == true
                ? Image.asset('assets/images/red_heart.webp')
                : Image.asset(
                    'assets/images/red_heart.webp',
                    color: Colors.white,
                  );
          },
          bubblesColor: const BubblesColor(
            dotPrimaryColor: ColorRes.color_3,
            dotSecondaryColor: ColorRes.color_3,
            dotThirdColor: ColorRes.color_3,
            dotLastColor: ColorRes.color_3,
          ),
          onTap: (isLike) async {
            var id = widget.video.id;
            if (isLike) {
              await Api.likeVideo(id, 2);
              likeCount.value--;
            } else {
              await Api.likeVideo(id, 1);
              likeCount.value++;
            }
            return !isLike;
          },
          // countBuilder: (likeCnt, isLike, text) {
          //   return Container(
          //     margin: const EdgeInsets.only(top: 2),
          //     child: Text(
          //       '$likeCount',
          //       style: const TextStyle(color: Colors.white),
          //     ),
          //   );
          // },
        ),
        const SizedBox(
          height: 2,
        ),
        ValueListenableBuilder<int>(
          valueListenable: likeCount,
          builder: (BuildContext context, int value, Widget child) {
            return Text(
              '$value',
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
      ],
    );
  }

  //获取评论按钮
  _getCommentButton() {
    int commentCount = widget.video.commentCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: _widgetWidth,
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            widget.onClickComment?.call();
          },
          icon: Image.asset(
            'assets/images/comment.webp',
          ),
        ),
        Text(
          '$commentCount',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }

  //获取分享按钮
  _getShareButton() {
    int shareCount = widget.video.shareCount;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          iconSize: _widgetWidth,
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            widget.onClickShare?.call();
          },
          icon: Image.asset(
            'assets/images/share_button.webp',
            width: 35,
            height: 35,
          ),
        ),
        Text(
          '$shareCount',
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
