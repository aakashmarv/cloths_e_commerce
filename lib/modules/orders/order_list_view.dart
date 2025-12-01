import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../roots/app_routes.dart';
import 'widgets/curesole.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String searchQuery = "";
  String? filterType;

  final List<Map<String, String>> orders = const [
    {
      "status": "Refund completed",
      "date": "Nov 24",
      "title": "boAt Rockerz 551 ANC Pro",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Cancelled",
      "date": "Nov 15",
      "title": "boAt Rockerz 551 ANC Pro",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Delivered",
      "date": "Sep 11",
      "title": "Minutes Basket (1 item)",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Delivered",
      "date": "Aug 08",
      "title": "Minutes Basket (1 item)",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Cancelled",
      "date": "Dec 27",
      "title": "Nothing Phone (2a) Plus (Grey)",
      "image": "assets/p2.jpg",
    },
     {
      "status": "Refund completed",
      "date": "Nov 24",
      "title": "boAt Rockerz 551 ANC Pro",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Cancelled",
      "date": "Nov 15",
      "title": "boAt Rockerz 551 ANC Pro",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Delivered",
      "date": "Sep 11",
      "title": "Minutes Basket (1 item)",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Delivered",
      "date": "Aug 08",
      "title": "Minutes Basket (1 item)",
      "image": "assets/p2.jpg",
    },
    {
      "status": "Cancelled",
      "date": "Dec 27",
      "title": "Nothing Phone (2a) Plus (Grey)",
      "image": "assets/p2.jpg",
    },
  ];

  List<Map<String, String>> get filteredOrders {
    return orders.where((o) {
      final title = o["title"]!.toLowerCase();
      final status = o["status"]!.toLowerCase();

      if (!title.contains(searchQuery.toLowerCase())) return false;

      if (filterType == "Delivered" && !status.contains("deliver"))
        return false;
      if (filterType == "Cancelled" && !status.contains("cancel")) return false;
      if (filterType == "Refund" && !status.contains("refund")) return false;

      return true;
    }).toList();
  }

  openFilterSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Text(
                  "Filter Orders",
                  style: TextStyle(
                    color: AppColors.text(context),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                const Divider(),
                buildFilterOption("Delivered"),
                buildFilterOption("Cancelled"),
                buildFilterOption("Refund"),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    setState(() => filterType = null);
                    Navigator.pop(context);
                  },
                  child: const Text("Clear Filters"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFilterOption(String name) {
    return ListTile(
      title: Text(name, style: TextStyle(color: AppColors.text(context))),
      trailing: filterType == name
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
          : null,
      onTap: () {
        setState(() => filterType = name);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.bg(context),
        centerTitle: false,
        title: Text(
          'My Orders',
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: AppColors.text(context)),
        ),
        iconTheme: IconThemeData(color: AppColors.appicon(context)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            BannerCarousel(),
            const SizedBox(height: 12),

            // 🔍 Search + Filter Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? AppColors
                                    .borderGrey // light mode border
                              : Colors.transparent, // dark mode no border
                          width: 1,
                        ),
                      ),
                      child: CupertinoSearchTextField(
                        placeholder: "Search your order",
                        onChanged: (v) => setState(() => searchQuery = v),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),

                        style: Theme.of(context).textTheme.bodyMedium,
                        placeholderStyle: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: Theme.of(context).hintColor),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.transparent, // Important
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),
                  TextButton.icon(
                    onPressed: openFilterSheet,
                    icon: Icon(
                      Icons.filter_list,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      'Filters',
                      style: TextStyle(color: AppColors.text(context)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: filteredOrders.length,
                separatorBuilder: (_, __) =>
                    Divider(color: Theme.of(context).dividerColor),
                itemBuilder: (context, index) {
                  final item = filteredOrders[index];
                  final status = item['status'] ?? '';
                  final title = item['title'] ?? '';
                  final imagePath = item['image'] ?? '';
                  final date = item['date'] ?? '';

                  Color statusColor = textTheme.bodyMedium!.color!;
                  if (status.toLowerCase().contains('refund')) {
                    statusColor = Theme.of(context).colorScheme.secondary;
                  } else if (status.toLowerCase().contains('cancel')) {
                    statusColor = Colors.red;
                  } else if (status.toLowerCase().contains('delivered')) {
                    statusColor = Theme.of(context).colorScheme.primary;
                  }

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePath,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      "${status} on ${date}",
                      style: textTheme.bodyMedium!.copyWith(
                        inherit: true,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        title,
                        style: textTheme.bodySmall?.copyWith(
                          inherit: true,
                          color: textTheme.bodySmall!.color!.withOpacity(.75),
                        ),
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).iconTheme.color!.withOpacity(.5),
                    ),
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.orderDetailsScreen,
                        arguments: {
                          "status": status,
                          "title": title,
                          "image": imagePath,
                          "date": date,
                        },
                      );

                      print("hiuerjiogfmklms lkmck;lmldk  jb");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
