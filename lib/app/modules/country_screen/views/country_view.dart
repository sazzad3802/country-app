import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/country_controller.dart';
import 'filter_drawer.dart';

class CountryView extends BaseView<CountryController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Countries'),
      ),
      endDrawer: FilterDrawer(),
      body: _body(),
    );
  }

  Widget _body() => SizedBox(
        height: hp(100),
        width: wp(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select a currency"),
                  10.height,
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: wp(50),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedCurrency.value,
                          items: controller.currencies.entries.map((entry) {
                            return DropdownMenuItem<String>(
                              value: entry.key,
                              child: Text(entry.key),
                            );
                          }).toList(),
                          onChanged: (value) => controller.setCurrency(value),
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.height,
              CustomButton(
                text: 'Find countries',
                textSize: 14,
                textColor: AppColor.white,
                bg: AppColor.primary.withOpacity(0.6),
                borderColor: AppColor.primary,
                tap: () => controller.fetchCountries(
                    isLoadMore: true, findCountry: true),
                width: wp(30),
                height: 40,
              ),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('List of countries'),
                  CustomButton(
                    text: 'Filter',
                    textSize: 10,
                    textColor: AppColor.white,
                    bg: AppColor.accent,
                    borderColor: AppColor.accent,
                    tap: () => _scaffoldKey.currentState?.openEndDrawer(),
                    width: wp(20),
                    height: 30,
                  ),
                ],
              ),
              20.height,
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
                      : controller.countries.isEmpty
                          ? Center(child: Text('No countries available'))
                          : NotificationListener<ScrollNotification>(
                              onNotification: (scrollInfo) {
                                if (scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent &&
                                    controller.hasMore.value &&
                                    !controller.rxLoading.value) {
                                  controller.fetchCountries(
                                      isLoadMore: true, findCountry: false);
                                }
                                return false;
                              },
                              child: ListView.builder(
                                itemCount: controller.countries.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < controller.countries.length) {
                                    final region = controller.countries[index];
                                    return InkWell(
                                      onTap: () =>
                                          controller.gotoRegion(region),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  Colors.grey.withOpacity(0.4)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          region.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (controller.hasMore.value) {
                                    return const Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                },
                              ),
                            ),
                ),
              ),
              10.height,
            ],
          ),
        ),
      );
}
