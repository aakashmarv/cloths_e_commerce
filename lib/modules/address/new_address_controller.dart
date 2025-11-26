import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddressController extends GetxController {
  // Form Key
  final formKey = GlobalKey<FormState>();

  // Text Controllers
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final houseController = TextEditingController();
  final blockController = TextEditingController();
  final buildingController = TextEditingController();
  final streetController = TextEditingController();
  final landmarkController = TextEditingController();
  final pincodeController = TextEditingController();
  final localityController = TextEditingController();

  // State
  RxString selectedTag = "HOME".obs;
  RxBool isEditMode = false.obs;

  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    houseController.dispose();
    blockController.dispose();
    buildingController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    pincodeController.dispose();
    localityController.dispose();
    super.onClose();
  }

  void setTag(String tag) {
    selectedTag.value = tag;
  }

  void onSavePressed() {
    if (!formKey.currentState!.validate()) return;

    Get.snackbar(
      "Success",
      isEditMode.value ? "Address Updated!" : "Address Saved!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Get.back();
    });
  }
}
