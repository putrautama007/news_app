import 'package:dartz/dartz.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:shared_library/failure/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getListNews();

  Future<Either<Failure, bool>> insertNews(NewsEntity entity);

  Future<Either<Failure, bool>> deleteNews(NewsEntity entity);

  Future<Either<Failure, List<NewsEntity>>> getAllBookMarkNews();

  Future<Either<Failure, NewsEntity>> getBookmarkedByUrl(String url);
}
