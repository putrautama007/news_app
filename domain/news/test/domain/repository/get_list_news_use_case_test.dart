import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:news/domain/usecases/get_list_news_use_case.dart';
import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

void main() => testGetListNewsUseCase();

class MockNewsRepository extends Mock implements NewsRepository {}

void testGetListNewsUseCase() {
  late final NewsRepository _mockNewsRepository;
  late final GetListNewsUseCase _getListNewsUseCase;

  setUpAll(() {
    _mockNewsRepository = MockNewsRepository();
    _getListNewsUseCase =
        GetListNewsUseCase(newsRepository: _mockNewsRepository);
  });

  group("Get List News Use Case", () {
    test('''Success \t
    GIVEN Right<List<NewsEntity> from NewsRepository
    WHEN call method executed
    THEN return Right<List<NewsEntity>
    ''', () async {
      /// GIVEN
      when(() => _mockNewsRepository.getListNews()).thenAnswer(
        (_) async => const Right([]),
      );

      /// WHEN
      final result = await _getListNewsUseCase.call(
        const NoParams(),
      );

      /// THEN
      expect(result, isA<Right>());
    });

    test('''Failed \t
    GIVEN Left<Failure> from chapterRepository
    WHEN call method executed
    THEN return Left<Failure>
    ''', () async {
      /// GIVEN
      when(() => _mockNewsRepository.getListNews()).thenAnswer(
        (_) async => const Left(
          ServerFailure(''),
        ),
      );

      /// WHEN
      final result = await _getListNewsUseCase.call(
        const NoParams(),
      );

      /// THEN
      expect(result, isA<Left>());
    });
  });
}
