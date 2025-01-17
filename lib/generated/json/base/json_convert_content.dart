// ignore_for_file: non_constant_identifier_names, deprecated_member_use_from_same_package
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_tiktok/model/response/user_work_list_response.dart';
import 'package:flutter_tiktok/generated/json/user_work_list_response_helper.dart';
import 'package:flutter_tiktok/model/request/follow_request.dart';
import 'package:flutter_tiktok/generated/json/follow_request_helper.dart';
import 'package:flutter_tiktok/model/response/follow_response.dart';
import 'package:flutter_tiktok/generated/json/follow_response_helper.dart';
import 'package:flutter_tiktok/model/response/user_info_ex_response.dart';
import 'package:flutter_tiktok/generated/json/user_info_ex_response_helper.dart';
import 'package:flutter_tiktok/model/response/upload_token_response.dart';
import 'package:flutter_tiktok/generated/json/upload_token_response_helper.dart';
import 'package:flutter_tiktok/model/response/feed_list_response.dart';
import 'package:flutter_tiktok/generated/json/feed_list_response_helper.dart';
import 'package:flutter_tiktok/model/response/user_info_response.dart';
import 'package:flutter_tiktok/generated/json/user_info_response_helper.dart';
import 'package:flutter_tiktok/model/response/upload_response.dart';
import 'package:flutter_tiktok/generated/json/upload_response_helper.dart';
import 'package:flutter_tiktok/model/request/publish_feed_request.dart';
import 'package:flutter_tiktok/generated/json/publish_feed_request_helper.dart';
import 'package:flutter_tiktok/model/response/login_response.dart';
import 'package:flutter_tiktok/generated/json/login_response_helper.dart';
import 'package:flutter_tiktok/model/response/publish_feed_response.dart';
import 'package:flutter_tiktok/generated/json/publish_feed_response_helper.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case UserWorkListResponse:
        return userWorkListResponseFromJson(data as UserWorkListResponse, json)
            as T;
      case UserWorkListList:
        return userWorkListListFromJson(data as UserWorkListList, json) as T;
      case UserWorkListListContent:
        return userWorkListListContentFromJson(
            data as UserWorkListListContent, json) as T;
      case UserWorkListListContentTag:
        return userWorkListListContentTagFromJson(
            data as UserWorkListListContentTag, json) as T;
      case UserWorkListListContentAt:
        return userWorkListListContentAtFromJson(
            data as UserWorkListListContentAt, json) as T;
      case UserWorkListListContentAttachmants:
        return userWorkListListContentAttachmantsFromJson(
            data as UserWorkListListContentAttachmants, json) as T;
      case UserWorkListListContentMusic:
        return userWorkListListContentMusicFromJson(
            data as UserWorkListListContentMusic, json) as T;
      case UserWorkListListLocation:
        return userWorkListListLocationFromJson(
            data as UserWorkListListLocation, json) as T;
      case UserWorkListListUser:
        return userWorkListListUserFromJson(data as UserWorkListListUser, json)
            as T;
      case FollowRequest:
        return followRequestFromJson(data as FollowRequest, json) as T;
      case FollowResponse:
        return followResponseFromJson(data as FollowResponse, json) as T;
      case UserInfoExResponse:
        return userInfoExResponseFromJson(data as UserInfoExResponse, json)
            as T;
      case UserInfoExUser:
        return userInfoExUserFromJson(data as UserInfoExUser, json) as T;
      case UploadTokenResponse:
        return uploadTokenResponseFromJson(data as UploadTokenResponse, json)
            as T;
      case UploadTokenToken:
        return uploadTokenTokenFromJson(data as UploadTokenToken, json) as T;
      case UploadTokenTokensHeaders:
        return uploadTokenTokensHeadersFromJson(
            data as UploadTokenTokensHeaders, json) as T;
      case FeedListResponse:
        return feedListResponseFromJson(data as FeedListResponse, json) as T;
      case FeedListList:
        return feedListListFromJson(data as FeedListList, json) as T;
      case FeedListListContent:
        return feedListListContentFromJson(data as FeedListListContent, json)
            as T;
      case FeedListListContentTag:
        return feedListListContentTagFromJson(
            data as FeedListListContentTag, json) as T;
      case FeedListListContentAt:
        return feedListListContentAtFromJson(
            data as FeedListListContentAt, json) as T;
      case FeedListListContentAttachmants:
        return feedListListContentAttachmantsFromJson(
            data as FeedListListContentAttachmants, json) as T;
      case FeedListListContentMusic:
        return feedListListContentMusicFromJson(
            data as FeedListListContentMusic, json) as T;
      case FeedListListLocation:
        return feedListListLocationFromJson(data as FeedListListLocation, json)
            as T;
      case FeedListListUser:
        return feedListListUserFromJson(data as FeedListListUser, json) as T;
      case UserInfoResponse:
        return userInfoResponseFromJson(data as UserInfoResponse, json) as T;
      case UploadResponse:
        return uploadResponseFromJson(data as UploadResponse, json) as T;
      case PublishFeedRequest:
        return publishFeedRequestFromJson(data as PublishFeedRequest, json)
            as T;
      case PublishFeedContent:
        return publishFeedContentFromJson(data as PublishFeedContent, json)
            as T;
      case PublishFeedContentTag:
        return publishFeedContentTagFromJson(
            data as PublishFeedContentTag, json) as T;
      case PublishFeedContentAt:
        return publishFeedContentAtFromJson(data as PublishFeedContentAt, json)
            as T;
      case PublishFeedContentAttachmants:
        return publishFeedContentAttachmantsFromJson(
            data as PublishFeedContentAttachmants, json) as T;
      case PublishFeedContentMusic:
        return publishFeedContentMusicFromJson(
            data as PublishFeedContentMusic, json) as T;
      case PublishFeedLocation:
        return publishFeedLocationFromJson(data as PublishFeedLocation, json)
            as T;
      case LoginResponse:
        return loginResponseFromJson(data as LoginResponse, json) as T;
      case PublishFeedResponse:
        return publishFeedResponseFromJson(data as PublishFeedResponse, json)
            as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case UserWorkListResponse:
        return userWorkListResponseToJson(data as UserWorkListResponse);
      case UserWorkListList:
        return userWorkListListToJson(data as UserWorkListList);
      case UserWorkListListContent:
        return userWorkListListContentToJson(data as UserWorkListListContent);
      case UserWorkListListContentTag:
        return userWorkListListContentTagToJson(
            data as UserWorkListListContentTag);
      case UserWorkListListContentAt:
        return userWorkListListContentAtToJson(
            data as UserWorkListListContentAt);
      case UserWorkListListContentAttachmants:
        return userWorkListListContentAttachmantsToJson(
            data as UserWorkListListContentAttachmants);
      case UserWorkListListContentMusic:
        return userWorkListListContentMusicToJson(
            data as UserWorkListListContentMusic);
      case UserWorkListListLocation:
        return userWorkListListLocationToJson(data as UserWorkListListLocation);
      case UserWorkListListUser:
        return userWorkListListUserToJson(data as UserWorkListListUser);
      case FollowRequest:
        return followRequestToJson(data as FollowRequest);
      case FollowResponse:
        return followResponseToJson(data as FollowResponse);
      case UserInfoExResponse:
        return userInfoExResponseToJson(data as UserInfoExResponse);
      case UserInfoExUser:
        return userInfoExUserToJson(data as UserInfoExUser);
      case UploadTokenResponse:
        return uploadTokenResponseToJson(data as UploadTokenResponse);
      case UploadTokenToken:
        return uploadTokenTokenToJson(data as UploadTokenToken);
      case UploadTokenTokensHeaders:
        return uploadTokenTokensHeadersToJson(data as UploadTokenTokensHeaders);
      case FeedListResponse:
        return feedListResponseToJson(data as FeedListResponse);
      case FeedListList:
        return feedListListToJson(data as FeedListList);
      case FeedListListContent:
        return feedListListContentToJson(data as FeedListListContent);
      case FeedListListContentTag:
        return feedListListContentTagToJson(data as FeedListListContentTag);
      case FeedListListContentAt:
        return feedListListContentAtToJson(data as FeedListListContentAt);
      case FeedListListContentAttachmants:
        return feedListListContentAttachmantsToJson(
            data as FeedListListContentAttachmants);
      case FeedListListContentMusic:
        return feedListListContentMusicToJson(data as FeedListListContentMusic);
      case FeedListListLocation:
        return feedListListLocationToJson(data as FeedListListLocation);
      case FeedListListUser:
        return feedListListUserToJson(data as FeedListListUser);
      case UserInfoResponse:
        return userInfoResponseToJson(data as UserInfoResponse);
      case UploadResponse:
        return uploadResponseToJson(data as UploadResponse);
      case PublishFeedRequest:
        return publishFeedRequestToJson(data as PublishFeedRequest);
      case PublishFeedContent:
        return publishFeedContentToJson(data as PublishFeedContent);
      case PublishFeedContentTag:
        return publishFeedContentTagToJson(data as PublishFeedContentTag);
      case PublishFeedContentAt:
        return publishFeedContentAtToJson(data as PublishFeedContentAt);
      case PublishFeedContentAttachmants:
        return publishFeedContentAttachmantsToJson(
            data as PublishFeedContentAttachmants);
      case PublishFeedContentMusic:
        return publishFeedContentMusicToJson(data as PublishFeedContentMusic);
      case PublishFeedLocation:
        return publishFeedLocationToJson(data as PublishFeedLocation);
      case LoginResponse:
        return loginResponseToJson(data as LoginResponse);
      case PublishFeedResponse:
        return publishFeedResponseToJson(data as PublishFeedResponse);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle<M>(json) {
    String type = M.toString();
    if (type == (UserWorkListResponse).toString()) {
      return UserWorkListResponse().fromJson(json);
    } else if (type == (UserWorkListList).toString()) {
      return UserWorkListList().fromJson(json);
    } else if (type == (UserWorkListListContent).toString()) {
      return UserWorkListListContent().fromJson(json);
    } else if (type == (UserWorkListListContentTag).toString()) {
      return UserWorkListListContentTag().fromJson(json);
    } else if (type == (UserWorkListListContentAt).toString()) {
      return UserWorkListListContentAt().fromJson(json);
    } else if (type == (UserWorkListListContentAttachmants).toString()) {
      return UserWorkListListContentAttachmants().fromJson(json);
    } else if (type == (UserWorkListListContentMusic).toString()) {
      return UserWorkListListContentMusic().fromJson(json);
    } else if (type == (UserWorkListListLocation).toString()) {
      return UserWorkListListLocation().fromJson(json);
    } else if (type == (UserWorkListListUser).toString()) {
      return UserWorkListListUser().fromJson(json);
    } else if (type == (FollowRequest).toString()) {
      return FollowRequest().fromJson(json);
    } else if (type == (FollowResponse).toString()) {
      return FollowResponse().fromJson(json);
    } else if (type == (UserInfoExResponse).toString()) {
      return UserInfoExResponse().fromJson(json);
    } else if (type == (UserInfoExUser).toString()) {
      return UserInfoExUser().fromJson(json);
    } else if (type == (UploadTokenResponse).toString()) {
      return UploadTokenResponse().fromJson(json);
    } else if (type == (UploadTokenToken).toString()) {
      return UploadTokenToken().fromJson(json);
    } else if (type == (UploadTokenTokensHeaders).toString()) {
      return UploadTokenTokensHeaders().fromJson(json);
    } else if (type == (FeedListResponse).toString()) {
      return FeedListResponse().fromJson(json);
    } else if (type == (FeedListList).toString()) {
      return FeedListList().fromJson(json);
    } else if (type == (FeedListListContent).toString()) {
      return FeedListListContent().fromJson(json);
    } else if (type == (FeedListListContentTag).toString()) {
      return FeedListListContentTag().fromJson(json);
    } else if (type == (FeedListListContentAt).toString()) {
      return FeedListListContentAt().fromJson(json);
    } else if (type == (FeedListListContentAttachmants).toString()) {
      return FeedListListContentAttachmants().fromJson(json);
    } else if (type == (FeedListListContentMusic).toString()) {
      return FeedListListContentMusic().fromJson(json);
    } else if (type == (FeedListListLocation).toString()) {
      return FeedListListLocation().fromJson(json);
    } else if (type == (FeedListListUser).toString()) {
      return FeedListListUser().fromJson(json);
    } else if (type == (UserInfoResponse).toString()) {
      return UserInfoResponse().fromJson(json);
    } else if (type == (UploadResponse).toString()) {
      return UploadResponse().fromJson(json);
    } else if (type == (PublishFeedRequest).toString()) {
      return PublishFeedRequest().fromJson(json);
    } else if (type == (PublishFeedContent).toString()) {
      return PublishFeedContent().fromJson(json);
    } else if (type == (PublishFeedContentTag).toString()) {
      return PublishFeedContentTag().fromJson(json);
    } else if (type == (PublishFeedContentAt).toString()) {
      return PublishFeedContentAt().fromJson(json);
    } else if (type == (PublishFeedContentAttachmants).toString()) {
      return PublishFeedContentAttachmants().fromJson(json);
    } else if (type == (PublishFeedContentMusic).toString()) {
      return PublishFeedContentMusic().fromJson(json);
    } else if (type == (PublishFeedLocation).toString()) {
      return PublishFeedLocation().fromJson(json);
    } else if (type == (LoginResponse).toString()) {
      return LoginResponse().fromJson(json);
    } else if (type == (PublishFeedResponse).toString()) {
      return PublishFeedResponse().fromJson(json);
    }
    return null;
  }

  //list is returned by type
  static M _getListChildType<M>(List data) {
    if (<UserWorkListResponse>[] is M) {
      return data
          .map<UserWorkListResponse>((e) => UserWorkListResponse().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListList>[] is M) {
      return data
          .map<UserWorkListList>((e) => UserWorkListList().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListContent>[] is M) {
      return data
          .map<UserWorkListListContent>(
              (e) => UserWorkListListContent().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListContentTag>[] is M) {
      return data
          .map<UserWorkListListContentTag>(
              (e) => UserWorkListListContentTag().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListContentAt>[] is M) {
      return data
          .map<UserWorkListListContentAt>(
              (e) => UserWorkListListContentAt().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListContentAttachmants>[] is M) {
      return data
          .map<UserWorkListListContentAttachmants>(
              (e) => UserWorkListListContentAttachmants().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListContentMusic>[] is M) {
      return data
          .map<UserWorkListListContentMusic>(
              (e) => UserWorkListListContentMusic().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListLocation>[] is M) {
      return data
          .map<UserWorkListListLocation>(
              (e) => UserWorkListListLocation().fromJson(e))
          .toList() as M;
    } else if (<UserWorkListListUser>[] is M) {
      return data
          .map<UserWorkListListUser>((e) => UserWorkListListUser().fromJson(e))
          .toList() as M;
    } else if (<FollowRequest>[] is M) {
      return data
          .map<FollowRequest>((e) => FollowRequest().fromJson(e))
          .toList() as M;
    } else if (<FollowResponse>[] is M) {
      return data
          .map<FollowResponse>((e) => FollowResponse().fromJson(e))
          .toList() as M;
    } else if (<UserInfoExResponse>[] is M) {
      return data
          .map<UserInfoExResponse>((e) => UserInfoExResponse().fromJson(e))
          .toList() as M;
    } else if (<UserInfoExUser>[] is M) {
      return data
          .map<UserInfoExUser>((e) => UserInfoExUser().fromJson(e))
          .toList() as M;
    } else if (<UploadTokenResponse>[] is M) {
      return data
          .map<UploadTokenResponse>((e) => UploadTokenResponse().fromJson(e))
          .toList() as M;
    } else if (<UploadTokenToken>[] is M) {
      return data
          .map<UploadTokenToken>((e) => UploadTokenToken().fromJson(e))
          .toList() as M;
    } else if (<UploadTokenTokensHeaders>[] is M) {
      return data
          .map<UploadTokenTokensHeaders>(
              (e) => UploadTokenTokensHeaders().fromJson(e))
          .toList() as M;
    } else if (<FeedListResponse>[] is M) {
      return data
          .map<FeedListResponse>((e) => FeedListResponse().fromJson(e))
          .toList() as M;
    } else if (<FeedListList>[] is M) {
      return data.map<FeedListList>((e) => FeedListList().fromJson(e)).toList()
          as M;
    } else if (<FeedListListContent>[] is M) {
      return data
          .map<FeedListListContent>((e) => FeedListListContent().fromJson(e))
          .toList() as M;
    } else if (<FeedListListContentTag>[] is M) {
      return data
          .map<FeedListListContentTag>(
              (e) => FeedListListContentTag().fromJson(e))
          .toList() as M;
    } else if (<FeedListListContentAt>[] is M) {
      return data
          .map<FeedListListContentAt>(
              (e) => FeedListListContentAt().fromJson(e))
          .toList() as M;
    } else if (<FeedListListContentAttachmants>[] is M) {
      return data
          .map<FeedListListContentAttachmants>(
              (e) => FeedListListContentAttachmants().fromJson(e))
          .toList() as M;
    } else if (<FeedListListContentMusic>[] is M) {
      return data
          .map<FeedListListContentMusic>(
              (e) => FeedListListContentMusic().fromJson(e))
          .toList() as M;
    } else if (<FeedListListLocation>[] is M) {
      return data
          .map<FeedListListLocation>((e) => FeedListListLocation().fromJson(e))
          .toList() as M;
    } else if (<FeedListListUser>[] is M) {
      return data
          .map<FeedListListUser>((e) => FeedListListUser().fromJson(e))
          .toList() as M;
    } else if (<UserInfoResponse>[] is M) {
      return data
          .map<UserInfoResponse>((e) => UserInfoResponse().fromJson(e))
          .toList() as M;
    } else if (<UploadResponse>[] is M) {
      return data
          .map<UploadResponse>((e) => UploadResponse().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedRequest>[] is M) {
      return data
          .map<PublishFeedRequest>((e) => PublishFeedRequest().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedContent>[] is M) {
      return data
          .map<PublishFeedContent>((e) => PublishFeedContent().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedContentTag>[] is M) {
      return data
          .map<PublishFeedContentTag>(
              (e) => PublishFeedContentTag().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedContentAt>[] is M) {
      return data
          .map<PublishFeedContentAt>((e) => PublishFeedContentAt().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedContentAttachmants>[] is M) {
      return data
          .map<PublishFeedContentAttachmants>(
              (e) => PublishFeedContentAttachmants().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedContentMusic>[] is M) {
      return data
          .map<PublishFeedContentMusic>(
              (e) => PublishFeedContentMusic().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedLocation>[] is M) {
      return data
          .map<PublishFeedLocation>((e) => PublishFeedLocation().fromJson(e))
          .toList() as M;
    } else if (<LoginResponse>[] is M) {
      return data
          .map<LoginResponse>((e) => LoginResponse().fromJson(e))
          .toList() as M;
    } else if (<PublishFeedResponse>[] is M) {
      return data
          .map<PublishFeedResponse>((e) => PublishFeedResponse().fromJson(e))
          .toList() as M;
    }
    return null;
  }

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}
