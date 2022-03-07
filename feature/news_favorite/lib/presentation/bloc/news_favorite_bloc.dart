import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/domain/usecases/get_bookmark_news_use_case.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_event.dart';
import 'package:news_favorite/presentation/bloc/news_favorite_state.dart';
import 'package:shared_library/usecase/usecase.dart';

class NewsFavoriteBloc extends Bloc<NewsFavoriteEvent, NewsFavoriteState> {
  final GetBookmarkNewsUseCase getBookmarkNewsUseCase;

  NewsFavoriteBloc({
    required this.getBookmarkNewsUseCase,
  }) : super(NewsFavoriteEmpty()) {
    on<LoadNewsFavorite>(
      (_, emit) async {
        emit(NewsFavoriteLoading());
        final result = await getBookmarkNewsUseCase.call(const NoParams());

        result.fold(
          (failure) => emit(
            NewsFavoriteError(
              failure.toString(),
            ),
          ),
          (result) {
            if (result!.isNotEmpty) {
              emit(
                NewsFavoriteHasData(result),
              );
            } else {
              emit(NewsFavoriteEmpty());
            }
          },
        );
      },
    );
  }
}
