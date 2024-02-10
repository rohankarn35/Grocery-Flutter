part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWhistlistButtonClickedEvent extends HomeEvent {
}
class HomeProductCartButtonClickedEvent extends HomeEvent {
}
class HomeProductWhistlistButtonNavigateEvent extends HomeEvent {
}
class HomeCartButtonNavigateEvent extends HomeEvent {
}