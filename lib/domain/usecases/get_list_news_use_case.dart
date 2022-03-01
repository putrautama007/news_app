import 'package:dartz/dartz.dart';
import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/utils/failure/failure.dart';
import 'package:news_app/utils/usecase/usecase.dart';

class GetListNewsUseCase extends UseCase<List<NewsEntity>?, NoParams> {
  final NewsRepository newsRepository;

  GetListNewsUseCase({
    required this.newsRepository,
  });

  @override
  Future<Either<Failure, List<NewsEntity>?>> call(NoParams params) async =>
      newsRepository.getListNews();
}
