class UserInfomation {
  int statusCode;
  String statusMsg;
  User user;

  UserInfomation({this.statusCode, this.statusMsg, this.user});

  UserInfomation.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMsg = json['status_msg'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_msg'] = statusMsg;
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String userName;
  String userPassword;
  String name;
  bool isFollow;
  String token;
  int followCount;
  int followerCount;

  User(
      {this.id,
      this.userName,
      this.userPassword,
      this.name,
      this.isFollow,
      this.token,
      this.followCount,
      this.followerCount});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['UserName'];
    userPassword = json['UserPassword'];
    name = json['name'];
    isFollow = json['is_follow'];
    token = json['token'];
    followCount = json['follow_count'];
    followerCount = json['follower_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['UserName'] = userName;
    data['UserPassword'] = userPassword;
    data['name'] = name;
    data['is_follow'] = isFollow;
    data['token'] = token;
    data['follow_count'] = followCount;
    data['follower_count'] = followerCount;
    return data;
  }
}
