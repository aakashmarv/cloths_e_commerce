import 'package:get/get.dart';
import 'new_address_controller.dart';

class NewAddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewAddressController());
  }
}
