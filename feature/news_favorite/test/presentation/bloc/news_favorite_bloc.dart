import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/usecases/get_bookmark_news_use_case.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_bloc.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_event.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_state.dart';
import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

void main() => testNewsFavoriteBloc();

class MockGetBookmarkNewsUseCase extends Mock
    implements GetBookmarkNewsUseCase {}

void testNewsFavoriteBloc() {
  late final GetBookmarkNewsUseCase _mockGetBookmarkNewsUseCase;

  setUpAll(() {
    _mockGetBookmarkNewsUseCase = MockGetBookmarkNewsUseCase();
  });

  group('NewsFavoriteBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () =>
          NewsFavoriteBloc(getBookmarkNewsUseCase: _mockGetBookmarkNewsUseCase),
      expect: () => [],
    );

    blocTest(
      'emits [NewsFavoriteLoading and NewsFavoriteHasData] when LoadNewsFavorite is added',
      build: () {
        when(
          () => _mockGetBookmarkNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Right([NewsEntity()]));
        return NewsFavoriteBloc(
            getBookmarkNewsUseCase: _mockGetBookmarkNewsUseCase);
      },
      act: (NewsFavoriteBloc bloc) => bloc.add(const LoadNewsFavorite()),
      expect: () => [
        isA<NewsFavoriteLoading>(),
        isA<NewsFavoriteHasData>(),
      ],
    );

    blocTest(
      'emits [NewsFavoriteLoading and NewsFavoriteEmpty] when LoadNewsList is added',
      build: () {
        when(
          () => _mockGetBookmarkNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Right([]));
        return NewsFavoriteBloc(
            getBookmarkNewsUseCase: _mockGetBookmarkNewsUseCase);
      },
      act: (NewsFavoriteBloc bloc) => bloc.add(const LoadNewsFavorite()),
      expect: () => [
        isA<NewsFavoriteLoading>(),
        isA<NewsFavoriteEmpty>(),
      ],
    );

    blocTest(
      'emits [NewsFavoriteLoading and NewsFavoriteError] when LoadNewsList is added',
      build: () {
        when(
          () => _mockGetBookmarkNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Left(LocalDataBaseFailure('')));
        return NewsFavoriteBloc(
            getBookmarkNewsUseCase: _mockGetBookmarkNewsUseCase);
      },
      act: (NewsFavoriteBloc bloc) => bloc.add(const LoadNewsFavorite()),
      expect: () => [
        isA<NewsFavoriteLoading>(),
        isA<NewsFavoriteError>(),
      ],
    );
  });
}
