import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news/data/datasource/remote/news_datasource.dart';
import 'package:news/data/mapper/news_mapper.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:resources/resources.dart';
import 'package:shared_library/failure/exception.dart';
import 'package:shared_library/failure/failure.dart';

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
              (model) => newsMapper.mapNewsEntityToNewsDataModel(
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
