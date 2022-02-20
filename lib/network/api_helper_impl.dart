import 'package:dio/dio.dart';
import 'package:news_app/network/api_helper.dart';
import 'package:news_app/utils/strings/api_strings.dart';

class ApiHelperImpl extends ApiHelper {
  final Dio dio;

  ApiHelperImpl({
    required this.dio,
  }) {
    initDio();
  }

  Dio initDio() {
    dio.options.baseUrl = ApiStrings.baseUrl;
    return dio;
  }

  @override
  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioError catch (e) {
      return e.error;
    }
  }
}
