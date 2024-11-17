import 'package:country_app/app/data/repository/country_repo.dart';
import 'package:get/get.dart';

class RepositoryBindings extends Bindings {
  @override
  void dependencies() {
    ///repositories
    Get.lazyPut<CountryRepo>(() => CountryRepo(), fenix: true);
  }
}
