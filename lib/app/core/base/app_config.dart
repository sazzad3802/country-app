import 'package:flutter/material.dart';

enum Flavor { production, development, staging }

class AppConfig {
  String appName = "";
  String baseUrl = "";
  Color primaryColor = Colors.blue;
  Flavor flavor = Flavor.development;

  static AppConfig shared = AppConfig.create();

  factory AppConfig.create({
    String appName = "",
    String baseUrl = "",
    Color primaryColor = Colors.blue,
    Flavor flavor = Flavor.development,
  }) {
    return shared = AppConfig(appName, baseUrl, primaryColor, flavor);
  }

  AppConfig(this.appName, this.baseUrl, this.primaryColor, this.flavor);
}
