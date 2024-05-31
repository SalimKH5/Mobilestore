import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:store/providers/category_provider.dart';
import 'package:store/services/categories_services.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoriesServices categoriesServices = CategoriesServices();
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseButton(),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: categoriesServices
                    .getCategory(), // Corrected method name to match CategoriesServices
                builder: (context, snapshot) {
                  // si les données sont accessibles
                  if (snapshot.hasData) {
                    // requireData : récupérer les données
                    List<String> data = snapshot.requireData;

                    // inspect(data);
                    return Container(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Text(
                            'Our categories',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: data.length,
                              padding: const EdgeInsets.all(8),
                              itemBuilder: (BuildContext context, int index) {
                                IconData icon;

                                if (data[index] == "electronics") {
                                  icon = Icons.devices_outlined;
                                } else if (data[index] == "jewelery") {
                                  icon = Icons
                                      .diamond_outlined; // Updated to a suitable icon for jewelry
                                } else if (data[index] == "men's clothing") {
                                  icon = Icons.person;
                                } else {
                                  icon = Icons.woman; // Default icon
                                }

                                return GestureDetector(
                                    onTap: () {
                                      // Add your action here
                                      context
                                          .read<CategoryProvider>()
                                          .category = data[index];
                                      /*
                                      naviguer vers un écran
                                        context : écran en cours d'affichage
                                    */
                                      context.pushNamed('category-details');
                                    },
                                    child: SizedBox(
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Icon(icon), // Use the determined icon
                                          const SizedBox(
                                              width:
                                                  10), // Add some spacing between the icon and the text
                                          Text(
                                            data[index],
                                            style: const TextStyle(
                                                fontSize:
                                                    16), // Customize the text style as needed
                                          ),
                                        ],
                                      ),
                                    ));
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  // si les données ne sont pas accessibles
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
