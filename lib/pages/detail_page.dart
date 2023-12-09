import 'package:flutter/material.dart';
import 'package:responsi/models/detail_model.dart';
import 'package:responsi/providers/api_resource.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.idMeal});
  final String idMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Detail"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: ApiResource.instance.getDetails(idMeal),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Terjadi Kesalahan");
                }
                if (snapshot.hasData) {
                  DetailModel meals = DetailModel.fromJson(snapshot.data!);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: meals.meals!.length,
                    itemBuilder: (context, index) {
                      var meal = meals.meals![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.network(
                                  "${meal.strMealThumb}",
                                  width: 300,
                                ),
                                Text(
                                  "${meal.strMeal}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("Category: ${meal.strCategory}"),
                                    Text("Area: ${meal.strArea}"),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                const Text(
                                  "Instructions",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text("${meal.strInstructions}"),
                              ],
                            )),
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
