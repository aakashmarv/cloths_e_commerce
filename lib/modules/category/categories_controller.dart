
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  CategoriesController() {
    print("🔥 CategoriesController CREATED: $hashCode");
  }
  RxInt selectedCategory = 0.obs;

  var categories = [
    {"name": "Men", "image": "assets/p2.jpg"},
    {"name": "Women", "image": "assets/p2.jpg"},
    {"name": "Kids", "image": "assets/p2.jpg"},
  ].obs;

  List<List<Map<String, dynamic>>> products = [
    [
      {"name": "Shirt", "image": "assets/images/banner2.jpg"},
      {"name": "T-shirt", "image":"assets/images/banner2.jpg"},
    ],
    [
      {"name": "Frock", "image":"assets/images/banner2.jpg"},
      {"name": "Women Top", "image": "assets/images/banner2.jpg"},
    ],
    [
      {"name": "Kids Shirt", "image": "assets/images/banner2.jpg"},
      {"name": "Kids Dress", "image": "assets/images/banner2.jpg"},
    ],
  ];

  @override
  void onInit() {
    super.onInit();
    print("🔵 onInit CALLED: $hashCode");
  }

  // Update selected category
  void updateCategory(int index) {
    print("🟢 updateCategory CALLED → index: $index | controller: $hashCode");
    selectedCategory.value = index;
  }
}
