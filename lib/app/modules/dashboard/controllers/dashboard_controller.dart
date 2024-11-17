import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startExplore() async {
    Get.toNamed(Routes.COUNTRY_VIEW);
  }

  void showCustomCountries() async {
    // Get.offAndToNamed(Routes.REGISTRATION);
  }
}
