import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc_shopping/data/cart_items.dart';
import 'package:flutterbloc_shopping/data/grocery_data.dart';
import 'package:flutterbloc_shopping/data/whitlist_items.dart';
import 'package:flutterbloc_shopping/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWhistlistButtonNavigateEvent>(
        homeProductWhistlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<HomeProductWhistlistButtonClickedEvent>(
        homeProductWhistlistButtonClickedEvent);
        on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(HomeLoadedState(
          products: GroceryData.groceryProducts
              .map((e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']))
              .toList()));
    } catch (e) {
      emit(HomeErrorState());
    }
  }
 FutureOr<void> homeProductWhistlistButtonClickedEvent(
      HomeProductWhistlistButtonClickedEvent event, Emitter<HomeState> emit) {
        print("Added to whistlist");
        whitlistItems.add(event.clickedProduct);
    emit(HomeProductWhitlistedActionState());

      }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Added to cart");
    cartItems.add(event.clickedProduct);
    emit(HomeProductCartedActionState());
  }
  FutureOr<void> homeProductWhistlistButtonNavigateEvent(
      HomeProductWhistlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWhistlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

 
}
