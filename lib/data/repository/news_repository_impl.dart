import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news_app/data/datasource/remote/news_datasource.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/utils/failure/exception.dart';
import 'package:news_app/utils/failure/failure.dart';
import 'package:news_app/utils/strings/error_strings.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsDataSource newsDataSource;
  final NewsMapper newsMapper;

  NewsRepositoryImpl({
    required this.newsDataSource,
    required this.newsMapper,
  });

  @override
  Future<Either<Failure, List<NewsEntity>>> getListNews() async {
    try {
      final result = await newsDataSource.getListNews();
      return Right(
        result.articles!
            .map(
              (model) => newsMapper.mapNewsDataModelToNewsEntity(
                model,
              ),
            )
            .toList(),
      );
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(
        ConnectionFailure(
          ErrorStrings.connectionFailure,
        ),
      );
    }
  }
}
