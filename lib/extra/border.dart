import 'package:flutter/material.dart';

import 'dimens.dart';


class BorderDimensions {
  BorderDimensions._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.BorderRadius),
      borderSide: BorderSide(color: Colors.red));

  static OutlineInputBorder whiteInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimens.BorderRadius),
      borderSide: BorderSide(color: Colors.red));


  static OutlineInputBorder goalInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.red));

  static EdgeInsets edgeInsets = const EdgeInsets.only(
      left: Dimens.editTextField_left_padding,
      top: Dimens.editTextField_top_padding,
      right: Dimens.editTextField_right_padding);

  static EdgeInsets contentPadding = const EdgeInsets.only(
      left: Dimens.Content_Padding, right: Dimens.Content_Padding);

  static EdgeInsets zeroPadding = const EdgeInsets.only(
      left: 0.0, right: 0.0);


  static EdgeInsets textPadding = const EdgeInsets.only(
      left: Dimens.Content_Padding, right: Dimens.Content_Padding);

  static EdgeInsets editTextFieldPadding = const EdgeInsets.only(
      left: Dimens.nameTextField_left_padding, top: Dimens.nameTextField_top_padding);

  static EdgeInsets headerPadding = const EdgeInsets.only(
      left:30,top: 10,bottom: 50);

  static ShapeBorder shapeBoarder=  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0));
}
