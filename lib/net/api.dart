import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_tiktok/common/sp_keys.dart';
import 'package:flutter_tiktok/model/request/LoginModel.dart';
import 'package:flutter_tiktok/model/request/RegisterModel.dart';
import 'package:flutter_tiktok/model/request/follow_request.dart';
import 'package:flutter_tiktok/model/request/publish_feed_request.dart';
import 'package:flutter_tiktok/model/response/Feed.dart';
import 'package:flutter_tiktok/model/response/UserInfomation.dart';
import 'package:flutter_tiktok/model/response/UserPublishVideo.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/model/response/follow_response.dart';
import 'package:flutter_tiktok/model/response/login_response.dart';
import 'package:flutter_tiktok/model/response/publish_feed_response.dart';
import 'package:flutter_tiktok/model/response/upload_token_response.dart';
import 'package:flutter_tiktok/model/response/user_info_ex_response.dart';
import 'package:flutter_tiktok/model/response/user_info_response.dart';
import 'package:flutter_tiktok/model/brand_rank_model.dart';
import 'package:flutter_tiktok/model/city_item_model.dart';
import 'package:flutter_tiktok/model/living_rank_model.dart';
import 'package:flutter_tiktok/model/message_model.dart';
import 'package:flutter_tiktok/model/music_rank_model.dart';
import 'package:flutter_tiktok/model/response/user_work_list_response.dart';
import 'package:flutter_tiktok/model/star_model.dart';
import 'package:flutter_tiktok/model/user_model.dart';
import 'package:flutter_tiktok/model/video_model.dart';
import 'package:flutter_tiktok/model/living_commend_model.dart';
import 'package:flutter_tiktok/net/http/http_manager.dart';
import 'package:flutter_tiktok/net/http/http_method.dart';
import 'package:flutter_tiktok/net/http_constant.dart';
import 'package:flutter_tiktok/util/sp_util.dart';

import '../model/comment_model.dart';

class Api {
  /// ----------------------------------接口api--------------------------------------------------------

  ///登录
  @Deprecated("Old")
  static Future<LoginResponse> login(String account, String pwd) async {
    Map<String, String> map = HashMap();
    map['email'] = account;
    map['password'] = pwd;
    var result = await HttpManager.getInstance()
        .post(url: HttpConstant.login, cancelTokenTag: 'login', data: map);
    return LoginResponse().fromJson(result);
  }

  static Future<LoginResponse> goLogin(String account, String pwd) async {
    UserLogin login = UserLogin(username: account, password: pwd);
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.login,
        cancelTokenTag: 'login',
        params: login.toJson());
    if (result == null) {
      return LoginResponse().fromJson(null);
    }
    return LoginResponse()
        .fromJson({"uid": result["user_id"], "token": result["token"]});
  }

  ///注册
  @Deprecated("Old")
  static Future<LoginResponse> register(
      String account, String pwd, String pwdRepeat) async {
    Map<String, String> map = HashMap();
    map['email'] = account;
    map['password'] = pwd;
    map['repassword'] = pwdRepeat;
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.register, cancelTokenTag: 'register', data: map);
    return LoginResponse().fromJson(result);
  }

  static Future<LoginResponse> goRegister(
      String account, String pwd, String pwdRepeat) async {
    if (pwd != pwdRepeat) {
      EasyLoading.showToast('密码不一致');
      return LoginResponse().fromJson(null);
    }
    UserRegister registerInfomation =
        UserRegister(username: account, password: pwd);
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.register,
        cancelTokenTag: 'register',
        // data: registerInfomation.toJson(),
        params: registerInfomation.toJson());
    if (result == null) {
      return LoginResponse().fromJson(null);
    }
    return LoginResponse()
        .fromJson({"uid": result["user_id"], "token": result["token"]});
  }

  ///获取用户资料信息
  static Future<UserInfoResponse> getUserInfo(String uid) async {
    var result = await HttpManager.getInstance().get(
      url: HttpConstant.userInfo + uid,
      cancelTokenTag: 'getUserInfo',
    );
    return UserInfoResponse().fromJson(result);
  }

  ///获取用户资料信息(扩展)
  @Deprecated("Old")
  static Future<UserInfoExResponse> getUserInfoEx(String uid) async {
    var result = await HttpManager.getInstance().get(
      url: HttpConstant.userInfoEx + uid,
      cancelTokenTag: 'getUserInfoEx',
    );
    return UserInfoExResponse().fromJson(result);
  }

  static Future<UserInfoExResponse> goGetUserInfoEx(String uid) async {
    var token = await SPUtil.getString(SPKeys.token);
    var result = await HttpManager.getInstance().get(
        url: HttpConstant.userInfo,
        cancelTokenTag: 'getUserInfoEx',
        params: {"user_id": uid, "token": token});
    var resJson = UserInfomation.fromJson(result);
    return UserInfoExResponse().fromJson({
      "user": {
        "uid": int.parse(uid),
        "nickname": resJson.user.name,
        "portrait": "${result['user']['avatar']}",
        "bio": "hello World",
        "birth": "2000-1-1",
        "city": "南宁"
      },
      "followerCount": resJson.user.followerCount,
      "followingCount": resJson.user.followCount,
      "likeCount": 0,
      "relation": ""
    });
  }

  ///更新用户资料信息
  static Future<UserInfoResponse> updateUserInfo(
      Map<String, dynamic> map) async {
    var result = await HttpManager.getInstance().put(
        url: HttpConstant.userInfo + map['uid'].toString(),
        cancelTokenTag: 'getUserInfo',
        data: map);
    return UserInfoResponse().fromJson(result);
  }

  ///获取上传文件凭证
  static Future<UploadTokenResponse> getSingleUploadToken(
      List<String> filePathList) async {
    Map<String, List> map = HashMap();
    List resources = [];
    for (int i = 0; i < filePathList.length; i++) {
      Map<String, String> mapTemp = HashMap();
      mapTemp['type'] = filePathList[i];
      resources.add(mapTemp);
    }
    map['resources'] = resources;
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.uploadToken,
        cancelTokenTag: "getUploadToken",
        data: map);
    return UploadTokenResponse().fromJson(result);
  }

  ///上传文件
  @Deprecated("Old")
  static Future<bool> uploadSingleFile(
      File file, UploadTokenResponse tokenResponse, String fileSuffix) async {
    Stream<List<int>> listStream = file.openRead();
    UploadTokenTokensHeaders headers = tokenResponse.tokens[0].headers;
    UploadTokenToken tokenToken = tokenResponse.tokens[0];
    bool success = await HttpManager.getInstance().uploadFile(
      url: tokenToken.uploadUrl,
      cancelTokenTag: 'uploadFile',
      data: {},
      method: HttpMethod.PUT,
      options: Options(headers: {
        'Content-Type': headers.contentType,
        'Date': headers.date,
        'Authorization': headers.authorization
      }),
    );
    return success;
  }

  static Future<bool> goUploadSingleFile(
      File file, UploadTokenResponse tokenResponse, String title) async {
    // UploadTokenTokensHeaders headers = tokenResponse.tokens[0].headers;
    // UploadTokenToken tokenToken = tokenResponse.tokens[0];
    var success = await HttpManager.getInstance().uploadFile(
      url: HttpConstant.uploadFile,
      cancelTokenTag: 'uploadFile',
      data: {
        "title": title,
        "token": await SPUtil.getString(SPKeys.token),
        "data": await MultipartFile.fromFile(file.path)
      },
      method: HttpMethod.POST,
      // options: Options(headers: {
      //   'Content-Type': "multipart/form-data",
      // }),
    );
    return success;
  }

  ///发布feed
  static Future<PublishFeedResponse> publishFeed(
      PublishFeedRequest publishFeedRequest) async {
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.publishFeed,
        cancelTokenTag: 'publishFeed',
        data: publishFeedRequest.toJson());
    return PublishFeedResponse().fromJson(result);
  }

  ///获取用户作品列表
  @Deprecated("Old")
  static Future<UserWorkListResponse> getUserFeedList(
      int uid, int cursor, int count) async {
    var result = await HttpManager.getInstance().get(
        url:
            '${HttpConstant.userFeedList}?uid=$uid&cursor=$cursor&count=$count',
        cancelTokenTag: 'getUserFeedList');
    return UserWorkListResponse().fromJson(result);
  }

  static Future<UserWorkListResponse> goGetUserFeedList(
      int uid, int cursor, int count) async {
    var token = await SPUtil.getString(SPKeys.token);
    var result = await HttpManager.getInstance().get(
        url: HttpConstant.userPublish,
        cancelTokenTag: 'getUserFeedList',
        params: {"user_id": uid, "token": token});
    var resJson = UserPublishVideo.fromJson(result);
    var xList = [];
    for (var i in resJson.videoList) {
      xList.add({
        "id": i.id,
        "type": 0,
        "isLike": i.isFavorite,
        "content": {
          "text": "",
          "tag": [],
          "attachments": [
            {"url": i.playUrl, "cover": i.coverUrl}
          ]
        },
        "location": {"南宁": 1},
        "device": "",
        "aclType": 0,
        "commentType": 0,
        "createTime": DateTime.now().millisecondsSinceEpoch,
        "user": {
          "uid": i.author.id,
          "nickname": i.author.name,
          "portrait": i.coverUrl
        },
        "likeCount": i.favoriteCount ?? "0",
        "commentCount": i.commentCount,
        "shareCount": Random().nextInt(10),
        "viewCount": Random().nextInt(60000),
        "isFollow": i.author.isFollow,
      });
    }
    return UserWorkListResponse().fromJson({"hasMore": false, "list": xList});
  }

  ///获取热门作品列表
  @Deprecated("Old")
  static Future<FeedListResponse> getHotFeedList(int cursor, int count) async {
    var result = await HttpManager.getInstance().get(
        url: '${HttpConstant.hotFeedList}?cursor=$cursor&count=$count',
        cancelTokenTag: 'getHotFeedList');
    return FeedListResponse().fromJson(result);
  }

  static Future<FeedListResponse> goGetHotFeedList(
      int cursor, int count) async {
    var result = await HttpManager.getInstance().get(
        url: HttpConstant.getFeed,
        cancelTokenTag: 'getHotFeedList',
        params: {"token": await SPUtil.getString(SPKeys.token)});
    var res = Feed.fromJson(result);
    var xList = [];
    for (var i in res.videoList) {
      xList.add({
        "id": i.id,
        "type": 0,
        "isLike": i.isFavorite,
        "content": {
          "text": "",
          "tag": [],
          "attachments": [
            {"url": i.playUrl, "cover": i.coverUrl}
          ]
        },
        "location": {"南宁": 1},
        "device": "",
        "aclType": 0,
        "commentType": 0,
        "createTime": DateTime.now().millisecondsSinceEpoch,
        "user": {
          "uid": i.author.id,
          "nickname": i.author.name,
          "portrait": i.author.avatar
        },
        "likeCount": i.favoriteCount ?? "0",
        "commentCount": i.commentCount,
        "shareCount": Random().nextInt(10),
        "viewCount": Random().nextInt(60000),
        "isFollow": i.author.isFollow,
      });
    }
    return FeedListResponse().fromJson({
      "hasMore": false,
      "cursor": 0,
      "count": (result["video_list"] as List).length,
      "list": xList
    });
  }

  ///获取好友作品列表
  static Future<FeedListResponse> getFriendFeedList(
      int cursor, int count) async {
    var result = await HttpManager.getInstance().get(
      url: '${HttpConstant.friendFeedList}?cursor=$cursor&count=$count',
      cancelTokenTag: 'getFriendFeedList',
    );
    return FeedListResponse().fromJson(result);
  }

  static Future<FollowResponse> follow(FollowRequest request) async {
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.follow,
        cancelTokenTag: 'follow',
        data: request.toJson());
    return FollowResponse().fromJson(result);
  }

  static Future likeVideo(int videoId, int actionType) async {
    var uid = (await SPUtil.getInt(SPKeys.userUid)).toString();
    var token = await SPUtil.getString(SPKeys.token);
    var result = await HttpManager.getInstance().post(
        url: HttpConstant.likeVideo,
        cancelTokenTag: "likeVideoCancelToken",
        params: {
          "user_id": uid,
          "token": token,
          "video_id": videoId,
          "action_type": actionType
        });
  }

  /// ----------------------------------本地数据--------------------------------------------------------

  //获取推荐页面的视频列表
  static List<VideoModel> getRecommendVideoList() {
    List<VideoModel> list = [];
    for (int i = 0; i < 6; i++) {
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取朋友页面的视频列表
  static List<VideoModel> getFriendVideoList() {
    List<VideoModel> list = [];
    for (int i = 0; i < 6; i++) {
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取关注页面的视频列表
  static List<VideoModel> getFocusVideoList() {
    List<VideoModel> list = [];
    for (int i = 0; i < 6; i++) {
      VideoModel videoModel = VideoModel();
      videoModel.title = videoTitleList[i];
      videoModel.author = authorList[i];
      videoModel.authorHeaderUrl = authorHeaderUrlList[i];
      videoModel.videoUrl = videoUrlList[i];
      videoModel.favorite = false;
      videoModel.like = false;
      videoModel.likeNumber = '266${i}w';
      videoModel.commentList = commentList;
      videoModel.shareNumber = '18${i}w';
      videoModel.videoMusicImage = videoMusicImageList[i];
      videoModel.videoMusicName = videoMusicNameList[i];
      list.add(videoModel);
    }
    return list;
  }

  //获取城市页面的视频列表
  static List<CityItemModel> getCityVideoList() {
    List<CityItemModel> list = [];
    for (int i = 0; i < 6; i++) {
      CityItemModel cityItemModel = CityItemModel();
      cityItemModel.user = userModelList[i];
      cityItemModel.imgCoverUrl = gifList[i];
      cityItemModel.distance = '0.8${i}km';
      list.add(cityItemModel);
    }
    return list;
  }
}

List<UserModel> userModelList = List.generate(6, (i) {
  UserModel userModel = UserModel();
  userModel.name = authorList[i];
  userModel.headerBgImage = headerBgImageList[i];
  userModel.headerImg = authorHeaderUrlList[i];
  userModel.douYinNumber = '19234$i';
  userModel.introduction = introductionList[i];
  userModel.male = i % 2 == 0 ? true : false;
  userModel.city = '杭州';
  userModel.likeTotalNumber = '156${i}w';
  userModel.focusNumber = '45${i}w';
  userModel.fansNumber = '88${i}w';

  List<VideoModel> list = [];
  list.addAll(videoModelList);
  list.addAll(videoModelList);
  list.addAll(videoModelList);
  list.addAll(videoModelList);

  userModel.worksVideo = list;
  userModel.likeVideo = list;

  List<String> gifListTemp = [];
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);
  gifListTemp.addAll(gifList);

  userModel.worksVideoGif = gifListTemp;
  userModel.likeVideoGif = gifListTemp;

  return userModel;
});

UserModel loginUserModel = UserModel(
    name: '钉某人',
    loginUser: true,
    headerBgImage: 'assets/images/bg_1.jpg',
    headerImg: 'assets/images/header_holder.jpg',
    douYinNumber: '19423900',
    introduction:
        'Flutter小战士\nGithub:https://github.com/DingMouRen\n简书:https://www.jianshu.com/u/4abd568623a2\nB站:搜索[码农钉某人]',
    male: true,
    city: '杭州',
    likeTotalNumber: '66w',
    focusNumber: '66w',
    fansNumber: '888',
    worksVideo: videoModelList,
    likeVideo: videoModelList,
    likeVideoGif: gifList,
    worksVideoGif: gifList);

List<VideoModel> videoModelList = List.generate(6, (i) {
  VideoModel videoModel = VideoModel();
  videoModel.title = videoTitleList[i];
  videoModel.author = authorList[i];
  videoModel.authorHeaderUrl = authorHeaderUrlList[i];
  videoModel.videoUrl = videoUrlList[i];
  videoModel.favorite = false;
  videoModel.like = false;
  videoModel.likeNumber = '266${i}w';
  videoModel.commentList = commentList;
  videoModel.shareNumber = '18${i}w';
  videoModel.videoMusicImage = videoMusicImageList[i];
  videoModel.videoMusicName = videoMusicNameList[i];
  return videoModel;
});

//评论的本地假数据
List<CommentModel> commentList = [
  CommentModel('爱丽丝', 'assets/images/header_0.jpg', '千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！',
      false, 234, '2分钟前'),
  CommentModel('一条小团团', 'assets/images/header_1.jpg', '芙蓉不及美人妆，水殿风来珠翠香', false,
      688, '9分钟前'),
  CommentModel('伊素婉', 'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',
      false, 7567, '6分钟前'),
  CommentModel('超级马里奥', 'assets/images/header_3.jpg',
      '朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦', 'assets/images/header_4.jpg',
      '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰', false, 234, '4小时前'),
  CommentModel('惠子', 'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪', false,
      888, '4分钟前'),
  CommentModel('爱丽丝', 'assets/images/header_0.jpg', '千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！',
      false, 234, '2分钟前'),
  CommentModel('一条小团团', 'assets/images/header_1.jpg', '芙蓉不及美人妆，水殿风来珠翠香', false,
      688, '9分钟前'),
  CommentModel('伊素婉', 'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',
      false, 7567, '6分钟前'),
  CommentModel('超级马里奥', 'assets/images/header_3.jpg',
      '朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦', 'assets/images/header_4.jpg',
      '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰', false, 234, '4小时前'),
  CommentModel('惠子', 'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪', false,
      888, '4分钟前'),
  CommentModel('爱丽丝', 'assets/images/header_0.jpg', '千秋无绝色！悦目是佳人！倾国倾城貌！惊为天下人！',
      false, 234, '2分钟前'),
  CommentModel('一条小团团', 'assets/images/header_1.jpg', '芙蓉不及美人妆，水殿风来珠翠香', false,
      688, '9分钟前'),
  CommentModel('伊素婉', 'assets/images/header_2.jpg', '届笑春桃兮，云堆翠髻；唇绽樱颗兮，榴齿含香',
      false, 7567, '6分钟前'),
  CommentModel('超级马里奥', 'assets/images/header_3.jpg',
      '朱粉不深匀,闲花淡淡香。细看诸处好,人人道,柳腰身', false, 3543, '23分钟前'),
  CommentModel('肖了个邦', 'assets/images/header_4.jpg',
      '头上金爵钗，腰佩翠琅玕。明珠交玉体，珊瑚间木难。罗衣何飘飘，轻裾随风远。顾盼遗光彩，长啸气若兰', false, 234, '4小时前'),
  CommentModel('惠子', 'assets/images/header_5.jpg', '皎皎兮似轻云之蔽月，飘飘兮若回风之流雪', false,
      888, '4分钟前'),
];

//视频本地标题
List<String> videoTitleList = [
  '信手拈来的从容，都是厚积薄发的沉淀。',
  '只有坚持别人无法坚持的坚持，才能拥有别人无法拥有的拥有。',
  '我于颓废中睁眼，亦从灰烬中重燃。',
  '光荣与梦想千篇一律，自律与忍耐万里挑一。',
  '你要知道，别人的辉煌在现在，而你的辉煌在未来。',
  '当你觉得坚持不下去的时候，恰恰是你需要坚持下去的时候。',
];

//视频作者
List<String> authorList = [
  '爱丽丝',
  '一条小团团',
  '伊素婉',
  '超级马里奥',
  '肖了个邦',
  '惠子',
];
//作者头像
List<String> authorHeaderUrlList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//视频本地地址
List<String> videoUrlList = [
  'assets/video/video_0.mp4',
  'assets/video/video_1.mp4',
  'assets/video/video_2.mp4',
  'assets/video/video_3.mp4',
  'assets/video/video_4.mp4',
  'assets/video/video_5.mp4',
];

//本地视频对应得gif
List<String> gifList = [
  'assets/images/video_0.gif',
  'assets/images/video_1.gif',
  'assets/images/video_2.gif',
  'assets/images/video_3.gif',
  'assets/images/video_4.gif',
  'assets/images/video_5.gif',
];

//视频音乐的名称
List<String> videoMusicNameList = [
  '《隐形的翅膀》- 张韶涵',
  '《挥着翅膀的女孩》 - 容祖儿',
  '《永不退缩》 - 任贤齐',
  '《最初的梦想》 - Remix',
  '《改变自己》 - 王力宏',
  '《奔跑》 - 羽泉',
];

//视频音乐的头像
List<String> videoMusicImageList = [
  'assets/images/header_0.jpg',
  'assets/images/header_1.jpg',
  'assets/images/header_2.jpg',
  'assets/images/header_3.jpg',
  'assets/images/header_4.jpg',
  'assets/images/header_5.jpg',
];

//个人页头部背景
List<String> headerBgImageList = [
  'assets/images/bg_0.jpg',
  'assets/images/bg_1.jpg',
  'assets/images/bg_2.jpg',
  'assets/images/bg_3.jpg',
  'assets/images/bg_4.jpg',
  'assets/images/bg_5.jpg',
];

//个人页简介
List<String> introductionList = [
  '能让人感觉到快乐的不是只有爱情\n还有努力之后的成就感',
  '要悄悄地努力\n会有人在尽头处等你',
  '工作很累\n生活很闷\n但是走过这些艰苦的日子\n迎接你的就是锦绣前程',
  'Calm your mind\n secretly become very strong',
  '心里装着希望\n全力以赴\n才能不负自己',
  '现在付出更多的努力\n未来才会有更多的选择',
];

//消息列表
List<MessageModel> messageList = List.generate(20, (index) {
  MessageModel model = MessageModel();
  model.imgUrl = videoMusicImageList[index % 6];
  model.title = authorList[index % 6];
  model.desc = index % 2 == 0 ? '一条小团团赞了你的作品 · 6:12' : '[发布了新作品] · 06-06';
  return model;
});
//明星列表
List<StarModel> starList = [
  StarModel('赵丽颖', 'assets/images/star_0.jpeg', '888.3w 影响力'),
  StarModel('杨幂', 'assets/images/star_1.jpeg', '756.3w 影响力'),
  StarModel('高圆圆', 'assets/images/star_2.jpeg', '743.3w 影响力'),
  StarModel('李沁', 'assets/images/star_3.jpeg', '739.3w 影响力'),
  StarModel('迪丽热巴', 'assets/images/star_4.jpeg', '722.3w 影响力'),
  StarModel('彭于晏', 'assets/images/star_5.jpeg', '700.3w 影响力'),
];

//直播榜列表
List<LivingRankModel> livingList = [
  LivingRankModel('赵丽颖', 'assets/images/star_0.jpeg', '888.3w 人气'),
  LivingRankModel('杨幂', 'assets/images/star_1.jpeg', '756.3w 人气'),
  LivingRankModel('高圆圆', 'assets/images/star_2.jpeg', '743.3w 人气'),
  LivingRankModel('李沁', 'assets/images/star_3.jpeg', '739.3w 人气'),
  LivingRankModel('迪丽热巴', 'assets/images/star_4.jpeg', '722.3w 人气'),
  LivingRankModel('彭于晏', 'assets/images/star_5.jpeg', '700.3w 人气'),
];
//音乐榜列表
List<MusicRankModel> musicList = [
  MusicRankModel('千年之恋', 'assets/images/search_music_0.jpg', '1624.7 w'),
  MusicRankModel('Lydia', 'assets/images/search_music_1.jpg', '1624.7 w'),
  MusicRankModel('我们的爱', 'assets/images/search_music_2.jpg', '1624.7 w'),
  MusicRankModel('月牙湾', 'assets/images/search_music_3.jpg', '1624.7 w'),
  MusicRankModel('亚特兰提斯', 'assets/images/search_music_4.jpg', '1624.7 w'),
  MusicRankModel('雨樱花', 'assets/images/search_music_5.jpg', '1624.7 w'),
];
//品牌榜
List<BrandRankModel> brandList = [
  BrandRankModel('华为', 'assets/images/brand_0.jpg', '1645'),
  BrandRankModel('小米', 'assets/images/brand_1.jpg', '1625'),
  BrandRankModel('vivo', 'assets/images/brand_2.jpg', '1612'),
  BrandRankModel('海尔', 'assets/images/brand_3.jpg', '1569'),
  BrandRankModel('萤石', 'assets/images/brand_4.jpg', '1459'),
  BrandRankModel('阿里', 'assets/images/brand_5.jpg', '1023'),
];

//直播页评论
List<LivingCommendModel> livingCommendList = [
  LivingCommendModel('小冰人', 'cool'),
  LivingCommendModel('张靓颖', '好帅呀,cool'),
  LivingCommendModel('Jack', '主播牛逼呀，厉害呢'),
  LivingCommendModel('一朵花花', '主播牛逼呀，厉害呢'),
  LivingCommendModel('小红', '好帅呀，俺要嫁给你，么么哒~~~'),
  LivingCommendModel('小黄人', '好帅呀，左手一只鸭，右手一只鸡，啊啊'),
];
