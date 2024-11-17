import 'package:country_app/app/extensions/space_extension.dart';
import 'package:country_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class DashboardView extends BaseView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() => Container(
        height: hp(100),
        width: wp(100),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'DASHBOARD',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                60.height,
                CustomButton(
                    text: 'Start exploring',
                    textSize: 20,
                    textColor: AppColor.white,
                    bg: AppColor.primary.withOpacity(0.8),
                    borderColor: AppColor.primary.withOpacity(0.8),
                    tap: controller.startExplore,
                    width: wp(60),
                    height: 50),
                40.height,
                CustomButton(
                    text: 'Show custom countries',
                    textSize: 20,
                    textColor: AppColor.white,
                    bg: AppColor.primary.withOpacity(0.8),
                    borderColor: AppColor.primary.withOpacity(0.8),
                    tap: controller.showCustomCountries,
                    width: wp(60),
                    height: 50),
              ],
            ),
          ),
        ),
      );
}
