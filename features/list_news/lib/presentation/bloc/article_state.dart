import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';

abstract class ResultState extends Equatable {
  const ResultState();
}

class Initial extends ResultState {
  @override
  List<Object> get props => [];
}

class Loading extends ResultState {
  @override
  List<Object> get props => [];
}

class NoData extends ResultState {
  final String message;

  NoData({@required this.message});

  @override
  List<Object> get props => [message];
}

class HasData extends ResultState {
  final ArticleResult data;

  HasData({@required this.data});

  @override
  List<Object> get props => [data];
}

class NoInternetConnection extends ResultState {
  final String message;

  NoInternetConnection({@required this.message});

  @override
  List<Object> get props => [message];
}

class Error extends ResultState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
