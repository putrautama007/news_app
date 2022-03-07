import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:news/data/datasource/local/news_local_datasource.dart';
import 'package:news/data/datasource/remote/news_remote_datasource.dart';
import 'package:news/data/mapper/news_mapper.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:resources/resources.dart';
import 'package:shared_library/failure/exception.dart';
import 'package:shared_library/failure/failure.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  final NewsMapper newsMapper;
  final NewsLocalDataSource newsLocalDataSource;

  NewsRepositoryImpl({
    required this.newsRemoteDataSource,
    required this.newsMapper,
    required this.newsLocalDataSource,
  });

  @override
  Future<Either<Failure, List<NewsEntity>>> getListNews() async {
    try {
      final result = await newsRemoteDataSource.getListNews();
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

  @override
  Future<Either<Failure, bool>> deleteNews(NewsEntity entity) async {
    try {
      await newsLocalDataSource.deleteNews(
        newsMapper.mapNewsEntityToNewsTableData(entity),
      );
      return const Right(true);
    } on ServerException {
      return const Left(LocalDataBaseFailure('Failed to delete news'));
    }
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> getAllBookMarkNews() async {
    try {
      final result = await newsLocalDataSource.getAllBookMarkNews();
      return Right(
        result
            .map(
              (model) => newsMapper.mapNewsTableDataToNewsEntity(
                model,
              ),
            )
            .toList(),
      );
    } on ServerException {
      return const Left(LocalDataBaseFailure('Failed to load news'));
    }
  }

  @override
  Future<Either<Failure, bool>> insertNews(NewsEntity entity) async {
    try {
      await newsLocalDataSource.insertNews(
        newsMapper.mapNewsEntityToNewsTableData(entity),
      );
      return const Right(true);
    } on ServerException {
      return const Left(LocalDataBaseFailure('Failed to save news'));
    }
  }

  @override
  Future<Either<Failure, NewsEntity>> getBookmarkedByUrl(String url) async {
    try {
      final result = await newsLocalDataSource.getBookmarkedByUrl(
        url,
      );
      return Right(newsMapper.mapNewsTableDataToNewsEntity(result));
    } on DatabaseException {
      return const Left(
        LocalDataBaseFailure('Failed to get news'),
      );
    }
  }
}
