import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/bloc/home/home_event.dart';

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
