import 'package:dio/dio.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    return _instance;
  }
  late Dio dio;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://learning_bloc_admin.test/api/",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(String path,
      {dynamic data, Map<String, dynamic>? queryParamaters}) async {
    print(data);
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParamaters,
    );
    print("My Response ${response.toString()}");
    return response.data;
  }
}
