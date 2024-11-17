import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/style/common_style.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() => Container(
      height: hp(100),
      width: wp(100),
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
              child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'SIGN IN',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      50.height,
                      TextFormField(
                        controller: controller.usernameController,
                        keyboardType: TextInputType.phone,
                        decoration: CommonStyle.textFieldStyle(
                            labelTextStr: 'Email',
                            horPadding: 10,
                            verPadding: 15,
                            fillColor: AppColor.white,
                            borderColor: AppColor.grey,
                            focusBorderColor: AppColor.primary,
                            prefixIcon: const Icon(Icons.email,
                                color: AppColor.iconColor)),
                      ),
                      50.height,
                      Obx(
                        () => TextFormField(
                          obscureText:
                              controller.isObscure.value ? true : false,
                          controller: controller.passwordController,
                          decoration: CommonStyle.textFieldStyle(
                            labelTextStr: 'Password',
                            horPadding: 10,
                            verPadding: 15,
                            fillColor: AppColor.white,
                            borderColor: AppColor.grey,
                            focusBorderColor: AppColor.primary,
                            prefixIcon: const Icon(Icons.lock,
                                color: AppColor.iconColor),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isObscure.value =
                                      !controller.isObscure.value;
                                },
                                icon: Icon(
                                    controller.isObscure.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey)),
                          ),
                        ),
                      ),
                      40.height,
                      Obx(
                        () => CustomButton(
                            text: 'LOGIN',
                            isLoading: controller.isLoading.value,
                            textSize: 20,
                            textColor: AppColor.white,
                            bg: AppColor.primary,
                            borderColor: AppColor.primary,
                            tap: controller.login,
                            width: wp(40),
                            height: 50),
                      ),
                      24.height,
                      InkWell(
                        onTap: controller.signup,
                        child: TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTRATION),
                            child: const Text.rich(TextSpan(
                                text: 'Dont have an account?  ',
                                style: TextStyle(
                                    color: AppColor.grey, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Signup',
                                    style: TextStyle(
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ]))),
                      ),
                      16.height,
                    ],
                  )))));
}
