import 'package:equatable/equatable.dart';

abstract class NewsFavoriteEvent extends Equatable {
  const NewsFavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsFavorite extends NewsFavoriteEvent {
  const LoadNewsFavorite();
}
