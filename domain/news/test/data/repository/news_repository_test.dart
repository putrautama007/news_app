import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/data/datasource/local/news_local_datasource.dart';
import 'package:news/data/datasource/remote/news_remote_datasource.dart';
import 'package:news/data/mapper/news_mapper.dart';
import 'package:news/data/model/news_data_model.dart';
import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/failure/exception.dart';

void main() => testNewsRepositoryTest();

class MockNewsRemoteDataSource extends Mock implements NewsRemoteDataSource {}

class MockNewsLocalDataSource extends Mock implements NewsLocalDataSource {}

void testNewsRepositoryTest() {
  late final NewsRemoteDataSource _mockNewsRemoteDataSource;
  late final NewsMapper _mockNewsMapper;
  late final NewsLocalDataSource _mockNewsLocalDataSource;
  late final NewsRepository _newsRepository;

  setUpAll(() {
    _mockNewsRemoteDataSource = MockNewsRemoteDataSource();
    _mockNewsMapper = NewsMapper();
    _mockNewsLocalDataSource = MockNewsLocalDataSource();
    _newsRepository = NewsRepositoryImpl(
      newsRemoteDataSource: _mockNewsRemoteDataSource,
      newsMapper: _mockNewsMapper,
      newsLocalDataSource: _mockNewsLocalDataSource,
    );
  });

  group('News Repository Impl', () {
    test('''Success \t
    GIVEN Right<List<NewsDataModel>> from RemoteDataSource
    WHEN getListNews method executed
    THEN return Right<List<NewsEntity>>
    ''', () async {
      /// GIVEN
      when(() => _mockNewsRemoteDataSource.getListNews()).thenAnswer(
        (_) async =>
            Future.value(NewsDataModel(status: "", totalResults: 0, articles: [
          Article(
            source: Source(id: "", name: ""),
            title: "",
            description: "",
            author: "",
            publishedAt: DateTime.now(),
            urlToImage: "",
            url: "",
            content: "",
          ),
        ])),
      );

      /// WHEN
      final result = await _newsRepository.getListNews();

      /// THEN
      expect(result, isA<Right>());
    });

    test('''Fail \t
    GIVEN Right<List<NewsDataModel>> from RemoteDataSource
    WHEN getListNews method executed
    THEN return Left<Failure>
    ''', () async {
      /// GIVEN
      when(() => _mockNewsRemoteDataSource.getListNews())
          .thenThrow(ServerException());

      /// WHEN
      final result = await _newsRepository.getListNews();

      /// THEN
      expect(result, isA<Left>());
    });
  });
}
