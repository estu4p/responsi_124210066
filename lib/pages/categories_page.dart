import 'package:flutter/material.dart';
import 'package:responsi/models/categories_model.dart';
import 'package:responsi/pages/meals_page.dart';
import 'package:responsi/providers/api_resource.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Categories"),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FutureBuilder(
              future: ApiResource.instance.getCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Terjadi Kesalahan");
                }
                if (snapshot.hasData) {
                  CategoriesModel categories =
                      CategoriesModel.fromJson(snapshot.data!);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: categories.category!.length,
                    itemBuilder: (context, index) {
                      var cate = categories.category![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MealsPage(
                                  category: cate.strCategory!,
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
                                  Image.network("${cate.strCategoryThumb}"),
                                  Text(
                                    "${cate.strCategory}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text("${cate.strCategoryDescription}"),
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
