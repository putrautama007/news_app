import 'package:dartz/dartz.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:shared_library/equatable/equatable.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

class GetBookmarkedNewsByUrlUseCase
    extends UseCase<NewsEntity, GetBookmarkedNewsByUrlParams> {
  final NewsRepository newsRepository;

  GetBookmarkedNewsByUrlUseCase({
    required this.newsRepository,
  });

  @override
  Future<Either<Failure, NewsEntity>> call(
          GetBookmarkedNewsByUrlParams params) async =>
      newsRepository.getBookmarkedByUrl(params.url);
}

class GetBookmarkedNewsByUrlParams extends Equatable {
  final String url;

  const GetBookmarkedNewsByUrlParams({
    required this.url,
  });

  @override
  List<Object?> get props => [url];
}
