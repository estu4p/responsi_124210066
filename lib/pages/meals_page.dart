import 'package:flutter/material.dart';
import 'package:responsi/models/meals_models.dart';
import 'package:responsi/pages/detail_page.dart';
import 'package:responsi/providers/api_resource.dart';

class MealsPage extends StatelessWidget {
  MealsPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$category"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: ApiResource.instance.getMeals(category),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Terjadi Kesalahan");
                }
                if (snapshot.hasData) {
                  MealsModel meals = MealsModel.fromJson(snapshot.data!);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: meals.meals!.length,
                    itemBuilder: (context, index) {
                      var meal = meals.meals![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  idMeal: meal.idMeal!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.brown.shade100,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.network(
                                    "${meal.strMealThumb}",
                                    width: 150,
                                    fit: BoxFit.fill,
                                  ),
                                  Text(
                                    "${meal.strMeal}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
