import 'package:news_app/data/model/news_data.dart';
import 'package:news_app/router/news_routes.dart';
import 'package:news_app/utils/navigation/navigation_helper.dart';

abstract class NewsRouter {
  void navigateToDetailNews({
    required Article article,
  });
}

class NewsRouterImpl extends NewsRouter {
  final NavigationHelper navigationHelper;

  NewsRouterImpl({
    required this.navigationHelper,
  });

  @override
  void navigateToDetailNews({required Article article}) =>
      navigationHelper.pushNamed(
        NewsRoutes.detailNews,
        arguments: article,
      );
}
