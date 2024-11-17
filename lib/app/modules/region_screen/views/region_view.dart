import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../controllers/region_controller.dart';
import 'filter_drawer.dart';

class RegionView extends BaseView<RegionController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Regions'),
      ),
      endDrawer: FilterDrawer(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              30.height,
              Text('Country selected: ${controller.parentCountry.name}'),
              10.height,
              Obx(() =>
                  Text('Total number of regions: ${controller.totalCount}')),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('List of regions'),
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
                      : controller.regions.isEmpty
                          ? const Center(child: Text('No regions available'))
                          : NotificationListener<ScrollNotification>(
                              onNotification: (scrollInfo) {
                                if (scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent &&
                                    controller.hasMore.value &&
                                    !controller.rxLoading.value) {
                                  controller.fetchRegions(isLoadMore: true);
                                }
                                return false;
                              },
                              child: ListView.builder(
                                itemCount: controller.regions.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < controller.regions.length) {
                                    final region = controller.regions[index];
                                    return InkWell(
                                      onTap: () => controller.gotoCity(region),
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
