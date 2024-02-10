part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState{}

final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState{}

class HomeErrorState extends HomeState{}

class HomeNavigateToWhistlistPageActionState extends HomeActionState{}
class HomeNavigateToCartPageActionState extends HomeActionState{}
