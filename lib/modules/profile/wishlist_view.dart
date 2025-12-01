import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Map<String, dynamic>> wishlist = [
    {
      "id": 1,
      "name": "Premium Wireless Headphones",
      "price": 12999,
      "originalPrice": 18999,
      "rating": 4.5,
      "inStock": true,
      "image":
          "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600"
    },
    {
      "id": 2,
      "name": "Smart Watch Series 7",
      "price": 24999,
      "originalPrice": 32999,
      "rating": 4.8,
      "inStock": true,
      "image":
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600"
    },
    {
      "id": 3,
      "name": "Designer Leather Bag",
      "price": 8999,
      "originalPrice": 14999,
      "rating": 4.3,
      "inStock": true,
      "image":
          "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=600"
    },
    {
      "id": 4,
      "name": "Running Shoes Pro",
      "price": 6999,
      "originalPrice": 9999,
      "rating": 4.6,
      "inStock": true,
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600"
    }
  ];

  void removeProduct(int id) {
    setState(() => wishlist.removeWhere((e) => e["id"] == id));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Item removed from wishlist")),
    );
  }

  void addToCart(dynamic item) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${item['name']} added to cart!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg(context),
        title: Text(
          "My Wishlist",
          style: TextStyle(
            fontSize: 17.sp,
            color: AppColors.text(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.delete_forever, size: 20.sp),
        //     onPressed: () => setState(() => wishlist.clear()),
        //   )
        // ],
      ),
      body: wishlist.isEmpty ? _emptyWishlist() : _wishlistGrid(),
    );
  }

  // ------------------ Empty ---------------------
  Widget _emptyWishlist() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline, size: 30.sp, color: Colors.grey),
          SizedBox(height: 2.h),
          Text(
            "Your Wishlist is Empty",
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 1.h),
          Text(
            "Start adding products you like!",
            style: TextStyle(fontSize: 10.sp, color: Colors.grey.shade500),
          ),
          SizedBox(height: 3.h),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.6.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text("Browse Products", style: TextStyle(fontSize: 11.sp)),
          )
        ],
      ),
    );
  }

  // ----------------- Grid ----------------------
  Widget _wishlistGrid() {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: GridView.builder(
        itemCount: wishlist.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.57,
          crossAxisSpacing: 3.w,
          mainAxisSpacing: 4.w,
        ),
        itemBuilder: (ctx, index) => _productCard(wishlist[index]),
      ),
    );
  }

  // ---------------- Card ------------------------
 Widget _productCard(dynamic item) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.cardBg(context),
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.04),
          blurRadius: 12,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================== PRODUCT IMAGE SECTION ==================
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              Image.network(
                item["image"],
                height: 18.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // stock overlay
              if (!item["inStock"])
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(.45),
                    alignment: Alignment.center,
                    child: Text(
                      "OUT OF STOCK",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        SizedBox(height: 1.2.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                item["name"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text(context),
                ),
              ),

              SizedBox(height: 0.8.h),

              // rating
              Row(
                children: [
                  Icon(Icons.star, size: 16.sp, color: Colors.amber.shade600),
                  SizedBox(width: 1.5.w),
                  Text(
                    "${item['rating']}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text(context)
                    ),
                  ),
                ],
              ),

              SizedBox(height: 0.8.h),

              // price
              Row(
                children: [
                  Text(
                    "₹${item['price']}",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.text(context)
                    ),
                  ),
                  SizedBox(width: 1.5.w),
                  Text(
                    "₹${item['originalPrice']}",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Spacer(),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              // add button
              Expanded(
                child: ElevatedButton(
                  onPressed: item["inStock"]
                      ? () => addToCart(item)
                      : null,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    minimumSize: Size(35, 0)
                  ),
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.text(context)
                    ),
                  ),
                ),
              ),

              SizedBox(width: 2.4.w),

              // delete button
              InkWell(
                onTap: () => removeProduct(item["id"]),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    size: 20.sp,
                    color: Colors.red.shade400,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}           
}
