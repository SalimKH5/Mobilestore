import 'package:go_router/go_router.dart';
import 'package:store/screens/basket_screen.dart';
import 'package:store/screens/category_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/product_details_screen.dart';

class RouterService {
  static GoRouter getRouter() {
    return GoRouter(routes: [
      GoRoute(
          path: "/",
          name: "home",
          builder: (context, state) => const HomeScreen()),
      GoRoute(
          path: "/product-details",
          name: "product-details",
          builder: (context, state) => const ProductDetailsScreen()),
      GoRoute(
          path: "/category-details",
          name: "category-details",
          builder: (context, state) => const CategoryScreen()),
      GoRoute(
          path: "/basket-product",
          name: "basket-product",
          builder: (context, state) => const BasketScreen())
    ]);
  }
}
