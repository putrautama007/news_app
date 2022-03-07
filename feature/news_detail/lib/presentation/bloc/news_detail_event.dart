import 'package:news/domain/entity/news_entity.dart';
import 'package:shared_library/equatable/equatable.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object> get props => [];
}

class CheckBookmarkNewsStatus extends NewsDetailEvent {
  final String url;

  const CheckBookmarkNewsStatus({required this.url});

  @override
  List<Object> get props => [url];
}

class AddBookmarkNews extends NewsDetailEvent {
  final NewsEntity newsEntity;

  const AddBookmarkNews({required this.newsEntity});

  @override
  List<Object> get props => [newsEntity];
}

class RemoveBookmarkNews extends NewsDetailEvent {
  final NewsEntity newsEntity;

  const RemoveBookmarkNews({required this.newsEntity});

  @override
  List<Object> get props => [newsEntity];
}
