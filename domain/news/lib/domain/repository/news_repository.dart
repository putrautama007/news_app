import 'package:dartz/dartz.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:shared_library/failure/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getListNews();
}
