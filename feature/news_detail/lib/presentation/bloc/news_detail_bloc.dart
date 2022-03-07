import 'package:news/domain/entity/news_entity.dart';
import 'package:news/domain/usecases/delete_news_use_case.dart';
import 'package:news/domain/usecases/get_bookmarked_news_by_url_use_case.dart';
import 'package:news/domain/usecases/save_news_use_case.dart';
import 'package:news_detail/presentation/bloc/news_detail_event.dart';
import 'package:news_detail/presentation/bloc/news_detail_state.dart';
import 'package:shared_library/flutter_bloc/flutter_bloc.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  final SaveNewsUseCase saveNewsUseCase;
  final DeleteNewsUseCase deleteNewsUseCase;
  final GetBookmarkedNewsByUrlUseCase getBookmarkedNewsByUrlUseCase;

  NewsDetailBloc({
    required this.saveNewsUseCase,
    required this.deleteNewsUseCase,
    required this.getBookmarkedNewsByUrlUseCase,
  }) : super(InitialBookmarkState()) {
    on<CheckBookmarkNewsStatus>(
      (event, emit) async {
        emit(LoadingBookmarkState());
        final result = await getBookmarkedNewsByUrlUseCase.call(
          GetBookmarkedNewsByUrlParams(
            url: event.url,
          ),
        );

        result.fold(
          (_) => emit(ErrorBookmarkState()),
          (result) {
            if (result.isBookMarked) {
              emit(RemoveBookmarkState());
            } else {
              emit(AddBookmarkState());
            }
          },
        );
      },
    );

    on<AddBookmarkNews>(
      (event, emit) async {
        emit(LoadingBookmarkState());
        final result = await saveNewsUseCase.call(
          NewsEntity(
            source: NewsSource(
              id: event.newsEntity.source?.id ?? "",
              name: event.newsEntity.source?.name ?? "",
            ),
            author: event.newsEntity.author ?? "",
            title: event.newsEntity.title ?? "",
            description: event.newsEntity.description ?? "",
            url: event.newsEntity.url ?? "",
            urlToImage: event.newsEntity.urlToImage ?? "",
            publishedAt: event.newsEntity.publishedAt ?? DateTime.now(),
            content: event.newsEntity.content ?? "",
            isBookMarked: true,
          ),
        );

        result.fold(
          (_) => emit(ErrorBookmarkState()),
          (_) => emit(RemoveBookmarkState()),
        );
      },
    );

    on<RemoveBookmarkNews>(
      (event, emit) async {
        emit(LoadingBookmarkState());
        final result = await deleteNewsUseCase.call(
          NewsEntity(
            source: NewsSource(
              id: event.newsEntity.source?.id ?? "",
              name: event.newsEntity.source?.name ?? "",
            ),
            author: event.newsEntity.author ?? "",
            title: event.newsEntity.title ?? "",
            description: event.newsEntity.description ?? "",
            url: event.newsEntity.url ?? "",
            urlToImage: event.newsEntity.urlToImage ?? "",
            publishedAt: event.newsEntity.publishedAt ?? DateTime.now(),
            content: event.newsEntity.content ?? "",
            isBookMarked: false,
          ),
        );

        result.fold(
          (_) => emit(ErrorBookmarkState()),
          (_) => emit(AddBookmarkState()),
        );
      },
    );
  }
}
