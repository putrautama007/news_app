

import 'package:network/network/api_helper.dart';
import 'package:news/data/model/news_data_model.dart';
import 'package:resources/resources.dart';
import 'package:shared_library/failure/exception.dart';

class NewsRemoteDataSource {
  final ApiHelper apiHelper;

  NewsRemoteDataSource({
    required this.apiHelper,
  });

  Future<NewsDataModel> getListNews() async {
    try {
      final result = await apiHelper.get(
          url: "${ApiStrings.baseUrl}${ApiStrings.headlines}",
          queryParameters: {
            "country": ApiStrings.country,
            "category": ApiStrings.category,
            "apiKey": ApiStrings.apiKey,
          });
      return NewsDataModel.fromJson(result);
    } catch (_) {
      throw ServerException();
    }
  }
}
