import 'package:devcom_demo/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHandler {
  Dio get dio => _getDio();
  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: Const.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    final dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    return dio;
  }
}