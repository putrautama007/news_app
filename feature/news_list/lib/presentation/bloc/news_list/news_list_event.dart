import 'package:equatable/equatable.dart';

abstract class NewsListEvent extends Equatable {
  const NewsListEvent();

  @override
  List<Object> get props => [];
}

class LoadNewsList extends NewsListEvent {
  const LoadNewsList();

  @override
  List<Object> get props => [];
}
