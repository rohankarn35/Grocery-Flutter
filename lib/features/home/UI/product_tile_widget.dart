// ignore_for_file: unnecessary_const


import 'package:flutter/material.dart';

import 'package:flutterbloc_shopping/features/home/bloc/home_bloc.dart';
import 'package:flutterbloc_shopping/features/home/model/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;
  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(product.description),
              Text("Rs. ${product.price.toString()}"),
            ],
          ),
          Positioned(
            right: 0,
            child: Row(children: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeProductWhistlistButtonClickedEvent(
                        clickedProduct: product));
                  },
                  icon: const Icon(
                    Icons.favorite,
                    size: 20,
                  )),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {
                    homeBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: product));
                  },
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 20,
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
