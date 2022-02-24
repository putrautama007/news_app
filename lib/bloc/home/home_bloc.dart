import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home/home_event.dart';

class HomeBloc extends Bloc<HomeEvent, int> {
  HomeBloc({
    required int initialState,
  }) : super(initialState) {
    on<ChangeTabEvent>(
      (event, emit) => emit(
        event.state,
      ),
    );
  }
}
