import 'dart:convert';

import 'package:country_app/app/data/models/custom_country.dart';
import 'package:country_app/app/enums/update_status.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../core/base/general_response.dart';
import '../../../core/values/app_string.dart';
import '../../../data/repository/country_repo.dart';

class AddEditCountriesController extends GetxController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var latController = TextEditingController();
  var longController = TextEditingController();
  var populationController = TextEditingController();
  var rxLoading = false.obs;
  var rxSubmitName = "".obs;
  var gid = 0;

  final CountryRepo _countryRepo = Get.find();
  var rxCustomCountry = CustomCountry().obs;

  @override
  void onInit() {
    super.onInit();
    try {
      String countryJson = Get.arguments[AppString.customCountryObj];
      if (countryJson.isNotEmpty) {
        rxSubmitName.value = UpdateStatusEnum.Update.name;
        rxCustomCountry.value = CustomCountry.fromJson(jsonDecode(countryJson));
        gid = rxCustomCountry.value.gid!;
        nameController.text = rxCustomCountry.value.name!;
        latController.text = rxCustomCountry.value.latitude!;
        longController.text = rxCustomCountry.value.longitude!;
        populationController.text = rxCustomCountry.value.population!;
      }
    } catch (ex) {
      rxSubmitName.value = UpdateStatusEnum.Add.name;
    }
  }

  bool isValid() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide name");
      return false;
    }
    if (latController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide latitude");
      return false;
    }
    if (longController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide longitude");
      return false;
    }
    if (populationController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide population");
      return false;
    }
    return true;
  }

  void addEditCountry() async {
    if (isValid()) {
      var payload = await processCountry();
      GeneralResponse generalResponse =
          rxSubmitName.value == UpdateStatusEnum.Update.name
              ? await _countryRepo.updateCountry(payload)
              : await _countryRepo.insertCountry(payload);
      if (generalResponse.statusCode == 200) {
        Get.back(result: true);
      }
    }
  }

  Future<CustomCountry> processCountry() async {
    var finalVal = CustomCountry();
    finalVal.gid = gid;
    finalVal.name = nameController.text;
    finalVal.latitude = latController.text;
    finalVal.longitude = longController.text;
    finalVal.population = populationController.text;
    return finalVal;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
