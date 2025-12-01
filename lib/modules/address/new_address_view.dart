import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import 'new_address_controller.dart';

class NewAddressView extends StatefulWidget {
  const NewAddressView({super.key});

  @override
  State<NewAddressView> createState() => _NewAddressViewState();
}

class _NewAddressViewState extends State<NewAddressView> {
  final controller = Get.find<NewAddressController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: AppColors.bgbttom(context),
      appBar: AppBar(
        backgroundColor: AppColors.bgbttom(context),
        elevation: 1,
        centerTitle: true,
        title: Obx(() => Text(
          controller.isEditMode.value ? "Edit Address" : "Add Address",
          style:  TextStyle(
            color: AppColors.text(context),
            fontWeight: FontWeight.w500,
          ),
        )),
        iconTheme: IconThemeData(color: AppColors.appicon(context)),
        
      ),

      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          children: [
            _buildTextField("Name", "Enter name", controller.nameController,
                validator: (v) => v!.isEmpty ? "Name is required" : null),

            _buildMobileField(width, height),

            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    "House / Flat No",
                    "Flat No",
                    controller.houseController,
                    validator: (v) => v!.isEmpty ? "Required" : null,
                  ),
                ),
                SizedBox(width: width * 0.03),
                Expanded(
                  child: _buildTextField(
                    "Block Name (Optional)",
                    "Block Name",
                    controller.blockController,
                  ),
                ),
              ],
            ),

            _buildTextField("Building Name", "Building Name",
                controller.buildingController,
                validator: (v) => v!.isEmpty ? "Required" : null),

            _buildTextField("Street", "Street", controller.streetController,
                validator: (v) => v!.isEmpty ? "Required" : null),

            _buildTextField("Landmark", "Landmark", controller.landmarkController),

            _buildTextField(
              "Pincode",
              "226012",
              controller.pincodeController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              validator: (v) {
                if (v!.isEmpty) return "Required";
                if (v.length != 6) return "Enter valid 6-digit pincode";
                return null;
              },
            ),

            _buildTextField("Locality", "L D A Colony",
                controller.localityController,
                validator: (v) => v!.isEmpty ? "Required" : null),

            SizedBox(height: height * 0.02),

            Text("Save As",
                style: TextStyle(fontSize: 14.sp, color: AppColors.text(context))),

            SizedBox(height: height * 0.01),

            Row(
              children: ["HOME", "WORK", "OTHER"].map((tag) {
                return Obx(() {
                  final isSelected = controller.selectedTag.value == tag;
                  IconData icon = tag == "HOME"
                      ? Icons.home
                      : tag == "WORK"
                      ? Icons.business_center
                      : Icons.location_on;

                  return Expanded(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(width * 0.03),
                      onTap: () => controller.setTag(tag),
                      child: Container(
                        height: height * 0.05,
                        margin: EdgeInsets.only(
                            right: tag != "OTHER" ? width * 0.03 : 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          border: Border.all(
                            color: isSelected ? Colors.green : Colors.grey,
                            width: 1,
                          ),
                          color: isSelected
                              ? Colors.green.shade50
                              : Colors.transparent,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icon,
                                size: width * 0.045,
                                color: isSelected
                                    ? Colors.green
                                    : Colors.grey),
                            SizedBox(width: width * 0.01),
                            Text(
                              tag,
                              style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.green
                                    : Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }).toList(),
            ),

            SizedBox(height: width * 0.08),

            SafeArea(
              minimum: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewPadding.bottom + 12,
              ),
              child: Obx(() => ElevatedButton(
                onPressed: controller.onSavePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, height * 0.055),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.027),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  controller.isEditMode.value
                      ? "Update Address"
                      : "Save Address",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
            ),

            SizedBox(height: height * 0.03),
          ],
        ),
      ),
    );
  }

  // ---------------------------  UI widgets  --------------------------

  Widget _buildTextField(
      String label,
      String hint,
      TextEditingController controller, {
        String? Function(String?)? validator,
        TextInputType? keyboardType,
        int? maxLength,
      }) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 15.sp, color: AppColors.text(context))),
          SizedBox(height: size.height * 0.004),
          TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            maxLines: 1,
            maxLength: maxLength,
            decoration: InputDecoration(
              isDense: true,
              hintText: hint,
              counterText: maxLength != null ? "" : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide:
                const BorderSide(color: Colors.teal, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileField(double width, double height) {
    final controller = Get.find<NewAddressController>();

    return Padding(
      padding: EdgeInsets.only(top: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Mobile Number",
              style: TextStyle(fontSize: 15.sp, color: AppColors.text(context))),
          SizedBox(height: height * 0.01),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03, vertical: height * 0.013),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(width * 0.02),
                ),
                child:  Row(
                  children: [
                    Icon(Icons.flag, color: Colors.teal, size: 20),
                    SizedBox(width: 4),
                    Text("+91", style: TextStyle(color: AppColors.text(context)),),
                  ],
                ),
              ),

              SizedBox(width: width * 0.03),

              Expanded(
                child: TextFormField(
                  controller: controller.mobileController,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    if (v == null || v.isEmpty) return "Mobile number required";
                    if (v.length != 10) return "Enter valid 10-digit number";
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "9760203435",
                    counterText: "",
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      borderSide:
                      BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
