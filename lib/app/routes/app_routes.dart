part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const COUNTRY_VIEW = _Paths.COUNTRY_VIEW;
  static const REGION_VIEW = _Paths.REGION_VIEW;
  static const CITY_VIEW = _Paths.CITY_VIEW;
  static const CUSTOM_COUNTRIES_VIEW = _Paths.CUSTOM_COUNTRIES_VIEW;
  static const ADD_EDIT_COUNTRIES_VIEW = _Paths.ADD_EDIT_COUNTRIES_VIEW;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = '/dashboard';
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
  static const COUNTRY_VIEW = '/country_view';
  static const REGION_VIEW = '/region_view';
  static const CITY_VIEW = '/city_view';
  static const CUSTOM_COUNTRIES_VIEW = '/custom_countries_view';
  static const ADD_EDIT_COUNTRIES_VIEW = '/add_edit_countries_view';
}
