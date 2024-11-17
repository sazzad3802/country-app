import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

class CustomCircleButton extends StatelessWidget {
  Function() onTap;
  String title;
  bool isLoading = false;

  CustomCircleButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200),
      ),
      color: AppColor.white.withOpacity(.5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ClipOval(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Material(
              color: AppColor.primary,
              child: InkWell(
                  onTap: onTap,
                  child: isLoading
                      ? const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: AppColor.accent,
                            strokeWidth: 8,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.touch_app,
                              color: Colors.white,
                              size: 30,
                            ),
                            10.height,
                            Text(
                              title.tr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
