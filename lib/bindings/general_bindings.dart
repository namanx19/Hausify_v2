import 'package:get/get.dart';
import 'package:hausify_v2/features/shop/controllers/product/variation_controller.dart';
import 'package:hausify_v2/utils/helpers/network_manager.dart';
class GeneralBindings extends Bindings {
  @override
  void dependencies(){
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}