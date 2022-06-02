class Feed {
  int statusCode;
  List<VideoList> videoList;
  int nextTime;

  Feed({this.statusCode, this.videoList, this.nextTime});

  Feed.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['video_list'] != null) {
      videoList = <VideoList>[];
      json['video_list'].forEach((v) {
        videoList.add(VideoList.fromJson(v));
      });
    }
    nextTime = json['next_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (videoList != null) {
      data['video_list'] = videoList.map((v) => v.toJson()).toList();
    }
    data['next_time'] = nextTime;
    return data;
  }
}

class VideoList {
  int id;
  Author author;
  String playUrl;
  String coverUrl;
  int favoriteCount;
  int commentCount;
  bool isFavorite;
  int userId;
  String title;

  VideoList({
    this.id,
    this.author,
    this.playUrl,
    this.coverUrl,
    this.favoriteCount,
    this.commentCount,
    this.isFavorite,
    this.userId,
    this.title,
  });

  VideoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    playUrl = json['play_url'];
    coverUrl = json['cover_url'];
    favoriteCount = json['favorite_count'];
    commentCount = json['comment_count'];
    isFavorite = json['is_favorite'];
    userId = json['UserId'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (author != null) {
      data['author'] = author.toJson();
    }
    data['play_url'] = playUrl;
    data['cover_url'] = coverUrl;
    data['favorite_count'] = favoriteCount;
    data['comment_count'] = commentCount;
    data['is_favorite'] = isFavorite;
    data['UserId'] = userId;
    data['title'] = title;

    return data;
  }
}

class Author {
  int id;
  String userName;
  String userPassword;
  String name;
  int followCount;
  int followerCount;
  bool isFollow;
  String token;
  String avatar;

  Author(
      {this.id,
      this.userName,
      this.userPassword,
      this.name,
      this.followCount,
      this.followerCount,
      this.isFollow,
      this.token,
      this.avatar});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['UserName'];
    userPassword = json['UserPassword'];
    name = json['name'];
    followCount = json['follow_count'];
    followerCount = json['follower_count'];
    isFollow = json['is_follow'];
    token = json['token'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserName'] = userName;
    data['UserPassword'] = userPassword;
    data['name'] = name;
    data['follow_count'] = followCount;
    data['follower_count'] = followerCount;
    data['is_follow'] = isFollow;
    data['token'] = token;
    data['avatar'] = avatar;
    return data;
  }
}
