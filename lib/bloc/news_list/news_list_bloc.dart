import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_list/news_list_event.dart';
import 'package:news_app/bloc/news_list/news_list_state.dart';
import 'package:news_app/data/datasource/remote/news_datasource.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final NewsDataSource newsDataSource;

  NewsListBloc({
    required this.newsDataSource,
  }) : super(NewsListEmpty()) {
    on<LoadNewsList>((_, emit) async {
      try {
        emit(NewsListLoading());
        final result = await newsDataSource.getListNews();

        if (result.articles != null) {
          emit(
            NewsListHasData(
              result.articles!,
            ),
          );
        } else {
          emit(
            NewsListEmpty(),
          );
        }
      } catch (error) {
        emit(
          NewsListError(
            error.toString(),
          ),
        );
      }
    });
  }
}
