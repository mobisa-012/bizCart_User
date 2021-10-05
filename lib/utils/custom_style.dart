import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(
      color: CustomColor.greyColor,
      fontSize: Dimensions.defaultTextSize
  );

  static var hintTextStyle = TextStyle(
      color: Colors.grey.withOpacity(0.5),
      fontSize: Dimensions.defaultTextSize
  );

  static var listStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.defaultTextSize,
  );

  static var defaultStyle = TextStyle(
      color: Colors.black,
      fontSize: Dimensions.largeTextSize
  );

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
  );

  static var searchBox = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Colors.black),
  );
}