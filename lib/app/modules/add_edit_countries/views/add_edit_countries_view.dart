import 'package:country_app/app/extensions/space_extension.dart';
import 'package:country_app/app/modules/add_edit_countries/controllers/add_edit_countries_controller.dart';
import 'package:country_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/style/common_style.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class AddEditCountriesView extends BaseView<AddEditCountriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update your country'),
      ),
      body: _body(),
    );
  }

  Widget _body() => Container(
        height: hp(100),
        width: wp(100),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    50.height,
                    TextFormField(
                      controller: controller.nameController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.text,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Name',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.longController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Longitude',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.latController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Latitude',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.populationController,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Population',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                  ],
                ),
              ),
              20.height,
              Obx(
                () => CustomButton(
                    text: controller.rxSubmitName.value,
                    textSize: 20,
                    isLoading: controller.rxLoading.value,
                    textColor: AppColor.white,
                    bg: AppColor.primary,
                    borderColor: AppColor.primary,
                    tap: controller.addEditCountry,
                    width: wp(40),
                    height: 50),
              ),
              10.height,
            ],
          ),
        ),
      );
}
