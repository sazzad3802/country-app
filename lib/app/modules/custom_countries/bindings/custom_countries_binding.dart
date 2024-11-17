import 'package:get/get.dart';

import '../controllers/custom_countries_controller.dart';

class CustomCountriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomCountriesController>(
      () => CustomCountriesController(),
    );
  }
}
