import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/utils/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<NewsEntity>>> getListNews();
}
