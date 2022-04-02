import 'package:local_database/database/database.dart';
import 'package:news/data/model/news_data_model.dart';
import 'package:news/domain/entity/news_entity.dart';

class NewsMapper {
  NewsEntity mapNewsDataModelToNewsEntity(Article? article) => NewsEntity(
        source: NewsSource(
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

  NewsEntity mapNewsTableDataToNewsEntity(NewsTableData newsTableData) =>
      NewsEntity(
          source: NewsSource(
            id: newsTableData.sourceId,
            name: newsTableData.sourceName,
          ),
          author: newsTableData.author,
          title: newsTableData.title,
          url: newsTableData.url,
          urlToImage: newsTableData.urlToImage,
          publishedAt: newsTableData.publishedAt,
          isBookMarked: newsTableData.isBookmarked);

  NewsTableData mapNewsEntityToNewsTableData(NewsEntity newsEntity) =>
      NewsTableData(
        sourceId: newsEntity.source!.id!,
        sourceName: newsEntity.source!.name!,
        author: newsEntity.author!,
        title: newsEntity.title!,
        url: newsEntity.url!,
        urlToImage: newsEntity.urlToImage!,
        publishedAt: newsEntity.publishedAt!,
        description: newsEntity.description!,
        content: newsEntity.content!,
        isBookmarked: newsEntity.isBookMarked,
      );
}
