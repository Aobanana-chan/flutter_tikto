class HttpConstant {
  static const String baseUrl = 'http://192.168.0.100:8080';

  ///登录
  static const login = '/douyin/user/login';

  ///注册
  static const register = '/douyin/user/register';

  ///获取用户资料信息
  static const userInfo = '/douyin/user/';

  ///获取用户资料信息(扩展)
  static const userInfoEx = '/douyin/x/user/';

  ///获取上传凭证
  static const uploadToken = '/douyin/upload/token';

  ///上传文件
  static const uploadFile = '/douyin/upload/resource';

  ///发布feed
  static const publishFeed = '/douyin/feed/publish';

  ///视频流接口
  ///不限制登录状态，返回按投稿时间倒序的视频列表
  static const getFeed = '/douyin/feed';

  ///获取用户发布的作品列表
  static const userFeedList = '/douyin/feed/user/timeline';

  ///获取热门feed（推荐）
  static const hotFeedList = '/douyin/feed/hot';

  ///获取好友的feed列表
  static const friendFeedList = '/douyin/feed/friend/timeline';

  ///关注/取消关注
  static const follow = '/douyin/relation/follow';
}
