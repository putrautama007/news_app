import 'package:local_database/database/database.dart';
import 'package:shared_library/failure/exception.dart';

class NewsLocalDataSource {
  final AppDatabase appDatabase;

  NewsLocalDataSource({
    required this.appDatabase,
  });

  Future<void> insertNews(NewsTableData data) async {
    try {
      await appDatabase.newsDao.insertNews(data);
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }

  Future<void> deleteNews(NewsTableData data) async {
    try {
      await appDatabase.newsDao.deleteNews(data);
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }

  Future<List<NewsTableData>> getAllBookMarkNews() async {
    try {
      final result = await appDatabase.newsDao.getAllNews();
      return result;
    } catch (error) {
      throw DatabaseException(error.toString());
    }
  }
}
