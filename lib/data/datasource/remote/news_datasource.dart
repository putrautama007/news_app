import 'package:news_app/data/model/news_data_model.dart';
import 'package:news_app/utils/failure/exception.dart';
import 'package:news_app/utils/network/api_helper.dart';
import 'package:news_app/utils/strings/api_strings.dart';

class NewsDataSource {
  final ApiHelper apiHelper;

  NewsDataSource({
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
