import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/usecases/get_list_news_use_case.dart';
import 'package:news_app/presentation/bloc/news_list/news_list_event.dart';
import 'package:news_app/presentation/bloc/news_list/news_list_state.dart';
import 'package:news_app/utils/usecase/usecase.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final GetListNewsUseCase getListNewsUseCase;

  NewsListBloc({
    required this.getListNewsUseCase,
  }) : super(NewsListEmpty()) {
    on<LoadNewsList>(
      (_, emit) async {
        emit(NewsListLoading());
        final result = await getListNewsUseCase.call(const NoParams());

        result.fold(
          (failure) => emit(
            NewsListError(
              failure.toString(),
            ),
          ),
          (result) {
            if (result != null) {
              emit(
                NewsListHasData(
                  result,
                ),
              );
            } else {
              emit(
                NewsListEmpty(),
              );
            }
          },
        );
      },
    );
  }
}
