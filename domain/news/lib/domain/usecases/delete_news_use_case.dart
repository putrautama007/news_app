import 'package:dartz/dartz.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:shared_library/failure/failure.dart';
import 'package:shared_library/usecase/usecase.dart';

class DeleteNewsUseCase extends UseCase<bool, NewsEntity> {
  final NewsRepository newsRepository;

  DeleteNewsUseCase({
    required this.newsRepository,
  });

  @override
  Future<Either<Failure, bool>> call(NewsEntity params) async =>
      newsRepository.deleteNews(params);
}
