import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
  on<HomeProductWhistlistButtonNavigateEvent>(homeProductWhistlistButtonNavigateEvent);
  on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

  }

  FutureOr<void> homeProductWhistlistButtonNavigateEvent(HomeProductWhistlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWhistlistPageActionState());
    print("WHit;istclicked");
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
    print("Cart Clicked");

  }
}
