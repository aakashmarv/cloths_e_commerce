// import 'package:get/get.dart';

// class CategoriesController extends GetxController {
//   RxInt selectedCategory = 0.obs;

//   final List<Map<String, dynamic>> categories = [
//     {"name": "T-Shirts", "image": "assets/p2.jpg"},
//     {"name": "Shirts", "image": "assets/p2.jpg"},
//     {"name": "Jeans", "image": "assets/p2.jpg"},
//     {"name": "Shoes", "image": "assets/p2.jpg"},
//     {"name": "Jackets", "image": "assets/p2.jpg"},
//   ].obs;

//   final List<List<Map<String, dynamic>>> products = [
//     [
//       {
//         "name": "White Cotton T-Shirt",
//         "desc": "Soft & Premium quality",
//         "price": "499",
//         "image": "assets/images/banner2.jpg"
//       },
//       {
//         "name": "Black Oversized Tee",
//         "desc": "Trendy streetwear look",
//         "price": "699",
//         "image": "assets/images/banner2.jpg"
//       },
//        {
//         "name": "White Cotton T-Shirt",
//         "desc": "Soft & Premium quality",
//         "price": "499",
//         "image": "assets/images/banner2.jpg"
//       },
//       {
//         "name": "Black Oversized Tee",
//         "desc": "Trendy streetwear look",
//         "price": "699",
//         "image": "assets/images/banner2.jpg"
//       },
//        {
//         "name": "White Cotton T-Shirt",
//         "desc": "Soft & Premium quality",
//         "price": "499",
//         "image": "assets/images/banner2.jpg"
//       },
//       {
//         "name": "Black Oversized Tee",
//         "desc": "Trendy streetwear look",
//         "price": "699",
//         "image": "assets/images/banner2.jpg"
//       },
//        {
//         "name": "White Cotton T-Shirt",
//         "desc": "Soft & Premium quality",
//         "price": "499",
//         "image": "assets/images/banner2.jpg"
//       },
//       {
//         "name": "Black Oversized Tee",
//         "desc": "Trendy streetwear look",
//         "price": "699",
//         "image": "assets/images/banner2.jpg"
//       }
//     ],
//     [
//       {
//         "name": "Formal Blue Shirt",
//         "desc": "Office Premium Collection",
//         "price": "899",
//         "image": "assets/images/banner2.jpg"
//       },
//       {
//         "name": "Casual Checked Shirt",
//         "desc": "Comfortable soft fabric",
//         "price": "799",
//         "image": "assets/images/banner2.jpg"
//       }
//     ],
//     [
//       {
//         "name": "Denim Blue Jeans",
//         "desc": "Slim fit high quality",
//         "price": "1299",
//         "image": "assets/images/banner2.jpg"
//       }
//     ],
//     [
//       {
//         "name": "High Ankle Sneakers",
//         "desc": "Comfortable & Stylish",
//         "price": "1499",
//         "image": "assets/images/banner2.jpg"
//       }
//     ],
//     [
//       {
//         "name": "Winter Black Jacket",
//         "desc": "Warm & Soft",
//         "price": "1999",
//         "image": "assets/images/banner2.jpg"
//       }
//     ],
//   ].obs;
//   void updateCategory(int index) {
//     selectedCategory.value = index;
//   }
// }
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
