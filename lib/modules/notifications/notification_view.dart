import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Dummy notification list
  List<String> notifications = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg(context),

      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.text(context),
          ),
        ),
        centerTitle: true,
      ),

      body: notifications.isEmpty
          ? _buildNoNotificationUI()
          : _buildNotificationList(),
    );
  }

  // ---------------------  NO NOTIFICATION UI  ---------------------
  Widget _buildNoNotificationUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/nonotification.png",
            width: 20.h,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),

        Text(
          "No Notifications",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),

        const SizedBox(height: 8),

        // Text(
        //   "You're all caught up!",
        //   style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
        // ),
      ],
    );
  }

  // ---------------------  NOTIFICATION LIST UI  ---------------------
  Widget _buildNotificationList() {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
          ),
        );
      },
    );
  }
}
