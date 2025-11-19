// import 'package:get/get.dart';
// import 'categories_controller.dart';

// class CategoriesBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<CategoriesController>(() => CategoriesController());
//   }
// }



import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int selectedCategory = 0;

  final List<Map<String, dynamic>> categories = [
    {"name": "T-Shirts", "image": "assets/p2.jpg"},
    {"name": "Shirts", "image": "assets/p2.jpg"},
    {"name": "Jeans", "image": "assets/p2.jpg"},
    {"name": "Shoes", "image": "assets/p2.jpg"},
    {"name": "Jackets", "image": "assets/p2.jpg"},
  ];

  final List<List<Map<String, dynamic>>> products = [
    [
      {
        "name": "White Cotton T-Shirt",
        "desc": "Soft & Premium quality",
        "price": "499",
        "image": "assets/images/banner2.jpg"
      },
      {
        "name": "Black Oversized Tee",
        "desc": "Trendy streetwear look",
        "price": "699",
        "image": "assets/images/banner2.jpg"
      },
       {
        "name": "White Cotton T-Shirt",
        "desc": "Soft & Premium quality",
        "price": "499",
        "image": "assets/images/banner2.jpg"
      },
      {
        "name": "Black Oversized Tee",
        "desc": "Trendy streetwear look",
        "price": "699",
        "image": "assets/images/banner2.jpg"
      },
       {
        "name": "White Cotton T-Shirt",
        "desc": "Soft & Premium quality",
        "price": "499",
        "image": "assets/images/banner2.jpg"
      },
      {
        "name": "Black Oversized Tee",
        "desc": "Trendy streetwear look",
        "price": "699",
        "image": "assets/images/banner2.jpg"
      },
       {
        "name": "White Cotton T-Shirt",
        "desc": "Soft & Premium quality",
        "price": "499",
        "image": "assets/images/banner2.jpg"
      },
      {
        "name": "Black Oversized Tee",
        "desc": "Trendy streetwear look",
        "price": "699",
        "image": "assets/images/banner2.jpg"
      }
    ],
    [
      {
        "name": "Formal Blue Shirt",
        "desc": "Office Premium Collection",
        "price": "899",
        "image": "assets/images/banner2.jpg"
      },
      {
        "name": "Casual Checked Shirt",
        "desc": "Comfortable soft fabric",
        "price": "799",
        "image": "assets/images/banner2.jpg"
      }
    ],
    [
      {
        "name": "Denim Blue Jeans",
        "desc": "Slim fit high quality",
        "price": "1299",
        "image": "assets/images/banner2.jpg"
      }
    ],
    [
      {
        "name": "High Ankle Sneakers",
        "desc": "Comfortable & Stylish",
        "price": "1499",
        "image": "assets/images/banner2.jpg"
      }
    ],
    [
      {
        "name": "Winter Black Jacket",
        "desc": "Warm & Soft",
        "price": "1999",
        "image": "assets/images/banner2.jpg"
      }
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Categories",
          // categories[selectedCategory]["name"],
          style:  TextStyle(color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.bold),
        )
      ),

      body: Row(
        children: [

          /// LEFT SIDE CATEGORY LIST
          Container(
            width: width * 0.25,
            color: Colors.grey.shade100,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == index;

                return InkWell(
                  onTap: () {
                    setState(() => selectedCategory = index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      border: Border(
                        left: BorderSide(
                          color: isSelected ? AppColors.primary : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            categories[index]["image"], 
                            height: 7.h,
                            width: 16.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          categories[index]["name"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ?AppColors.primary : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// RIGHT SIDE PRODUCT GRID
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(width * 0.03),
              itemCount: products[selectedCategory].length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final p = products[selectedCategory][index];

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// IMAGE
                      ClipOval(
                        child: Image.asset(
                          p["image"],
                          height: 8.h,
                          width: 8.h,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// DETAILS
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.025),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                p["name"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
