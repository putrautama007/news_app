import 'package:equatable/equatable.dart';
import 'package:news_app/data/model/news_data.dart';

abstract class NewsListState extends Equatable {
  const NewsListState();

  @override
  List<Object> get props => [];
}

class NewsListEmpty extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListError extends NewsListState {
  final String message;

  const NewsListError(this.message);

  @override
  List<Object> get props => [message];
}

class NewsListHasData extends NewsListState {
  final List<Article> result;

  const NewsListHasData(this.result);

  @override
  List<Object> get props => [result];
}
