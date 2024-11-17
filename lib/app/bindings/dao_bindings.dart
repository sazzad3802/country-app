import 'package:country_app/app/data/database/dao/country_dao.dart';
import 'package:get/get.dart';

class DaoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CountryDao>(() => CountryDao(), fenix: true);
  }
}
