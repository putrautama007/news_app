import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/datasource/remote/news_datasource.dart';
import 'package:news_app/data/mapper/news_mapper.dart';
import 'package:news_app/data/repository/news_repository_impl.dart';
import 'package:news_app/domain/repository/news_repository.dart';
import 'package:news_app/domain/usecases/get_list_news_use_case.dart';
import 'package:news_app/utils/network/api_helper.dart';
import 'package:news_app/utils/network/api_helper_impl.dart';

final locator = GetIt.instance;

void initDependency() {
  _library();
  _service();
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

void _service() => locator.registerLazySingleton<ApiHelper>(
      () => ApiHelperImpl(
        dio: locator(),
      ),
    );

void _library() => locator.registerLazySingleton<Dio>(
      () => Dio(),
    );
