import 'package:country_app/app/extensions/space_extension.dart';
import 'package:country_app/app/modules/custom_countries/controllers/custom_countries_controller.dart';
import 'package:country_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class CustomCountriesView extends BaseView<CustomCountriesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom countries'),
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.gotoAddEditCountry(false),
        child: const Icon(
          Icons.add,
          size: 40,
          color: AppColor.primary,
        ),
      ),
    );
  }

  Widget _body() => Container(
        height: hp(100),
        width: wp(100),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              30.height,
              const Text('Your custom countries'),
              30.height,
              Obx(
                () => Expanded(
                    child: controller.rxLoading.value
                        ? Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              color: AppColor.primary,
                              strokeWidth: 5,
                            ),
                          )
                        : controller.customCountries.isEmpty
                            ? const Center(
                                child: Text('No custom countries available'))
                            : ListView.builder(
                                itemCount: controller.customCountries.length,
                                itemBuilder: (context, index) {
                                  final cc = controller.customCountries[index];
                                  return InkWell(
                                    onTap: () => controller.gotoAddEditCountry(
                                      true,
                                      prevCountry: cc,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 20,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.grey.withOpacity(0.4)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cc.name!,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () =>
                                                controller.deleteItem(cc),
                                            child: const Icon(
                                              Icons.delete_forever,
                                              size: 30,
                                              color: Colors.deepOrangeAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )),
              ),
              10.height,
            ],
          ),
        ),
      );
}
