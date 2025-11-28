import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});
  final List<Map<String, dynamic>> products = [
    {
      "name": "Classic Shirt",
      "image": "assets/images/banner2.jpg",
      "rating": 4.5,
      "price": "₹1499",
    },
    {
      "name": "Winter Hoodie",
      "image": "assets/p2.jpg",
      "rating": 4.2,
      "price": "₹1699",
    },
    {
      "name": "Baggy Jeans",
      "image": "assets/images/banner2.jpg",
      "rating": 4.3,
      "price": "₹2099",
    },
    {
      "name": "Sneakers",
      "image": "assets/p2.jpg",
      "rating": 4.6,
      "price": "₹2599",
    },
  ];

  Color getStatusColor(String status) {
    status = status.toLowerCase();

    if (status.contains("refund")) return Colors.orange;
    if (status.contains("cancel")) return Colors.red;
    if (status.contains("deliver")) return Colors.green;

    return Colors.grey;
  }

  String getStatusSummary(String status) {
    status = status.toLowerCase();

    if (status.contains("refund")) return "Refund Completed";
    if (status.contains("cancel")) return "Cancelled";
    if (status.contains("deliver")) return "Delivered";

    return status;
  }

  IconData getStatusIcon(String status) {
    if (status == "Delivered") return Icons.check_circle;
    if (status == "Cancelled") return Icons.cancel;
    if (status == "Pending") return Icons.access_time;
    return Icons.info; // default
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};

    final status = args["status"] ?? "";
    final title = args["title"] ?? "";
    final image = args["image"] ?? "";
    final date = args["date"] ?? "";

    final statusColor = getStatusColor(status);
    // final summaryStatusText = getStatusSummary(status);

    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: AppColors.bg(context),
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [TextButton(onPressed: () {}, child: const Text("Help"))],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ----------------- PRODUCT CARD ---------------------
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    image,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style:  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text(context)
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),
            Text(
              "Order #OD429735807250033100",
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),

            const SizedBox(height: 14),

            /// ----------------- STATUS CARD ---------------------
            Container(
              padding: const EdgeInsets.all(14),
               decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                        ),
                      ),
                      Icon(getStatusIcon(status), color: statusColor),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.confirmGreen),
                      Expanded(
                        child: Divider(
                          thickness: 2,
                          color: AppColors.confirmGreen,
                        ),
                      ),
                      Icon(Icons.check_circle, color: statusColor),
                    ],
                  ),
                  const SizedBox(height: 6),

                  /// Bottom timeline text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text("Order Confirmed\nNov 20, 2023",  style: TextStyle(color: AppColors.text(context)),),
                      Text(
                        "$status\n$date",
                        style: TextStyle(color: statusColor),
                      ),
                    ],
                  ),

                  // const SizedBox(height: 12),
                  // const Text(
                  //   "See all updates",
                  //   style: TextStyle(color: Colors.blue),
                  // ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "You might be also interested in",
              style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.text(context)),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, i) {
                  return _buildProductCard(context, products[i]);
                },
              ),
            ),

            const SizedBox(height: 20),

            /// ----------------- DELIVERY DETAILS ---------------------
             Text(
              "Delivery details",
              style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.text(context)),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(14),
               decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Near BBAU gate no.1 Raebareilly road",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 20),
                  Row(
                    children:  [
                      Icon(Icons.person),
                      SizedBox(width: 8),
                      Text("Aman Kumar - 9454310605", style: TextStyle(color: AppColors.text(context)),),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

             Text(
              "Price details",
              style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.text(context)),
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.all(14),
             decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
              child: Column(
                children:  [
                  _PriceLine("Listing price", "₹2,100"),
                  _PriceLine("Special price", "₹1,070"),
                  _PriceLine("Total fees", "₹10"),
                  Divider(),
                  _PriceLine("Total Amount", "₹1,080", isBold: true),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method", style: TextStyle(color: AppColors.text(context)),),
                      Text("Cash On Delivery",style: TextStyle(color: AppColors.text(context)),),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// ----------------- DOWNLOAD INVOICE ---------------------
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 30),
              ),
              child: const Text("Download Invoice"),
            ),

            const SizedBox(height: 20),
             Text("Order ID: OD429735807250033100", style: TextStyle(color: AppColors.darkGrey),),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.productDetailScreen);
      },
      child: Container(
        width: 43.w,
        margin: const EdgeInsets.only(right: 10, bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.asset(
                product['image'],
                width: 44.w,
                height: 16.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text(context),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${product['rating']}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.text(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product['price'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text(context),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceLine extends StatelessWidget {
  final String text;
  final String price;
  final bool isBold;

  const _PriceLine(this.text, this.price, {this.isBold = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.darkGrey
            ),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppColors.text(context)
            ),
          ),
        ],
      ),
    );
  }
}
