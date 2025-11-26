import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../roots/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _ctrl = TextEditingController();
  List<String> recent = ["Hoodie", "Baggy Pants", "Oversized T-shirt"];
  List<String> suggestions = [
    "Winter hoodie",
    "Camo jacket",
    "Cargo pants",
    "Denim",
    "Streetwear",
  ];

  bool showResults = false;
  List<Map<String, String>> products = [
    {"img": "assets/p2.jpg", "title": "Blue Camo Hoodie"},
    {"img": "assets/p2.jpg", "title": "Tinted Brown Baggy"},
    {"img": "assets/p2.jpg", "title": "Streetwear Oversize Tee"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //--- Search Bar
            Container(
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _ctrl,
                onChanged: (v) => setState(() => showResults = v.isNotEmpty),
                decoration: InputDecoration(
                  hintText: "Search for products...",
                  prefixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            //--- Suggestions / Results
            Expanded(
              child: showResults ? _productResults() : _suggestionsView(),
            ),
          ],
        ),
      ),
    );
  }

  ///----------------- Suggestion State UI -------------
  Widget _suggestionsView() {
    return ListView(
      children: [
        const Text(
          "Recent Searches",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: recent.map((e) {
            return Chip(
              label: Text(e),
              backgroundColor: const Color(0xFFEDEDED),
            );
          }).toList(),
        ),

        const SizedBox(height: 20),
        const Text(
          "Popular Searches",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: suggestions.map((e) {
            return InkWell(
              onTap: () {
                _ctrl.text = e;
                setState(() => showResults = true);
              },
              child: Chip(
                label: Text(e),
                backgroundColor: Colors.black,
                labelStyle: const TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  ///----------------- Results State UI -------------
  Widget _productResults() {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        final p = products[i];
        return GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.productDetailScreen);
          },
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                p["img"]!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              p["title"]!,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: const Text("Tap to view"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}
