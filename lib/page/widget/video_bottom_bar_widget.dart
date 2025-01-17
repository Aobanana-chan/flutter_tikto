import 'package:flutter/material.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/util/constants.dart';
import 'package:marquee/marquee.dart';

class VideoBottomBarWidget extends StatefulWidget {
  final FeedListList video;
  const VideoBottomBarWidget({Key key, this.video}) : super(key: key);

  @override
  _VideoBottomBarWidgetState createState() {
    return _VideoBottomBarWidgetState();
  }
}

class _VideoBottomBarWidgetState extends State<VideoBottomBarWidget> {
  @override
  Widget build(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width - kVinylDiskContainerWidth;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@${widget.video.user.nickname}',
            style: _getTextStyle(),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.video.content.text,
            style: _getTextStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/tiktok_white.webp',
                width: 25,
                height: 25,
              ),
              SizedBox(
                width: 200,
                height: 25,
                child: Marquee(
                  text: '用户创作的原生--${widget.video.user.nickname}',
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _getTextStyle() {
    return const TextStyle(
      color: Colors.white,
    );
  }
}
