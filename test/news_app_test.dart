import '../feature/home/test/home_test.dart' as home_test;
import '../feature/news_list/test/news_list_test.dart' as news_list_test;
import '../feature/news_favorite/test/news_favorite_test.dart'
    as news_favorite_test;
import '../domain/news/test/news_test.dart' as news_test;

void main() {
  /// Feature
  home_test.main();
  news_list_test.main();
  news_favorite_test.main();

  /// Domain
  news_test.main();
}
