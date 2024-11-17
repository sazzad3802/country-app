import 'package:country_app/app/modules/add_edit_countries/bindings/add_edit_countries_binding.dart';
import 'package:country_app/app/modules/add_edit_countries/views/add_edit_countries_view.dart';
import 'package:country_app/app/modules/cities_screen/bindings/cities_binding.dart';
import 'package:country_app/app/modules/cities_screen/views/cities_view.dart';
import 'package:country_app/app/modules/country_screen/bindings/country_binding.dart';
import 'package:country_app/app/modules/country_screen/views/country_view.dart';
import 'package:country_app/app/modules/custom_countries/bindings/custom_countries_binding.dart';
import 'package:country_app/app/modules/custom_countries/views/custom_countries_view.dart';
import 'package:country_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:country_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:country_app/app/modules/login/bindings/login_binding.dart';
import 'package:country_app/app/modules/login/views/login_view.dart';
import 'package:country_app/app/modules/region_screen/bindings/region_binding.dart';
import 'package:country_app/app/modules/region_screen/views/region_view.dart';
import 'package:country_app/app/modules/registration/views/registration_view.dart';
import 'package:get/get.dart';

import '../modules/registration/bindings/registration_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY_VIEW,
      page: () => CountryView(),
      binding: CountryBinding(),
    ),
    GetPage(
      name: _Paths.REGION_VIEW,
      page: () => RegionView(),
      binding: RegionBinding(),
    ),
    GetPage(
      name: _Paths.CITY_VIEW,
      page: () => CityView(),
      binding: CityBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_COUNTRIES_VIEW,
      page: () => CustomCountriesView(),
      binding: CustomCountriesBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_COUNTRIES_VIEW,
      page: () => AddEditCountriesView(),
      binding: AddEditCountriesBinding(),
    ),
  ];
}
