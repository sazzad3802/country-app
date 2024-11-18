import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'app/bindings/initial_bindings.dart';
import 'app/core/base/app_config.dart';
import 'app/core/values/app_colors.dart';
import 'app/core/values/app_string.dart';
import 'app/data/database/shared_pref.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await SharedPref.init();

  AppConfig.create(
    appName: AppString.appName,
    baseUrl: AppString.baseURL,
    primaryColor: Colors.yellow,
    flavor: Flavor.development,
  );

  runApp(
    GetMaterialApp(
      initialBinding: InitialBindings(),
      title: AppString.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
      ),
    ),
  );
}
