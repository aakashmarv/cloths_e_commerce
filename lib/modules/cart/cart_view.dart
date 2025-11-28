import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String image1 = 'assets/p2.jpg';
  static const String image2 = 'assets/images/banner2.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        title: Text(
          'CART',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp,),
        ),
        backgroundColor: AppColors.bg(context),
        foregroundColor: Colors.black87,
        elevation: 0.5,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF7EE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.verified, color: Color(0xFF2BB673)),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'You are getting 10% reward points on this order',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Cart Item 1
                cartItem(
                  context: context,
                  imagePath: image1,
                  title: 'Brown Camo Printed Hoodie',
                  price: '₹1199',
                  mrp: '₹2399',
                  save: '₹1200',
                  attributes: 'Color: Brown Camo Printed',
                  size: 'Size: M',
                ),
                const SizedBox(height: 12),

                // Cart Item 2
                cartItem(
                  context: context,
                  imagePath: image2,
                  title: 'Tinted Brown Over Dyed Baggy Pants',
                  price: '₹1199',
                  mrp: '₹2499',
                  save: '₹1300',
                  attributes: 'Color: Tinted Brown',
                  size: ' Size: 30',
                ),
                const SizedBox(height: 16),

                // Extra savings card
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 14,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Extra Savings',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text(context),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.local_offer_outlined,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          color: AppColors.text(context),
                                        ),
                                        children: [
                                          TextSpan(text: 'Save '),
                                          TextSpan(
                                            text: '₹11990 ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green,
                                            ),
                                          ),
                                          TextSpan(text: 'OFF on this order'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 0.5,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: Colors.black12),
                            ),
                            minimumSize: Size(20.w, 4),
                          ),
                          child:  Text(
                            'APPLY',
                            style: TextStyle(color: Colors.black, fontSize: 15.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Order summary card
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary (2 items)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.text(context),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _summaryRow(context, 'Total MRP (Inc. of Taxes)', '₹4898'),
                        const SizedBox(height: 6),
                        _summaryRow(
                          context,
                          'Beyoung Discount',
                          '- ₹2500',
                          valueColor: Colors.redAccent,
                        ),
                        _summaryRow(
                          context,
                          'Shipping',
                          'Free',
                          valueColor: Colors.green,
                        ),
                        _summaryRow(
                          context,
                          'Total Amount',
                          '₹2398',
                          isBold: true,
                          // valueColor: Colors.black,
                        ),
                          // valueColor: Colors.black,
                        // ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // _paymentRow(),
                // const SizedBox(height: 24),
              ],
            ),
          ),

          // Bonus bar
          Container(
            width: double.infinity,
            color: AppColors.lightGreen,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text('Bonus Discount Auto-Applies on Prepaid Orders'),
            ),
          ),

          // Place order button (bottom)
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.paymentScreen);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ), // 👈 height reduce
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  minimumSize: Size(double.infinity, 4),
                ),
                child: const Text(
                  'PLACE ORDER',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context, // add context

    String title,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.text(context),
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor ?? AppColors.text(context),
          ),
        ),
      ],
    );
  }

  Widget cartItem({
    required BuildContext context, // add context

    required String imagePath,
    required String title,
    required String price,
    required String mrp,
    required String save,
    required String attributes,
    required String size,
  }) {
    return Container(
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
          // TOP CONTENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        width: 95,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Qty: 1 ▼",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text(context)
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Text(
                            price,
                            style:  TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text(context)
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            mrp,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "You save $save",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              attributes,
                              maxLines: 2,
                              overflow: TextOverflow.visible,
                              style:  TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text(context)
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            size,
                            style:  TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text(context)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // FULL WIDTH DIVIDER
          const Divider(height: 1, thickness: 1, color: Color(0xFFE0E0E0)),

          // BOTTOM ROW
          SizedBox(
            height: 48,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.delete_outline, size: 22),
                    ),
                  ),
                ),

                Container(
                  width: 1,
                  height: double.infinity,
                  color: Color(0xFFE0E0E0),
                ),

                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child:  Text(
                        "Move to Wishlist",
                        style: TextStyle(fontSize: 13, color: AppColors.text(context)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
