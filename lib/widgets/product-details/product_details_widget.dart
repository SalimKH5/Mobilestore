import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/bakset_provider.dart';
import 'package:store/providers/product_provider.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch (getter): Access the product stored in ProductProvider
    Product? product = context.watch<ProductProvider>().product;

    return Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                product!.image,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          product.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        Text(
          '${product.price.toStringAsFixed(2)}€',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        RatingStars(
          value: product.rating['rate'],
        ),
        TextButton(
          onPressed: () {
            // Act when the button is pressed
            context.read<BasketProvider>().product = product;
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: const Text(
              'Add to cart',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
