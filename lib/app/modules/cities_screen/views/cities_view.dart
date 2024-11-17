import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../data/models/city.dart';
import '../controllers/cities_controller.dart';
import 'filter_drawer.dart';

class CityView extends BaseView<CityController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('City'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              30.height,
              Text('Region selected: ${controller.parentRegion.name}'),
              10.height,
              Obx(() =>
                  Text('Total number of cities: ${controller.totalCount}')),
              30.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('List of cities'),
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
                      : controller.cities.isEmpty
                          ? Center(child: Text('No cities available'))
                          : NotificationListener<ScrollNotification>(
                              onNotification: (scrollInfo) {
                                if (scrollInfo.metrics.pixels ==
                                        scrollInfo.metrics.maxScrollExtent &&
                                    controller.hasMore.value &&
                                    !controller.rxLoading.value) {
                                  controller.fetchCities(isLoadMore: true);
                                }
                                return false;
                              },
                              child: GetBuilder<CityController>(
                                builder: (controller) {
                                  return Expanded(
                                    child: ListView.builder(
                                      itemCount: controller.cities.length,
                                      itemBuilder: (context, index) {
                                        final city = controller.cities[index];
                                        return CustomItem(mCity: city);
                                      },
                                    ),
                                  );
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

class CustomItem extends StatelessWidget {
  final City mCity;
  CustomItem({super.key, required this.mCity});

  @override
  Widget build(BuildContext context) {
    CityController controller = Get.find();
    final isExpanded = controller.expandedCities[mCity.id] ?? false;

    return GetBuilder<CityController>(
      id: 'city_${mCity.id}',
      builder: (controller) {
        return Card(
          key: ValueKey(mCity.id),
          child: Column(
            children: [
              ListTile(
                title: Text(mCity.name),
                trailing: IconButton(
                  icon:
                      Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () => controller.toggleExpansion(mCity.id),
                ),
              ),
              if (isExpanded)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Longitude: ${mCity.longitude}"),
                      Text("Latitude: ${mCity.latitude}"),
                      Text("Population: ${mCity.population}"),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
