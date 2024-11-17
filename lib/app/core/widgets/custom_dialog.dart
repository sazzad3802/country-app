import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

class CustomDialog {
  static show(
      {required String title,
      required String msg,
      required String positiveTxt,
      String? negativeTxt,
      required Function() onConfirm,
      Function()? onCancel}) {
    Get.defaultDialog(
        title: title,
        middleText: msg,
        barrierDismissible: false,
        buttonColor: AppColor.primary,
        contentPadding: const EdgeInsets.all(20),
        textConfirm: positiveTxt,
        textCancel: negativeTxt,
        onConfirm: onConfirm,
        onCancel: onCancel);
  }
}
