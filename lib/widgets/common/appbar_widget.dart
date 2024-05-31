import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/models/product.dart';
import 'package:store/providers/bakset_provider.dart';
import 'package:store/providers/category_provider.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? category;
  final int? lengthProduct;
  const AppbarWidget({super.key, this.category, this.lengthProduct});

  @override
  Widget build(BuildContext context) {
    List<Product>? products = context.watch<BasketProvider>().products;
    int lengthProduct = products.length;
    return AppBar(
      /*
          title: texte, ou icône, ou image
          centerTitle: centrer le titre
          leading: regroupement de widgets à gauche de la barre de navigation
          actions: regroupement de widgets à droite de la barre de navigation…
      */
      title: const Text(
        'Store',
        style: TextStyle(
            color: Colors.indigoAccent,
            fontSize: 35,
            fontFamily: 'SpaceGrotesk'),
      ),
      actions: [
        IconButton(
            tooltip: "Basket",
            onPressed: () {
              context.pushNamed('basket-product');
            },
            icon: Badge(
              isLabelVisible: true,
              label: Text(lengthProduct.toString()),
              offset: const Offset(8, 8),
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Icon(
                Icons.shopping_cart,
                size: 25,
              ),
            )),
      ],
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: Colors.red, // Change this color to whatever you like
      ),
    );
  }

  // permet de définir la hauteur de la barre de navigation
  @override
  Size get preferredSize => const Size.fromHeight(55);
}
