class MealsModel {
  final List<Meals>? meals;

  MealsModel({this.meals});

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      meals: (json['meals'] as List?)
          ?.map((list) => Meals.fromJson(list))
          .toList(),
    );
  }
}

class Meals {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  Meals({
    this.idMeal,
    this.strMeal,
    this.strMealThumb,
  });

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      idMeal: json['idMeal'] as String?,
      strMeal: json['strMeal'] as String?,
      strMealThumb: json['strMealThumb'] as String?,
    );
  }
}
