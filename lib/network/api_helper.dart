import 'package:dio/dio.dart';
import 'package:news_app/utils/strings/api_strings.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({
    required this.dio,
  });

  Dio initDio() {
    dio.options.baseUrl = ApiStrings.baseUrl;
    return dio;
  }
}
