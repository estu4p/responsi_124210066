import 'package:responsi/providers/base_network.dart';

class ApiResource {
  static ApiResource instance = ApiResource();

  Future<Map<String, dynamic>> getCategories() {
    return BaseNetwork.get("categories.php");
  }

  Future<Map<String, dynamic>> getMeals(String category) {
    return BaseNetwork.get("filter.php?c=$category");
  }

  Future<Map<String, dynamic>> getDetails(String id) {
    return BaseNetwork.get("lookup.php?i=$id");
  }
}
