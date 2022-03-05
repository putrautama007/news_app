import 'package:moor_flutter/moor_flutter.dart';

class NewsTable extends Table {
  TextColumn get url => text()();

  TextColumn get author => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get urlToImage => text()();

  TextColumn get content => text()();

  TextColumn get sourceId => text()();

  TextColumn get sourceName => text()();

  BoolColumn get isBookmarked => boolean()();

  DateTimeColumn get publishedAt => dateTime()();

  @override
  Set<Column>? get primaryKey => {url};
}
