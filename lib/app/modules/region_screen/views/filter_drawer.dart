import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../enums/sort_status.dart';
import '../controllers/region_controller.dart';

class FilterDrawer extends BaseView<RegionController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.height,
            Obx(
              () => TextField(
                decoration: const InputDecoration(labelText: "Keyword"),
                controller: controller.searchController.value,
                onChanged: (value) => controller.setSearch(value),
              ),
            ),
            20.height,
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
                    value: controller.rxSelectedSortStatus.value,
                    items: controller.rxSortList.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry,
                        child: Text(entry),
                      );
                    }).toList(),
                    onChanged: (value) => controller.setSort(value!),
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            20.height,
            CustomButton(
                text: 'Apply',
                textSize: 16,
                textColor: AppColor.white,
                bg: AppColor.primary.withOpacity(0.5),
                borderColor: AppColor.primary.withOpacity(0.5),
                tap: () {
                  controller.applyFilters();
                  Get.back();
                },
                width: wp(30),
                height: 30),
            10.height,
          ],
        ),
      ),
    );
  }
}
