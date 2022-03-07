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
        final result = await saveNewsUseCase.call(event.newsEntity);

        result.fold(
          (_) => emit(ErrorBookmarkState()),
          (_) => emit(RemoveBookmarkState()),
        );
      },
    );

    on<RemoveBookmarkNews>(
      (event, emit) async {
        emit(LoadingBookmarkState());
        final result = await deleteNewsUseCase.call(event.newsEntity);

        result.fold(
          (_) => emit(ErrorBookmarkState()),
          (_) => emit(AddBookmarkState()),
        );
      },
    );
  }
}
