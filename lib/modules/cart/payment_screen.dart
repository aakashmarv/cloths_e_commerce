import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool showItems = true;
  String? savedAddress;

  // final String? savedAddress =
  //     "123, Elm Street, Springfield, IL, 62704, United States";

  /// Dummy list of cart products
  final List<Map<String, String>> products = [
    {"img": "assets/p2.jpg", "title": "Brown Camo Printed Hoodie"},
    {"img": "assets/p2.jpg", "title": "Tinted Brown Over Dyed Baggy Fit"},
    {"img": "assets/p2.jpg", "title": "Blue Camo Printed Hoodie"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        backgroundColor: AppColors.bg(context),
        elevation: 0,
        foregroundColor: Colors.black,
        title:  Text(
          'ADDRESS',
          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.text(context)),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          //-- ORDER SUMMARY CARD
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.text(context)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'You are saving ₹3750',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                const Text(
                  '₹3547',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          _addressSection(
            userAddress: savedAddress,
            onAdd: () {
              Get.toNamed(AppRoutes.newAddressScreen);
            },
            onChange: () {},
          ),
          const SizedBox(height: 18),

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
            child: Column(
              children: [
                //-- Header
                InkWell(
                  onTap: () => setState(() => showItems = !showItems),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Estimate (${products.length})',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.text(context)
                          ),
                        ),
                        AnimatedRotation(
                          turns: showItems ? 0 : 0.5,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 250),
                  crossFadeState: showItems
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Column(
                    children: [
                      for (final p in products) ...[
                        Divider(height: 1),
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              p["img"]!,
                              width: 15.w,
                              height: 6.h,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 15.w,
                                height: 6.h,
                                color: Colors.grey.shade200,
                                child: const Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            p["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          subtitle: Row(
                            children: const [
                              Icon(
                                Icons.local_shipping,
                                size: 18,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Delivery By',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  secondChild: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),

      //-- Bottom CTA
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'CONTINUE PAYMENT',
              style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressSection({
    required String? userAddress,
    required VoidCallback onAdd,
    required VoidCallback onChange,
  }) {
    if (userAddress == null) {
      return InkWell(
        onTap: onAdd,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
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
          child:  Center(
            child: Text(
              "Add New Address",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.text(context),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.location_on,  size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              userAddress,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.text(context)),
            ),
          ),
          GestureDetector(
            onTap: onChange,
            child: const Text(
              "Change",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
