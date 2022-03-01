import 'package:news_app/domain/entity/news_entity.dart';
import 'package:news_app/domain/router/news_routes.dart';
import 'package:news_app/utils/navigation/navigation_helper.dart';

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
