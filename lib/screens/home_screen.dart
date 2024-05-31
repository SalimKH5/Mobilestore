import 'package:flutter/material.dart';
import 'package:store/widgets/home/ads_widget.dart';
import 'package:store/widgets/common/Drawer_widget.dart';
import 'package:store/widgets/home/product_grid_widget.dart';
import 'package:store/widgets/common/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            AdsWidget(),
            ProductsGridWidget(),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
