import 'package:flutter_tiktok/model/response/user_work_list_response.dart';

userWorkListResponseFromJson(
    UserWorkListResponse data, Map<String, dynamic> json) {
  if (json['list'] != null) {
    data.xList = <UserWorkListList>[];
    for (var v in (json['list'] as List)) {
      data.xList.add(UserWorkListList().fromJson(v));
    }
  }
  if (json['cursor'] != null) {
    data.cursor = json['cursor'] is String
        ? int.tryParse(json['cursor'])
        : json['cursor'].toInt();
  }
  if (json['count'] != null) {
    data.count = json['count'] is String
        ? int.tryParse(json['count'])
        : json['count'].toInt();
  }
  if (json['hasMore'] != null) {
    data.hasMore = json['hasMore'];
  }
  return data;
}

Map<String, dynamic> userWorkListResponseToJson(UserWorkListResponse entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  if (entity.xList != null) {
    data['list'] = entity.xList.map((v) => v.toJson()).toList();
  }
  data['cursor'] = entity.cursor;
  data['count'] = entity.count;
  data['hasMore'] = entity.hasMore;
  return data;
}

userWorkListListFromJson(UserWorkListList data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['type'] != null) {
    data.type = json['type'] is String
        ? int.tryParse(json['type'])
        : json['type'].toInt();
  }
  if (json['content'] != null) {
    data.content = UserWorkListListContent().fromJson(json['content']);
  }
  if (json['location'] != null) {
    data.location = UserWorkListListLocation().fromJson(json['location']);
  }
  if (json['device'] != null) {
    data.device = json['device'].toString();
  }
  if (json['aclType'] != null) {
    data.aclType = json['aclType'] is String
        ? int.tryParse(json['aclType'])
        : json['aclType'].toInt();
  }
  if (json['commentType'] != null) {
    data.commentType = json['commentType'] is String
        ? int.tryParse(json['commentType'])
        : json['commentType'].toInt();
  }
  if (json['createTime'] != null) {
    data.createTime = json['createTime'] is String
        ? int.tryParse(json['createTime'])
        : json['createTime'].toInt();
  }
  if (json['user'] != null) {
    data.user = UserWorkListListUser().fromJson(json['user']);
  }
  if (json['likeCount'] != null) {
    data.likeCount = json['likeCount'] is String
        ? int.tryParse(json['likeCount'])
        : json['likeCount'].toInt();
  }
  if (json['commentCount'] != null) {
    data.commentCount = json['commentCount'] is String
        ? int.tryParse(json['commentCount'])
        : json['commentCount'].toInt();
  }
  if (json['shareCount'] != null) {
    data.shareCount = json['shareCount'] is String
        ? int.tryParse(json['shareCount'])
        : json['shareCount'].toInt();
  }
  if (json['viewCount'] != null) {
    data.viewCount = json['viewCount'] is String
        ? int.tryParse(json['viewCount'])
        : json['viewCount'].toInt();
  }
  if (json['isFollow'] != null) {
    data.isFollow = json['isFollow'];
  }
  if (json['isLike'] != null) {
    data.isLike = json['isLike'];
  }
  return data;
}

Map<String, dynamic> userWorkListListToJson(UserWorkListList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['type'] = entity.type;
  if (entity.content != null) {
    data['content'] = entity.content.toJson();
  }
  if (entity.location != null) {
    data['location'] = entity.location.toJson();
  }
  data['device'] = entity.device;
  data['aclType'] = entity.aclType;
  data['commentType'] = entity.commentType;
  data['createTime'] = entity.createTime;
  if (entity.user != null) {
    data['user'] = entity.user.toJson();
  }
  data['likeCount'] = entity.likeCount;
  data['commentCount'] = entity.commentCount;
  data['shareCount'] = entity.shareCount;
  data['viewCount'] = entity.viewCount;
  data['isFollow'] = entity.isFollow;
  data['isLike'] = entity.isLike;
  return data;
}

userWorkListListContentFromJson(
    UserWorkListListContent data, Map<String, dynamic> json) {
  if (json['text'] != null) {
    data.text = json['text'].toString();
  }
  if (json['tag'] != null) {
    data.tag = <UserWorkListListContentTag>[];
    for (var v in (json['tag'] as List)) {
      data.tag.add(UserWorkListListContentTag().fromJson(v));
    }
  }
  if (json['at'] != null) {
    data.at = <UserWorkListListContentAt>[];
    for (var v in (json['at'] as List)) {
      data.at.add(UserWorkListListContentAt().fromJson(v));
    }
  }
  if (json['attachments'] != null) {
    data.attachments = <UserWorkListListContentAttachmants>[];
    for (var v in (json['attachments'] as List)) {
      data.attachments.add(UserWorkListListContentAttachmants().fromJson(v));
    }
  }
  if (json['music'] != null) {
    data.music = UserWorkListListContentMusic().fromJson(json['music']);
  }
  return data;
}

Map<String, dynamic> userWorkListListContentToJson(
    UserWorkListListContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['text'] = entity.text;
  if (entity.tag != null) {
    data['tag'] = entity.tag.map((v) => v.toJson()).toList();
  }
  if (entity.at != null) {
    data['at'] = entity.at.map((v) => v.toJson()).toList();
  }
  if (entity.attachments != null) {
    data['attachments'] = entity.attachments.map((v) => v.toJson()).toList();
  }
  if (entity.music != null) {
    data['music'] = entity.music.toJson();
  }
  return data;
}

userWorkListListContentTagFromJson(
    UserWorkListListContentTag data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['start'] != null) {
    data.start = json['start'] is String
        ? int.tryParse(json['start'])
        : json['start'].toInt();
  }
  if (json['end'] != null) {
    data.end =
        json['end'] is String ? int.tryParse(json['end']) : json['end'].toInt();
  }
  return data;
}

Map<String, dynamic> userWorkListListContentTagToJson(
    UserWorkListListContentTag entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['start'] = entity.start;
  data['end'] = entity.end;
  return data;
}

userWorkListListContentAtFromJson(
    UserWorkListListContentAt data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['start'] != null) {
    data.start = json['start'] is String
        ? int.tryParse(json['start'])
        : json['start'].toInt();
  }
  if (json['end'] != null) {
    data.end =
        json['end'] is String ? int.tryParse(json['end']) : json['end'].toInt();
  }
  return data;
}

Map<String, dynamic> userWorkListListContentAtToJson(
    UserWorkListListContentAt entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['start'] = entity.start;
  data['end'] = entity.end;
  return data;
}

userWorkListListContentAttachmantsFromJson(
    UserWorkListListContentAttachmants data, Map<String, dynamic> json) {
  if (json['type'] != null) {
    data.type = json['type'] is String
        ? int.tryParse(json['type'])
        : json['type'].toInt();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['cover'] != null) {
    data.cover = json['cover'].toString();
  }
  if (json['gifCover'] != null) {
    data.gifCover = json['gifCover'].toString();
  }
  if (json['duration'] != null) {
    data.duration = json['duration'] is String
        ? int.tryParse(json['duration'])
        : json['duration'].toInt();
  }
  if (json['width'] != null) {
    data.width = json['width'] is String
        ? int.tryParse(json['width'])
        : json['width'].toInt();
  }
  if (json['height'] != null) {
    data.height = json['height'] is String
        ? int.tryParse(json['height'])
        : json['height'].toInt();
  }
  return data;
}

Map<String, dynamic> userWorkListListContentAttachmantsToJson(
    UserWorkListListContentAttachmants entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['cover'] = entity.cover;
  data['gifCover'] = entity.gifCover;
  data['duration'] = entity.duration;
  data['width'] = entity.width;
  data['height'] = entity.height;
  return data;
}

userWorkListListContentMusicFromJson(
    UserWorkListListContentMusic data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id =
        json['id'] is String ? int.tryParse(json['id']) : json['id'].toInt();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['url'] != null) {
    data.url = json['url'].toString();
  }
  if (json['img'] != null) {
    data.img = json['img'].toString();
  }
  return data;
}

Map<String, dynamic> userWorkListListContentMusicToJson(
    UserWorkListListContentMusic entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['url'] = entity.url;
  data['img'] = entity.img;
  return data;
}

userWorkListListLocationFromJson(
    UserWorkListListLocation data, Map<String, dynamic> json) {
  if (json['latitude'] != null) {
    data.latitude = json['latitude'].toString();
  }
  if (json['longitude'] != null) {
    data.longitude = json['longitude'].toString();
  }
  if (json['cityCode'] != null) {
    data.cityCode = json['cityCode'].toString();
  }
  if (json['adCode'] != null) {
    data.adCode = json['adCode'].toString();
  }
  if (json['address'] != null) {
    data.address = json['address'].toString();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  return data;
}

Map<String, dynamic> userWorkListListLocationToJson(
    UserWorkListListLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['latitude'] = entity.latitude;
  data['longitude'] = entity.longitude;
  data['cityCode'] = entity.cityCode;
  data['adCode'] = entity.adCode;
  data['address'] = entity.address;
  data['name'] = entity.name;
  return data;
}

userWorkListListUserFromJson(
    UserWorkListListUser data, Map<String, dynamic> json) {
  if (json['uid'] != null) {
    data.uid =
        json['uid'] is String ? int.tryParse(json['uid']) : json['uid'].toInt();
  }
  if (json['nickname'] != null) {
    data.nickname = json['nickname'].toString();
  }
  if (json['portrait'] != null) {
    data.portrait = json['portrait'].toString();
  }
  if (json['bio'] != null) {
    data.bio = json['bio'].toString();
  }
  if (json['birth'] != null) {
    data.birth = json['birth'].toString();
  }
  if (json['gender'] != null) {
    data.gender = json['gender'] is String
        ? int.tryParse(json['gender'])
        : json['gender'].toInt();
  }
  if (json['city'] != null) {
    data.city = json['city'].toString();
  }
  if (json['profession'] != null) {
    data.profession = json['profession'].toString();
  }
  if (json['create_time'] != null) {
    data.createTime = json['create_time'] is String
        ? int.tryParse(json['create_time'])
        : json['create_time'].toInt();
  }
  return data;
}

Map<String, dynamic> userWorkListListUserToJson(UserWorkListListUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['uid'] = entity.uid;
  data['nickname'] = entity.nickname;
  data['portrait'] = entity.portrait;
  data['bio'] = entity.bio;
  data['birth'] = entity.birth;
  data['gender'] = entity.gender;
  data['city'] = entity.city;
  data['profession'] = entity.profession;
  data['create_time'] = entity.createTime;
  return data;
}
