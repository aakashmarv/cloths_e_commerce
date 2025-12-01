import 'package:cloth_e_commerce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../roots/app_routes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(color: AppColors.text(context)),
        ),
        backgroundColor: AppColors.bg(context),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFFFD700),
            child: Icon(Icons.person, size: 60, color: Colors.black),
          ),
          const SizedBox(height: 20),
          Text(
            'Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.text(context),
            ),
          ),
          const SizedBox(height: 30),
          _buildMenuItem(
            context,
            Icons.shopping_bag,
            'My Orders',
            onTap: () {
              Get.toNamed(AppRoutes.myOrderScreen);
            },
          ),
          _buildMenuItem(
            context,
            Icons.favorite,
            'Wishlist',
            onTap: () {
              Get.toNamed(AppRoutes.wishlistScreen);
            },
          ),
          _buildMenuItem(
            context,
            Icons.location_on,
            'Addresses',
            onTap: () {
              Get.toNamed(AppRoutes.newAddressScreen);
            },
          ),
          _buildMenuItem(context, Icons.payment, 'Payment Methods'),
          _buildMenuItem(context, Icons.support_agent, 'Customer Support'),
          _buildMenuItem(context, Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, {
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.bg(context),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.icon(context)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
