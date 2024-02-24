import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_shopping/features/cart/UI/cart.dart';
import 'package:flutterbloc_shopping/features/home/UI/product_tile_widget.dart';
import 'package:flutterbloc_shopping/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc_shopping/features/whitelist/ui/whitelist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen:(previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
        }
        else if(state is HomeNavigateToWhistlistPageActionState){
          print('whitelist');
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WhitelistPage()));

        }
        else if (state is HomeProductWhitlistedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to wishlist')));
        }
        else if (state is HomeProductCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
        }
        else if (state is HomeProductCartedActionState){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
        }
     
        
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
            
           
          case HomeLoadedState:
          final sucessState = state as HomeLoadedState;
           return Scaffold(
          appBar: AppBar(
            title: const Text('Grocery'),
            actions: [
              IconButton(onPressed: () {
                homeBloc.add(HomeProductWhistlistButtonNavigateEvent());
              }, icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                homeBloc.add(HomeCartButtonNavigateEvent());

                  }, icon: const Icon(Icons.shopping_cart)),
            ],
          ),
          body: ListView.builder(
            itemCount: sucessState.products.length,
            
            itemBuilder: (context,index) {
            return ProductTileWidget(product: sucessState.products[index], homeBloc: homeBloc,);
          }),
          
        );
         
          case HomeErrorState:
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );

         
          default:
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong!'),
            ),
          );
        }
       
      },
    );
  }
}
