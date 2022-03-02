import 'package:news/data/datasource/remote/news_datasource.dart';
import 'package:news/data/mapper/news_mapper.dart';
import 'package:news/data/repository/news_repository_impl.dart';
import 'package:news/domain/repository/news_repository.dart';
import 'package:news/domain/usecases/get_list_news_use_case.dart';
import 'package:shared_library/di/di.dart';

class NewsDependency{
  NewsDependency(){
    _dataSource();
    _repository();
    _mapper();
    _useCase();
  }

  void _dataSource() => locator.registerLazySingleton<NewsDataSource>(
        () => NewsDataSource(
      apiHelper: locator(),
    ),
  );

  void _repository() => locator.registerLazySingleton<NewsRepository>(
        () => NewsRepositoryImpl(
      newsMapper: locator(),
      newsDataSource: locator(),
    ),
  );

  void _mapper() => locator.registerLazySingleton<NewsMapper>(
        () => NewsMapper(),
  );

  void _useCase() => locator.registerLazySingleton<GetListNewsUseCase>(
        () => GetListNewsUseCase(
      newsRepository: locator(),
    ),
  );

}