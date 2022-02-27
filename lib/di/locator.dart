import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/datasource/remote/news_datasource.dart';
import 'package:news_app/network/api_helper.dart';
import 'package:news_app/network/api_helper_impl.dart';

final locator = GetIt.instance;

void initDependency() {
  _library();
  _service();
  _dataSource();
}

void _dataSource() => locator.registerLazySingleton<NewsDataSource>(
      () => NewsDataSource(
        apiHelper: locator(),
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
