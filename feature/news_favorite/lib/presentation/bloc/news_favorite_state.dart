import 'package:equatable/equatable.dart';
import 'package:news/domain/entity/news_entity.dart';

abstract class NewsFavoriteState extends Equatable {
  const NewsFavoriteState();

  @override
  List<Object> get props => [];
}

class NewsFavoriteEmpty extends NewsFavoriteState {}

class NewsFavoriteLoading extends NewsFavoriteState {}

class NewsFavoriteError extends NewsFavoriteState {
  final String message;

  const NewsFavoriteError(this.message);

  @override
  List<Object> get props => [message];
}

class NewsFavoriteHasData extends NewsFavoriteState {
  final List<NewsEntity> result;

  const NewsFavoriteHasData(this.result);

  @override
  List<Object> get props => [result];
}
