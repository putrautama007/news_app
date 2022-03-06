import 'package:local_database/database/database.dart';
import 'package:local_database/database/table/news_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'news_dao.g.dart';

@UseDao(tables: [NewsTable])
class NewsDao extends DatabaseAccessor<AppDatabase> with _$NewsDaoMixin {
  NewsDao(AppDatabase db) : super(db);

  Future insertNews(NewsTableData data) =>
      into(newsTable).insert(data, mode: InsertMode.insertOrReplace);

  Future<List<NewsTableData>> getAllNews() => select(newsTable).get();

  Future deleteNews(NewsTableData data) => delete(newsTable).delete(data);

  Future<NewsTableData> getBookmarkedByUrl(String url) =>
      (select(newsTable)..where((tbl) => tbl.url.equals(url))).getSingle();
}