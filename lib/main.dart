import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home/presentation/bloc/home/home_bloc.dart';
import 'package:home/presentation/ui/home_page.dart';
import 'package:navigation/navigation/navigation_helper.dart';
import 'package:navigation/router/news_routes.dart';
import 'package:news/domain/entity/news_entity.dart';
import 'package:news_app/di/dependency.dart';
import 'package:news_detail/presentation/bloc/news_detail_bloc.dart';
import 'package:news_detail/presentation/bloc/news_detail_event.dart';
import 'package:news_detail/presentation/ui/detail_news_page.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_bloc.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_event.dart';
import 'package:news_list/presentation/bloc/news_list/news_list_bloc.dart';
import 'package:news_list/presentation/bloc/news_list/news_list_event.dart';
import 'package:shared_library/di/di.dart';

void main() {
  Dependency().initDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (_) => HomeBloc(
              initialState: 0,
            ),
          ),
          BlocProvider<NewsListBloc>(
            create: (_) => NewsListBloc(
              getListNewsUseCase: locator(),
            )..add(
                const LoadNewsList(),
              ),
          ),
          BlocProvider<NewsFavoriteBloc>(
            create: (_) => NewsFavoriteBloc(
              getBookmarkNewsUseCase: locator(),
            )..add(
              const LoadNewsFavorite(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
          ),
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          home: const HomePage(),
          navigatorKey: NavigationHelperImpl.navigatorKey,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case NewsRoutes.home:
                return MaterialPageRoute(builder: (_) => const HomePage());
              case NewsRoutes.detailNews:
                final newsEntity = settings.arguments as NewsEntity;
                return MaterialPageRoute(
                  builder: (_) => BlocProvider<NewsDetailBloc>(
                    create: (_) => NewsDetailBloc(
                      getBookmarkedNewsByUrlUseCase: locator(),
                      saveNewsUseCase: locator(),
                      deleteNewsUseCase: locator(),
                    )..add(
                        CheckBookmarkNewsStatus(url: newsEntity.url!),
                      ),
                    child: DetailNewsPage(newsEntity: newsEntity),
                  ),
                  settings: settings,
                );
              default:
                return MaterialPageRoute(builder: (_) => const HomePage());
            }
          },
        ),
      ),
    );
  }
}
