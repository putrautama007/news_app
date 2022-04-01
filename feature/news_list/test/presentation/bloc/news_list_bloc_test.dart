import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news/domain/usecases/get_list_news_use_case.dart';
import 'package:news_list/presentation/bloc/news_list/news_list_bloc.dart';
import 'package:news_list/presentation/bloc/news_list/news_list_event.dart';
import 'package:news_list/presentation/bloc/news_list/news_list_state.dart';
import 'package:shared_library/dartz/dartz.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

void main() => testNewsListBloc();

class MockGetListNewsUseCase extends Mock implements GetListNewsUseCase {}

void testNewsListBloc() {
  late final GetListNewsUseCase _mockGetListNewsUseCase;

  setUpAll(() {
    _mockGetListNewsUseCase = MockGetListNewsUseCase();
  });

  group('NewsListBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => NewsListBloc(getListNewsUseCase: _mockGetListNewsUseCase),
      expect: () => [],
    );

    blocTest(
      'emits [NewsListLoading and NewsListHasData] when LoadNewsList is added',
      build: () {
        when(
          () => _mockGetListNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Right([]));
        return NewsListBloc(getListNewsUseCase: _mockGetListNewsUseCase);
      },
      act: (NewsListBloc bloc) => bloc.add(const LoadNewsList()),
      expect: () => [
        isA<NewsListLoading>(),
        isA<NewsListHasData>(),
      ],
    );

    blocTest(
      'emits [NewsListLoading and NewsListEmpty] when LoadNewsList is added',
      build: () {
        when(
          () => _mockGetListNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Right(null));
        return NewsListBloc(getListNewsUseCase: _mockGetListNewsUseCase);
      },
      act: (NewsListBloc bloc) => bloc.add(const LoadNewsList()),
      expect: () => [
        isA<NewsListLoading>(),
        isA<NewsListEmpty>(),
      ],
    );

    blocTest(
      'emits [NewsListLoading and NewsListError] when LoadNewsList is added',
      build: () {
        when(
          () => _mockGetListNewsUseCase.call(
            const NoParams(),
          ),
        ).thenAnswer((_) async => const Left(ServerFailure('')));
        return NewsListBloc(getListNewsUseCase: _mockGetListNewsUseCase);
      },
      act: (NewsListBloc bloc) => bloc.add(const LoadNewsList()),
      expect: () => [
        isA<NewsListLoading>(),
        isA<NewsListError>(),
      ],
    );
  });
}
