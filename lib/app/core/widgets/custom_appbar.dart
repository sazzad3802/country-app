import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

Widget customAppbar({required String title, bool isWelcomeAppbar = true}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.height,
                  Text(title,
                      style: const TextStyle(
                          color: AppColor.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
