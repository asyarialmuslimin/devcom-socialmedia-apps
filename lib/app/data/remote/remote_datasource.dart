import 'dart:io';

import 'package:devcom_demo/app/data/remote/dio_handler.dart';
import 'package:devcom_demo/app/data/remote/response/listpostingan_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class RemoteDatasource {
  Dio dioHandler = DioHandler().dio;

  Future<List<ListPostinganResponse>> getListPostingan() async {
    try {
      final response = await dioHandler.get("api/postingan");
      List<dynamic> responseList = response.data;
      return responseList.map((elm) => ListPostinganResponse.fromJson(elm)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> sendPost(String photoPath, String caption) async {
    final dir = await getTemporaryDirectory();
    final compressedPath = "${dir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.${photoPath.split(".").last}";
    print("Compressed: $compressedPath");
    var compressed = await FlutterImageCompress.compressAndGetFile(photoPath, compressedPath, quality: 80, minHeight: 1000,);

    try {
      final formData = FormData.fromMap({
        "user_id" : 1,
        "description" : caption,
        "like" : 1,
        "foto" : await MultipartFile.fromFile(compressed!.path,),
      },);
      final response = await dioHandler.post("api/postingan", data: formData);
      if (response.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error Post: $e");
      return false;
    }
  }
}