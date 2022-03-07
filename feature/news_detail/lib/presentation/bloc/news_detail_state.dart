import 'package:shared_library/equatable/equatable.dart';

abstract class NewsDetailState extends Equatable {
  const NewsDetailState();

  @override
  List<Object> get props => [];
}

class InitialBookmarkState extends NewsDetailState {}

class LoadingBookmarkState extends NewsDetailState {}

class AddBookmarkState extends NewsDetailState {}

class RemoveBookmarkState extends NewsDetailState {}

class ErrorBookmarkState extends NewsDetailState {}
