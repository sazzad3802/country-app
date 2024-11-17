import 'package:country_app/app/extensions/space_extension.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/style/common_style.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends BaseView<RegistrationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() => SingleChildScrollView(
        child: Container(
          height: hp(100),
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    20.height,
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    24.height,
                    TextFormField(
                      controller: controller.nameController,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'First Name',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Last Name',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.addressController,
                      textAlign: TextAlign.start,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Address',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.emailController,
                      textAlign: TextAlign.start,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Email',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    TextFormField(
                      controller: controller.phoneController,
                      maxLength: 11,
                      decoration: CommonStyle.textFieldStyle(
                        labelTextStr: 'Phone Number',
                        horPadding: 15,
                        verPadding: 15,
                        fillColor: AppColor.white,
                        borderColor: AppColor.grey,
                        focusBorderColor: AppColor.primary,
                      ),
                    ),
                    10.height,
                    Obx(
                      () => TextFormField(
                        obscureText:
                            controller.passwordIsObscure.value ? true : false,
                        controller: controller.passwordController,
                        decoration: CommonStyle.textFieldStyle(
                          labelTextStr: 'Password',
                          horPadding: 10,
                          verPadding: 15,
                          fillColor: AppColor.white,
                          borderColor: AppColor.grey,
                          focusBorderColor: AppColor.primary,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.passwordIsObscure.value =
                                    !controller.passwordIsObscure.value;
                              },
                              icon: Icon(
                                  controller.passwordIsObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey)),
                        ),
                      ),
                    ),
                    10.height,
                    Obx(
                      () => TextFormField(
                        obscureText: controller.conformPasswordIsObscure.value
                            ? true
                            : false,
                        controller: controller.confirmPasswordController,
                        decoration: CommonStyle.textFieldStyle(
                          labelTextStr: 'Confirm Password',
                          horPadding: 10,
                          verPadding: 15,
                          fillColor: AppColor.white,
                          borderColor: AppColor.grey,
                          focusBorderColor: AppColor.primary,
                          suffixIcon: IconButton(
                              onPressed: () {
                                controller.conformPasswordIsObscure.value =
                                    !controller.conformPasswordIsObscure.value;
                              },
                              icon: Icon(
                                  controller.conformPasswordIsObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.height,
              Obx(
                () => CustomButton(
                    text: 'REGISTER',
                    textSize: 20,
                    isLoading: controller.isLoading.value,
                    textColor: AppColor.white,
                    bg: AppColor.primary,
                    borderColor: AppColor.primary,
                    tap: controller.signup,
                    width: wp(40),
                    height: 50),
              ),
              10.height,
              TextButton(
                  onPressed: controller.login,
                  child: const Text.rich(TextSpan(
                      text: 'Already have an account?  ',
                      style: TextStyle(color: AppColor.grey, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ]))),
            ],
          ),
        ),
      );
}
