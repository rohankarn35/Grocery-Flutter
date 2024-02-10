import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc_shopping/features/cart/UI/cart.dart';
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
        // TODO: implement listener
      },
      builder: (context, state) {
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
          body: const Center(
            child: Text('Home'),
          ),
        );
      },
    );
  }
}
