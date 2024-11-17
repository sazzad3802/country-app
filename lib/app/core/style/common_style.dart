import 'package:flutter/material.dart';

import '../values/app_colors.dart';

class CommonStyle {
  ///textfield style
  static InputDecoration textFieldStyle({
    String labelTextStr = "",
    String hintTextStr = "",
    double verPadding = 0.0,
    double horPadding = 0.0,
    double borderRadius = 10,
    Color fillColor = Colors.white,
    Color borderColor = Colors.grey,
    Color focusBorderColor = Colors.grey,
    Color focusColor = Colors.white,
    Color hintColor = Colors.white,
    InputBorder inputBorder = InputBorder.none,
    Widget? suffixIcon,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      border: inputBorder,
      alignLabelWithHint: true,
      fillColor: fillColor,
      hintText: hintTextStr,
      label: labelTextStr.isNotEmpty ? Text(labelTextStr) : null,
      hintStyle: TextStyle(color: hintColor),
      suffixStyle: TextStyle(color: borderColor),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      errorStyle: const TextStyle(fontSize: 15),
      filled: true,
      isDense: true,
      contentPadding:
          EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusBorderColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }

  static InputDecoration dropDownFieldStyle(
      {String labelTextStr = "",
      String hintTextStr = "",
      double verPadding = 0.0,
      double horPadding = 0.0,
      Color fillColor = Colors.white,
      Color borderColor = Colors.grey,
      InputBorder inputBorder = InputBorder.none,
      Widget? suffixIcon}) {
    return InputDecoration(
      border: inputBorder,
      alignLabelWithHint: true,
      fillColor: fillColor,
      hintText: hintTextStr,
      label: Text(labelTextStr),
      hintStyle: TextStyle(color: borderColor),
      suffixStyle: TextStyle(color: borderColor),
      suffixIcon: suffixIcon,
      filled: true,
      isDense: true,
      contentPadding:
          EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: borderColor),
      ),
    );
  }

  static InputDecoration textFieldStyleWithHint({
    String hintTextStr = "",
    double verPadding = 0.0,
    double horPadding = 0.0,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      alignLabelWithHint: true,
      fillColor: Colors.white,
      hintText: hintTextStr,
      filled: true,
      contentPadding:
          EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.grey),
      ),
    );
  }

  ///textfield style date picker
  static InputDecoration textFieldStyleDatePicker({
    String labelTextStr = "",
    String hintTextStr = "",
    double verPadding = 0.0,
    double horPadding = 0.0,
    Color borderColor = Colors.grey,
    Color focusColor = Colors.white,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        alignLabelWithHint: true,
        fillColor: Colors.white,
        hintText: hintTextStr,
        label: Text(labelTextStr),
        filled: true,
        isDense: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: focusColor)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: const Icon(Icons.date_range));
  }

  ///text field style date picker
  static InputDecoration textFieldStyleSearch({
    String labelTextStr = "",
    String hintTextStr = "",
    double verPadding = 0.0,
    double horPadding = 0.0,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.white,
        hintText: hintTextStr,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            EdgeInsets.symmetric(vertical: verPadding, horizontal: horPadding),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        prefixIcon: const Icon(Icons.search));
  }

  ///border radius five with white bg
  static BoxDecoration decorationWithRadiusFive() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
    );
  }

  static BoxDecoration decorationWithRadiusTen() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.blueAccent);
  }
}
