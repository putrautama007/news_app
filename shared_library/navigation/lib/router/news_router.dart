import 'package:navigation/navigation/navigation_helper.dart';
import 'package:navigation/router/news_routes.dart';
import 'package:news/domain/entity/news_entity.dart';

abstract class NewsRouter {
  void navigateToDetailNews({
    required NewsEntity newsEntity,
  });
}

class NewsRouterImpl extends NewsRouter {
  final NavigationHelper navigationHelper;

  NewsRouterImpl({
    required this.navigationHelper,
  });

  @override
  void navigateToDetailNews({
    required NewsEntity newsEntity,
  }) =>
      navigationHelper.pushNamed(
        NewsRoutes.detailNews,
        arguments: newsEntity,
      );
}
