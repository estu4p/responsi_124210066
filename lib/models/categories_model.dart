class CategoriesModel {
  final List<Categories>? category;

  CategoriesModel({this.category});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      category: (json['categories'] as List?)
          ?.map((list) => Categories.fromJson(list))
          .toList(),
    );
  }
}

class Categories {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  Categories({
    this.idCategory,
    this.strCategory,
    this.strCategoryDescription,
    this.strCategoryThumb,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      idCategory: json['idCategory'] as String?,
      strCategory: json['strCategory'] as String?,
      strCategoryDescription: json['strCategoryDescription'] as String?,
      strCategoryThumb: json['strCategoryThumb'] as String?,
    );
  }
}
