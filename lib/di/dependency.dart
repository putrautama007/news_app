import 'package:local_database/di/dependency.dart';
import 'package:navigation/di/dependency.dart';
import 'package:network/di/dependency.dart';
import 'package:news/di/dependency.dart';

class Dependency{
  void initDependency() {
    _registerDomain();
    _registerSharedLibrary();
  }

  void _registerDomain() => NewsDependency();

  void _registerSharedLibrary(){
    NetworkDependency();
    NavigationDependency();
    LocalDatabaseDependency();
  }
}
