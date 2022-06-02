class UserPublishModel {
  int statusCode;
  List<VideoList> videoList;

  UserPublishModel({this.statusCode, this.videoList});

  UserPublishModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['video_list'] != null) {
      videoList = <VideoList>[];
      json['video_list'].forEach((v) {
        videoList.add(VideoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (videoList != null) {
      data['video_list'] = videoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VideoList {
  int id;
  Author author;
  String playUrl;
  String coverUrl;
  int commentCount;
  int userId;
  String title;
  int favoriteCount;

  VideoList(
      {this.id,
      this.author,
      this.playUrl,
      this.coverUrl,
      this.commentCount,
      this.userId,
      this.title,
      this.favoriteCount});

  VideoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    playUrl = json['play_url'];
    coverUrl = json['cover_url'];
    commentCount = json['comment_count'];
    userId = json['UserId'];
    title = json['title'];
    favoriteCount = json['favorite_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (author != null) {
      data['author'] = author.toJson();
    }
    data['play_url'] = playUrl;
    data['cover_url'] = coverUrl;
    data['comment_count'] = commentCount;
    data['UserId'] = userId;
    data['title'] = title;
    data['favorite_count'] = favoriteCount;
    return data;
  }
}

class Author {
  int id;
  String userName;
  String userPassword;
  String name;
  bool isFollow;
  String token;

  Author(
      {this.id,
      this.userName,
      this.userPassword,
      this.name,
      this.isFollow,
      this.token});

  Author.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['UserName'];
    userPassword = json['UserPassword'];
    name = json['name'];
    isFollow = json['is_follow'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserName'] = userName;
    data['UserPassword'] = userPassword;
    data['name'] = name;
    data['is_follow'] = isFollow;
    data['token'] = token;
    return data;
  }
}
