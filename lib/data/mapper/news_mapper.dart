import 'package:news_app/data/model/news_data_model.dart';
import 'package:news_app/domain/entity/news_entity.dart';

class NewsMapper {
  NewsEntity mapNewsDataModelToNewsEntity(Article? article) => NewsEntity(
        source: NewsSourceEntity(
          id: article?.source?.id ?? "",
          name: article?.source?.name ?? "",
        ),
        author: article?.author ?? "",
        title: article?.title ?? "",
        url: article?.url ?? "",
        urlToImage: article?.urlToImage ?? "",
        publishedAt: article?.publishedAt,
        description: article?.description ?? "",
        content: article?.content ?? "",
      );

  NewsSourceEntity mapSourceModelToNewsSourceEntity(Source? source) =>
      NewsSourceEntity(
        id: source?.id ?? "",
        name: source?.name ?? "",
      );
}
