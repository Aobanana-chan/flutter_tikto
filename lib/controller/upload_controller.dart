import 'dart:io';

import 'package:flutter_tiktok/model/response/upload_token_response.dart';
import 'package:flutter_tiktok/net/api.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  UploadTokenResponse uploadResponse;

  Future<bool> uploadSingleFile(String title, File file) async {
    // var uploadTokenResponse = await Api.getSingleUploadToken([fileSuffix]);

    // uploadResponse = uploadTokenResponse;

    var success = await Api.goUploadSingleFile(file, null, title);
    return success;
  }
}
