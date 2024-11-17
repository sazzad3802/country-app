import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var usernameController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var emailController = TextEditingController();

  var isLoading = false.obs;
  var passwordIsObscure = true.obs;
  var conformPasswordIsObscure = true.obs;

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

  void signup() async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Get.offAndToNamed(Routes.DASHBOARD);
      }
    }
  }

  void login() async {
    Get.back();
  }
}
