import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/bakset_provider.dart';
import 'package:store/widgets/home/product_item_grid.dart';

class BasketContain extends StatelessWidget {
  const BasketContain({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product>? products = context.watch<BasketProvider>().products;
    num totalprice = context.watch<BasketProvider>().totalProduct;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text(
            'Product in basket',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              // transmettre le produit au widget enfant
              return ProductItemGrid(
                product: products[index],
              );
            },
          ),
          Row(
            children: [
              const Text(
                "Total Product",
                style: TextStyle(fontSize: 20),
              ),
              const Padding(padding: EdgeInsets.all(15)),
              Text(
                "${totalprice.toString()}\$",
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
