import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  final int state;

  const HomeState({
    required this.state,
  });
}

class InitialTabState extends HomeState {
  final int tabState;

  const InitialTabState({
    required this.tabState,
  }) : super(state: tabState);

  @override
  List<Object?> get props => [tabState];
}

class ChangeTabState extends HomeState {
  final int tabState;

  const ChangeTabState({
    required this.tabState,
  }) : super(state: tabState);

  @override
  List<Object?> get props => [tabState];
}
