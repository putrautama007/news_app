import 'package:dartz/dartz.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

class GetListNewsUseCase extends UseCase<List<NewsEntity>?, NoParams> {
  final NewsRepository newsRepository;

  GetListNewsUseCase({
    required this.newsRepository,
  });

  @override
  Future<Either<Failure, List<NewsEntity>?>> call(NoParams params) async =>
      newsRepository.getListNews();
}
