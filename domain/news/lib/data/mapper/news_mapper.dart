

import 'package:news/data/model/news_data_model.dart';
import 'package:news/domain/entity/news_entity.dart';

class NewsMapper {
  NewsEntity mapNewsEntityToNewsDataModel(Article article) => NewsEntity(
        source: NewsSource(
          id: article.source?.id ?? "",
          name: article.source?.name ?? "",
        ),
        author: article.author ?? "",
        title: article.title ?? "",
        url: article.url ?? "",
        urlToImage: article.urlToImage ?? "",
        publishedAt: article.publishedAt,
      );
}
