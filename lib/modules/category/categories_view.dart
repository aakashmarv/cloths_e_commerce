// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:sizer/sizer.dart';
// // import '../../constants/app_colors.dart';
// // import 'categories_controller.dart';

// // class CategoriesView extends GetView<CategoriesController> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final width = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       backgroundColor: AppColors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         centerTitle: true,
// //         elevation: 1,
// //         title: Text(
// //           "Categories",
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 18.sp,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),

// //       body: Row(
// //         children: [  
// //           Container(
// //             width: width * 0.25,
// //             color: Colors.grey.shade100,
// //             child: Obx(() {
// //               return ListView.builder(
// //                 itemCount: controller.categories.length,
// //                 itemBuilder: (context, index) {
// //                   final isSelected = controller.selectedCategory.value == index;

// //                   return InkWell(
// //                     onTap: () {
// //                       controller.updateCategory(index);
// //                     },
// //                     child: Container(
// //                       padding: const EdgeInsets.symmetric(
// //                           vertical: 15, horizontal: 8),
// //                       decoration: BoxDecoration(
// //                         color: isSelected ? Colors.white : Colors.transparent,
// //                         border: Border(
// //                           left: BorderSide(
// //                             color: isSelected
// //                                 ? AppColors.primary
// //                                 : Colors.transparent,
// //                             width: 3,
// //                           ),
// //                         ),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           ClipOval(
// //                             child: Image.asset(
// //                               controller.categories[index]["image"],
// //                               height: 7.h,
// //                               width: 16.w,
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 4),
// //                           Text(
// //                             controller.categories[index]["name"],
// //                             textAlign: TextAlign.center,
// //                             style: TextStyle(
// //                               fontSize: 14.sp,
// //                               fontWeight: isSelected
// //                                   ? FontWeight.bold
// //                                   : FontWeight.normal,
// //                               color: isSelected
// //                                   ? AppColors.primary
// //                                   : Colors.black,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             }),
// //           ),

// //           /// RIGHT SIDE PRODUCT GRID
// //           Expanded(
// //             child: Obx(() {
// //               final selected = controller.selectedCategory.value;

// //               return GridView.builder(
// //                 padding: EdgeInsets.all(width * 0.03),
// //                 itemCount: controller.products[selected].length,
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 3,
// //                   crossAxisSpacing: 2,
// //                   childAspectRatio: 0.75,
// //                 ),
// //                 itemBuilder: (context, index) {
// //                   final p = controller.products[selected][index];

// //                   return Container(
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         /// IMAGE
// //                         ClipOval(
// //                           child: Image.asset(
// //                             p["image"],
// //                             height: 8.h,
// //                             width: 8.h,
// //                             fit: BoxFit.cover,
// //                           ),
// //                         ),

// //                         /// DETAILS
// //                         Expanded(
// //                           child: Padding(
// //                             padding: EdgeInsets.all(width * 0.025),
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   p["name"],
// //                                   maxLines: 1,
// //                                   overflow: TextOverflow.ellipsis,
// //                                   style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 14.sp,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         )
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               );
// //             }),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



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

//           /// LEFT SIDE CATEGORY LIST
//           Container(
//             width: width * 0.25,
//             color: Colors.grey.shade100,
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: controller.categories.length,
//                 itemBuilder: (context, index) {
//                   final isSelected =
//                       controller.selectedCategory.value == index;
// return InkWell(
//   onTap: () => controller.updateCategory(index),
//   child: Container(
//     width: double.infinity, // FULL width
//     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),

//     decoration: BoxDecoration(
//       color: isSelected ? Colors.white : Colors.transparent,
//       border: Border(
//         left: BorderSide(
//           color: isSelected ? AppColors.primary : Colors.transparent,
//           width: 3,
//         ),
//       ),
//     ),

//     child: Row(
//       children: [
//         ClipOval(
//           child: Image.asset(
//             controller.categories[index]["image"]!,
//             height: 35,
//             width: 35,
//             fit: BoxFit.cover,
//           ),
//         ),

//         SizedBox(width: 8),

//         Expanded(
//           child: Text(
//             controller.categories[index]["name"]!,
//             style: TextStyle(
//               fontSize: 13.sp,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               color: isSelected ? AppColors.primary : Colors.black,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );

//                   // return InkWell(
//                   //   onTap: () => controller.updateCategory(index),
//                   //   child: Container(
//                   //     padding: const EdgeInsets.symmetric(
//                   //       vertical: 15,
//                   //       horizontal: 8,
//                   //     ),
//                   //     decoration: BoxDecoration(
//                   //       color: isSelected ? Colors.white : Colors.transparent,
//                   //       border: Border(
//                   //         left: BorderSide(
//                   //           color: isSelected
//                   //               ? AppColors.primary
//                   //               : Colors.transparent,
//                   //           width: 3,
//                   //         ),
//                   //       ),
//                   //     ),
//                   //     child: Column(
//                   //       children: [
//                   //         ClipOval(
//                   //           child: Image.asset(
//                   //             controller.categories[index]["image"]!,
//                   //             height: 7.h,
//                   //             width: 16.w,
//                   //             fit: BoxFit.cover,
//                   //           ),
//                   //         ),
//                   //         SizedBox(height: 6),
//                   //         Text(
//                   //           controller.categories[index]["name"]!,
//                   //           textAlign: TextAlign.center,
//                   //           style: TextStyle(
//                   //             fontSize: 13.sp,
//                   //             fontWeight: isSelected
//                   //                 ? FontWeight.bold
//                   //                 : FontWeight.normal,
//                   //             color: isSelected
//                   //                 ? AppColors.primary
//                   //                 : Colors.black,
//                   //           ),
//                   //         ),
//                   //       ],
//                   //     ),
//                   //   ),
//                   // );
                
                
//                 },
//               );
//             }),
//           ),

//           /// RIGHT SIDE PRODUCTS GRID
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
//                         ClipOval(
//                           child: Image.asset(
//                             p["image"],
//                             height: 7.h,
//                             width: 7.h,
//                             fit: BoxFit.cover,
//                           ),
//                         ),

//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.all(width * 0.02),
//                             child: Text(
//                               p["name"],
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 13.sp,
//                               ),
//                             ),
//                           ),
//                         ),
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
