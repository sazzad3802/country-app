import 'package:get/get.dart';

import '../controllers/add_edit_countries_controller.dart';

class AddEditCountriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditCountriesController>(
      () => AddEditCountriesController(),
    );
  }
}
