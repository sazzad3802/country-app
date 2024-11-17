import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var formKey = GlobalKey<FormState>();

  var usernameController = TextEditingController(text: "test");
  var passwordController = TextEditingController(text: "1234");

  var isLoading = false.obs;
  var isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool isValid() {
    if (usernameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide username");
      return false;
    }
    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "must provide password");
      return false;
    }
    return true;
  }

  void login() async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Get.offAndToNamed(Routes.DASHBOARD);
      }
    }
  }

  void signup() async {
    Get.offAndToNamed(Routes.REGISTRATION);
  }
}
