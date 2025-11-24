import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int _currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  bool specOpen = true;
  bool descOpen = false;
  bool refundOpen = false;
  bool marketedOpen = false;

  final List<Map<String, dynamic>> _products = [
    {
      'image':
          'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=400',
      'name': 'Olive Green Shirt',
      'price': '₹499',
      'rating': 4.5,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1602810318383-e386cc2a3ccf?w=400',
      'name': 'Black Hoodie',
      'price': '₹799',
      'rating': 4.8,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400',
      'name': 'White T-Shirt',
      'price': '₹399',
      'rating': 4.3,
    },
    {
      'image':
          'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?w=400',
      'name': 'Blue Denim Jacket',
      'price': '₹1299',
      'rating': 4.7,
    },
  ];

  final List<Color> productColors = [
    AppColors.grey,
    AppColors.accentGreen,
    AppColors.lightPrimary,
    Colors.brown,
  ];

  final List<String> sizes = ["M", "L", "XL", "XXL"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      bottomNavigationBar: _bottomButtons(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _productImageSection(),
              _titlePriceSection(),
              _sectionDivider(),
              _colorSelector(),
              _sizeSelector(),
              _sectionDivider(),
              _deliveryCheck(),
              const SizedBox(height: 15),
              _offers(),
              _sectionDivider(),
              _productDetails(),
              _sectionDivider(),
              _productHorizontalList("Recently Viewed"),
              _sectionDivider(),
              _productHorizontalList("Similar Products"),
            ],
          ),
        ),
      ),
    );
  }

  // -------------------- BASIC UI HELPERS ---------------------

  Widget _sectionDivider() =>
      Divider(height: 25, thickness: 10, color: Colors.grey.shade200);

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        Icon(Icons.share_outlined,size: 19.sp, color: Colors.black),
        SizedBox(width: 12),
        Stack(
          children: [
            IconButton(
              icon:  Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  // -------------------- IMAGE SLIDER ---------------------

  Widget _productImageSection() {
    const images = [
      "assets/p2.jpg",
      "assets/images/banner2.jpg",
      "assets/images/logo.png",
    ];

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 350,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (i, _) => setState(() => _currentIndex = i),
          ),
          items: images
              .map(
                (img) =>
                    Image.asset(img, fit: BoxFit.cover, width: double.infinity),
              )
              .toList(),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 6),
          color: AppColors.lightestPrimary,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (i) {
                  final active = _currentIndex == i;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 6 : 4,
                    height: active ? 6 : 4,
                    decoration: BoxDecoration(
                      color: active ? Colors.black : Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              const SizedBox(height: 4),
              Text(
                "Tap on image to zoom",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // -------------------- TITLE & PRICE ---------------------

  Widget _titlePriceSection() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Off White Elbow Patch Sweatshirt",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Text(
                "₹1199",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              const Text(
                "₹2999",
                style: TextStyle(
                  fontSize: 17,
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              _offerTag("60% OFF"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _offerTag(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    decoration: BoxDecoration(
      color: Colors.yellow.shade700,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
    ),
  );

  // -------------------- COLOR SELECTOR ---------------------

  Widget _colorSelector() {
    return _section(
      title: "Color (Desert Beige)",
      child: Row(
        children: List.generate(productColors.length, (i) {
          final selected = i == selectedColorIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => setState(() => selectedColorIndex = i),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: productColors[i],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selected ? AppColors.primary : Colors.transparent,
                    width: 1.2,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _sizeSelector() {
    return _section(
      title: "Size",
      child: Row(
        children: List.generate(sizes.length, (i) {
          final selected = i == selectedSizeIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => setState(() => selectedSizeIndex = i),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: selected ? Colors.black : Colors.white,
                  border: Border.all(
                    color: selected ? Colors.black : Colors.grey,
                  ),
                ),
                child: Text(
                  sizes[i],
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.grey,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: selected ? 15 : 12,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _deliveryCheck() {
    return _section(
      title: "Check Delivery Date",
      child: Column(
        children: [
          // TEXTFIELD
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "Enter Pincode",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.horizontal(
                      right: Radius.circular(10),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(minimumSize: Size(100, 35)),
                    child: const Text(
                      "Check",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          _infoRow(Icons.local_shipping_outlined, "Free Shipping"),
          const SizedBox(height: 6),
          _infoRow(Icons.money, "Cash on Delivery Available"),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.darkGrey),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _offers() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      color: AppColors.primary,
      child: Text(
        "You will get 10% reward points on this order",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _productDetails() {
    return StatefulBuilder(
      builder: (context, ss) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              Card(
                color: AppColors.white,
                child: Column(
                  children: [
                    _expandTile(
                      title: "Specifications",
                      subtitle: "Technical details and features",
                      open: specOpen,
                      onTap: () => ss(() => specOpen = !specOpen),
                      child: _specificationTable(),
                    ),

                    _tileDivider(),

                    _expandTile(
                      title: "Description",
                      subtitle: "Product overview and details",
                      open: descOpen,
                      onTap: () => ss(() => descOpen = !descOpen),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "This hoodie is made with premium Poly Fleece and designed for winter comfort.",
                          style: TextStyle(fontSize: 14, height: 1.4),
                        ),
                      ),
                    ),

                    _tileDivider(),

                    _expandTile(
                      title: "Returns, Exchange, & Refund Policy",
                      subtitle: "7 days easy returns and exchange",
                      open: refundOpen,
                      onTap: () => ss(() => refundOpen = !refundOpen),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "You can return or exchange this product within 7 days.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),

                    _tileDivider(),

                    _expandTile(
                      title: "Marketed By",
                      subtitle: "Company and distributor information",
                      open: marketedOpen,
                      onTap: () => ss(() => marketedOpen = !marketedOpen),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Marketed by XYZ Pvt. Ltd.\nRegistered in India.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _expandTile({
    required String title,
    required String subtitle,
    required bool open,
    required VoidCallback onTap,
    required Widget child,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          trailing: Icon(
            open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 26,
          ),
        ),
        if (open) child,
      ],
    );
  }

  Widget _tileDivider() => Container(height: 1, color: Colors.grey.shade200);

  Widget _specificationTable() {
    Map<String, String> specs = {
      "Fabric": "Poly Fleece",
      "Neck": "Hoodie Neckline",
      "Pattern": "Printed",
      "Hemline": "Ribbed Hemline",
      "Sleeve": "Full Sleeves",
      "Style": "Winter Wear",
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GridView.count(
        crossAxisCount: 2, // 🔥 2 columns
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 20,
        mainAxisSpacing: 12,
        childAspectRatio: 3, // adjust height/width
        children: specs.entries.map((e) {
          return _rowSpec(e.key, e.value);
        }).toList(),
      ),
    );
  }

  Widget _rowSpec(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        Text(value, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _productHorizontalList(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 30.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) => SizedBox(width: 15),
              itemCount: _products.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => _productCard(_products[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _productCard(Map<String, dynamic> p) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productDetailScreen),
      child: Container(
        width: 43.w,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE + FAV ICON
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                p['image'],
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
                    p['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${p['rating']}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p['price'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

  // -------------------- REUSABLE SECTION ---------------------

  Widget _section({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

// -------------------- BOTTOM BUTTONS ---------------------

Widget _bottomButtons() {
  return Container(
    padding: const EdgeInsets.all(10),
    height: 70,
    child: Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(0, 35),
            ),
            child: const Text(
              "ADD TO CART",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: Size(0, 35),
            ),
            child: const Text(
              "BUY NOW",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}
