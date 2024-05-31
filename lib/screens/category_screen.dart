import 'package:flutter/material.dart';
import 'package:store/widgets/Category/category_item_grid.dart';

import 'package:store/widgets/common/appbar_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      Scaffold permet d'architecturer l'application
        body : définir le contenu principal de l'écran
        AppBar : barre de navigation
        Drawer : menu coulissant
        FloatingButton : bouton flottant…
    */
    return Scaffold(
      appBar: const AppbarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryItemGrid(),
          ],
        ),
      ),
    );
  }
}
