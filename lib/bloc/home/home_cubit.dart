import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const InitialTabState(tabState: 0));

  void changeTab({required int tabIndex}) => emit(
        ChangeTabState(
          tabState: tabIndex,
        ),
      );
}
