import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/presentation/bloc/home/home_bloc.dart';
import 'package:home/presentation/bloc/home/home_event.dart';

void main() => testHomeBloc();

void testHomeBloc() {
  group('HomeBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => HomeBloc(initialState: 0),
      expect: () => [],
    );

    blocTest(
      'emits [1] when ChangeTabEvent is added',
      build: () => HomeBloc(initialState: 0),
      act: (HomeBloc bloc) => bloc.add(ChangeTabEvent(state: 1)),
      expect: () => [1],
    );
  });
}
