import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/bloc/home/home_bloc.dart';
import 'package:news_app/data/model/news_data.dart';
import 'package:news_app/router/news_routes.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:news_app/utils/navigation/navigation_helper.dart';

import 'ui/detail_news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
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
        home: BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(
            initialState: 0,
          ),
          child: const HomePage(),
        ),
        navigatorKey: NavigationHelperImpl.navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case NewsRoutes.home:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case NewsRoutes.detailNews:
              final article = settings.arguments as Article;
              return MaterialPageRoute(
                builder: (_) => DetailNewsPage(article: article),
                settings: settings,
              );
            default:
              return MaterialPageRoute(builder: (_) => const HomePage());
          }
        },
      ),
    );
  }
}
