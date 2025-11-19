// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import '../../constants/app_colors.dart';
// import 'categories_controller.dart';

// class CategoriesView extends GetView<CategoriesController> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 1,
//         title: Text(
//           "Categories",
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: Row(
//         children: [  
//           Container(
//             width: width * 0.25,
//             color: Colors.grey.shade100,
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: controller.categories.length,
//                 itemBuilder: (context, index) {
//                   final isSelected = controller.selectedCategory.value == index;

//                   return InkWell(
//                     onTap: () {
//                       controller.updateCategory(index);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 8),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.white : Colors.transparent,
//                         border: Border(
//                           left: BorderSide(
//                             color: isSelected
//                                 ? AppColors.primary
//                                 : Colors.transparent,
//                             width: 3,
//                           ),
//                         ),
//                       ),
//                       child: Column(
//                         children: [
//                           ClipOval(
//                             child: Image.asset(
//                               controller.categories[index]["image"],
//                               height: 7.h,
//                               width: 16.w,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             controller.categories[index]["name"],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: isSelected
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                               color: isSelected
//                                   ? AppColors.primary
//                                   : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),

//           /// RIGHT SIDE PRODUCT GRID
//           Expanded(
//             child: Obx(() {
//               final selected = controller.selectedCategory.value;

//               return GridView.builder(
//                 padding: EdgeInsets.all(width * 0.03),
//                 itemCount: controller.products[selected].length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 2,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemBuilder: (context, index) {
//                   final p = controller.products[selected][index];

//                   return Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         /// IMAGE
//                         ClipOval(
//                           child: Image.asset(
//                             p["image"],
//                             height: 8.h,
//                             width: 8.h,
//                             fit: BoxFit.cover,
//                           ),
//                         ),

//                         /// DETAILS
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.all(width * 0.025),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   p["name"],
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14.sp,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }
