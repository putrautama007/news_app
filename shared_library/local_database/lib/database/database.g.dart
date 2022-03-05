// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NewsTableData extends DataClass implements Insertable<NewsTableData> {
  final String url;
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String content;
  final String sourceId;
  final String sourceName;
  final bool isBookmarked;
  final DateTime publishedAt;
  NewsTableData(
      {required this.url,
      required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.content,
      required this.sourceId,
      required this.sourceName,
      required this.isBookmarked,
      required this.publishedAt});
  factory NewsTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsTableData(
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      urlToImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url_to_image'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      sourceId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source_id'])!,
      sourceName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source_name'])!,
      isBookmarked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_bookmarked'])!,
      publishedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['url'] = Variable<String>(url);
    map['author'] = Variable<String>(author);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url_to_image'] = Variable<String>(urlToImage);
    map['content'] = Variable<String>(content);
    map['source_id'] = Variable<String>(sourceId);
    map['source_name'] = Variable<String>(sourceName);
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    map['published_at'] = Variable<DateTime>(publishedAt);
    return map;
  }

  NewsTableCompanion toCompanion(bool nullToAbsent) {
    return NewsTableCompanion(
      url: Value(url),
      author: Value(author),
      title: Value(title),
      description: Value(description),
      urlToImage: Value(urlToImage),
      content: Value(content),
      sourceId: Value(sourceId),
      sourceName: Value(sourceName),
      isBookmarked: Value(isBookmarked),
      publishedAt: Value(publishedAt),
    );
  }

  factory NewsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NewsTableData(
      url: serializer.fromJson<String>(json['url']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      content: serializer.fromJson<String>(json['content']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'url': serializer.toJson<String>(url),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'content': serializer.toJson<String>(content),
      'sourceId': serializer.toJson<String>(sourceId),
      'sourceName': serializer.toJson<String>(sourceName),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
    };
  }

  NewsTableData copyWith(
          {String? url,
          String? author,
          String? title,
          String? description,
          String? urlToImage,
          String? content,
          String? sourceId,
          String? sourceName,
          bool? isBookmarked,
          DateTime? publishedAt}) =>
      NewsTableData(
        url: url ?? this.url,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        urlToImage: urlToImage ?? this.urlToImage,
        content: content ?? this.content,
        sourceId: sourceId ?? this.sourceId,
        sourceName: sourceName ?? this.sourceName,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        publishedAt: publishedAt ?? this.publishedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NewsTableData(')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('content: $content, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(url, author, title, description, urlToImage,
      content, sourceId, sourceName, isBookmarked, publishedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsTableData &&
          other.url == this.url &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.urlToImage == this.urlToImage &&
          other.content == this.content &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.isBookmarked == this.isBookmarked &&
          other.publishedAt == this.publishedAt);
}

class NewsTableCompanion extends UpdateCompanion<NewsTableData> {
  final Value<String> url;
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> urlToImage;
  final Value<String> content;
  final Value<String> sourceId;
  final Value<String> sourceName;
  final Value<bool> isBookmarked;
  final Value<DateTime> publishedAt;
  const NewsTableCompanion({
    this.url = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.content = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.publishedAt = const Value.absent(),
  });
  NewsTableCompanion.insert({
    required String url,
    required String author,
    required String title,
    required String description,
    required String urlToImage,
    required String content,
    required String sourceId,
    required String sourceName,
    required bool isBookmarked,
    required DateTime publishedAt,
  })  : url = Value(url),
        author = Value(author),
        title = Value(title),
        description = Value(description),
        urlToImage = Value(urlToImage),
        content = Value(content),
        sourceId = Value(sourceId),
        sourceName = Value(sourceName),
        isBookmarked = Value(isBookmarked),
        publishedAt = Value(publishedAt);
  static Insertable<NewsTableData> custom({
    Expression<String>? url,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? urlToImage,
    Expression<String>? content,
    Expression<String>? sourceId,
    Expression<String>? sourceName,
    Expression<bool>? isBookmarked,
    Expression<DateTime>? publishedAt,
  }) {
    return RawValuesInsertable({
      if (url != null) 'url': url,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (content != null) 'content': content,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (publishedAt != null) 'published_at': publishedAt,
    });
  }

  NewsTableCompanion copyWith(
      {Value<String>? url,
      Value<String>? author,
      Value<String>? title,
      Value<String>? description,
      Value<String>? urlToImage,
      Value<String>? content,
      Value<String>? sourceId,
      Value<String>? sourceName,
      Value<bool>? isBookmarked,
      Value<DateTime>? publishedAt}) {
    return NewsTableCompanion(
      url: url ?? this.url,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      urlToImage: urlToImage ?? this.urlToImage,
      content: content ?? this.content,
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsTableCompanion(')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('content: $content, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('publishedAt: $publishedAt')
          ..write(')'))
        .toString();
  }
}

class $NewsTableTable extends NewsTable
    with TableInfo<$NewsTableTable, NewsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String?> urlToImage = GeneratedColumn<String?>(
      'url_to_image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sourceIdMeta = const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<String?> sourceId = GeneratedColumn<String?>(
      'source_id', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _sourceNameMeta = const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String?> sourceName = GeneratedColumn<String?>(
      'source_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _isBookmarkedMeta =
      const VerificationMeta('isBookmarked');
  @override
  late final GeneratedColumn<bool?> isBookmarked = GeneratedColumn<bool?>(
      'is_bookmarked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_bookmarked IN (0, 1))');
  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<DateTime?> publishedAt =
      GeneratedColumn<DateTime?>('published_at', aliasedName, false,
          type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        url,
        author,
        title,
        description,
        urlToImage,
        content,
        sourceId,
        sourceName,
        isBookmarked,
        publishedAt
      ];
  @override
  String get aliasedName => _alias ?? 'news_table';
  @override
  String get actualTableName => 'news_table';
  @override
  VerificationContext validateIntegrity(Insertable<NewsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    if (data.containsKey('source_name')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['source_name']!, _sourceNameMeta));
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
          _isBookmarkedMeta,
          isBookmarked.isAcceptableOrUnknown(
              data['is_bookmarked']!, _isBookmarkedMeta));
    } else if (isInserting) {
      context.missing(_isBookmarkedMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {url};
  @override
  NewsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsTableData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsTableTable createAlias(String alias) {
    return $NewsTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NewsTableTable newsTable = $NewsTableTable(this);
  late final NewsDao newsDao = NewsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [newsTable];
}
