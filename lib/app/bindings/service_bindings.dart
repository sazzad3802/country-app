import 'package:country_app/app/data/services/country_service.dart';
import 'package:get/get.dart';

class ServiceBindings extends Bindings {
  @override
  void dependencies() {
    ///services
    Get.lazyPut<CountryService>(() => CountryService(), fenix: true);
  }
}
