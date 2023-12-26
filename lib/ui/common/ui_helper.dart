import 'package:flutter/material.dart';
import 'package:smart_fit/ui/common/app_color.dart';


const Widget verticalSpaceTiny = SizedBox(height: 4);
const Widget verticalSpaceSmall = SizedBox(height: 8);
const Widget verticalSpaceMediumSmall = SizedBox(height: 12);
const Widget verticalSpaceMedium = SizedBox(height: 16);
const Widget verticalSpaceMediumLarge = SizedBox(height: 24);
const Widget verticalSpaceLarge = SizedBox(height: 32);
const Widget horizontalSpaceTiny = SizedBox(width: 4);
const Widget horizontalSpaceSmall = SizedBox(width: 8);
const Widget horizontalSpaceMediumSmall = SizedBox(width: 12);
const Widget horizontalSpaceMedium = SizedBox(width: 16);
const Widget horizontalSpaceLarge = SizedBox(width: 32);

InputDecoration defaultInputDecoration({String? hintText, Widget? suffixIcon}) => InputDecoration(
      suffixIcon: suffixIcon,
      fillColor: Colors.white,
      filled: true,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: outlineColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: outlineColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: outlineColor, width: 1),
      ),
      hintText: hintText,
    );

InputDecoration disabledInputDecoration({String? hintText, Widget? suffixIcon}) => InputDecoration(
      suffixIcon: suffixIcon,
      fillColor: disabledFormBackground,
      filled: true,
      errorMaxLines: 2,
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: outlineColor, width: 1),
      ),
      hintText: hintText,
    );

InputDecoration memoInputDecoration({String? hintText, Widget? suffixIcon}) => InputDecoration(
      suffixIcon: suffixIcon,
      fillColor: Colors.white,
      filled: true,
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide.none,
      ),
      hintText: hintText,
    );

InputDecoration labelInputDecoration({String? labelText, String? hintText, Widget? suffixIcon}) =>
    InputDecoration(
      suffixIcon: suffixIcon,
      fillColor: Colors.white,
      filled: true,
      errorMaxLines: 2,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: hintText,
      labelText: labelText,
      contentPadding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
    );

const List<Shadow> defaultShadow = [
  Shadow(
    offset: Offset(0, 2),
    color: Colors.black,
  ),
];

const List<BoxShadow> defaultBoxShadow = [
  BoxShadow(
    offset: Offset(0, 2),
    color: boxShadowColor,
  )
];
