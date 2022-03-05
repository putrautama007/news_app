import 'package:local_database/database/database.dart';
import 'package:shared_library/di/di.dart';

class LocalDatabaseDependency {
  LocalDatabaseDependency() {
    _registerLocalDatabase();
  }

  void _registerLocalDatabase() => locator.registerLazySingleton<AppDatabase>(
        () => AppDatabase(),
      );
}
