import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class ChangeTabEvent extends HomeEvent {
  final int state;

  ChangeTabEvent({
    required this.state,
  });

  @override
  List<Object?> get props => [state];
}
