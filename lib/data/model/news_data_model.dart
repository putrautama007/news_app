class NewsDataModel {
  NewsDataModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  factory NewsDataModel.fromJson(Map<String, dynamic> json) => NewsDataModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final  String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );
}

class Source {
  Source({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );
}
