import 'package:flutter/material.dart';
import 'package:store/widgets/Category/category_item_grid.dart';
import 'package:store/widgets/basket/basket_contain.dart';

import 'package:store/widgets/common/appbar_widget.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Scaffold permet d'architecturer l'application
        body : définir le contenu principal de l'écran
        AppBar : barre de navigation
        Drawer : menu coulissant
        FloatingButton : bouton flottant…
    */
    return const Scaffold(
      appBar: AppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BasketContain(),
          ],
        ),
      ),
    );
  }
}
