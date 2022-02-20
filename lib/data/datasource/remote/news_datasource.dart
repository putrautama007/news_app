import 'package:news_app/data/model/news_data.dart';
import 'package:news_app/network/api_helper.dart';
import 'package:news_app/utils/strings/api_strings.dart';

class NewsDataSource {
  final ApiHelper apiHelper;

  NewsDataSource({
    required this.apiHelper,
  });

  Future<NewsData> getListNews() async {
    try {
      final result = await apiHelper.get(
          url: "${ApiStrings.baseUrl}${ApiStrings.headlines}",
          queryParameters: {
            "country": ApiStrings.country,
            "category": ApiStrings.category,
            "apiKey": ApiStrings.apiKey,
          });
      return NewsData.fromJson(result);
    } catch (_) {
      rethrow;
    }
  }
}
