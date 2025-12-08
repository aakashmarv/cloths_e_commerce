import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  static const String image1 = 'assets/p2.jpg';
  static const String image2 = 'assets/images/banner2.jpg';
  
  // Track quantity for each item
  int qtyItem1 = 1;
  int qtyItem2 = 1;

  void _showWishlistPopup(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite, size: 45, color: Colors.red),
                const SizedBox(height: 14),
                Text(
                  "Added to Wishlist!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.text(context),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.text(context),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                  ),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeletePopup(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.delete_outline, size: 45, color: Colors.red),
                const SizedBox(height: 14),
                Text(
                  "Removed from Cart",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.text(context),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product['name'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.text(context),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                  ),
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showQtySelector(BuildContext context, bool isItem1) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 260,
          child: Column(
            children: [
              const SizedBox(height: 12),
              const Text(
                "Select Quantity",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Qty 1 to 10
                  itemBuilder: (context, index) {
                    int qty = index + 1;
                    return ListTile(
                      title: Text("Qty: $qty"),
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          if (isItem1) {
                            qtyItem1 = qty;
                          } else {
                            qtyItem2 = qty;
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        title: Text(
          'CART',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
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
                  quantity: qtyItem1,
                  onQuantityTap: () => _showQtySelector(context, true),
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
                  quantity: qtyItem2,
                  onQuantityTap: () => _showQtySelector(context, false),
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
                          child: Text(
                            'APPLY',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
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
                          'Order Summary (${qtyItem1 + qtyItem2} items)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.text(context),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _summaryRow(
                          context,
                          'Total MRP (Inc. of Taxes)',
                          '₹${(2399 * qtyItem1 + 2499 * qtyItem2)}',
                        ),
                        const SizedBox(height: 6),
                        _summaryRow(
                          context,
                          'Beyoung Discount',
                          '- ₹${(1200 * qtyItem1 + 1300 * qtyItem2)}',
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
                          '₹${(1199 * qtyItem1 + 1199 * qtyItem2)}',
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),
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
                  ),
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
    BuildContext context,
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
    required BuildContext context,
    required String imagePath,
    required String title,
    required String price,
    required String mrp,
    required String save,
    required String attributes,
    required String size,
    required int quantity,
    required VoidCallback onQuantityTap,
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
                    GestureDetector(     
                      onTap: onQuantityTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "Qty: $quantity ▼",
                          style: const TextStyle(fontSize: 13),
                        ),
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
                          color: AppColors.text(context),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '₹${int.parse(price.replaceAll('₹', '')) * quantity}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text(context),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '₹${int.parse(mrp.replaceAll('₹', '')) * quantity}',
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
                        "You save ₹${int.parse(save.replaceAll('₹', '')) * quantity}",
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
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text(context),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            size,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text(context),
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
          SizedBox(
            height: 48,
            child: Row(
              children: [
                // 🗑 DELETE (full area clickable)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showDeletePopup(context, {
                        "name": title,
                        "image": imagePath,
                        "price": price,
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Center(child: Icon(Icons.delete_outline, size: 22)),
                  ),
                ),
                // Divider
                Container(
                  width: 1,
                  height: double.infinity,
                  color: Color(0xFFE0E0E0),
                ),
                // 🤍 MOVE TO WISHLIST (full area clickable)
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _showWishlistPopup(context, {
                        "name": title,
                        "image": imagePath,
                        "price": price,
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Center(
                      child: Text(
                        "Move to Wishlist",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.text(context),
                        ),
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