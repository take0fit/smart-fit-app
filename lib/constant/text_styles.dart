import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_fit/ui/common/app_color.dart';

class FontFamily {
  static const String primary = 'Gilroy';
}

class AppTextStyle {
  static TextStyle get defaultHeaderOne => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.primary,
    color: textColor
    // height: 1.3,
  );

  static TextStyle get defaultStyle => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondTextColor,
    fontFamily: FontFamily.primary,
    // color: AppColor.secondTextColor,
    // height: 1.6,
  );
  static TextStyle get defaultStyleMedium => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: primaryColor,
    fontFamily: FontFamily.primary,
    // color: AppColor.secondTextColor,
    // height: 1.6,
  );

  static TextStyle get defaultHeaderTwo => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.primary,
    color: textColor,
    // height: 1.6,
  );

  static TextStyle get defaultHeaderThree => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: FontFamily.primary,
    color: textColor,
    // height: 1.6,
  );
  static TextStyle get smallText => const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.primary,
    color: primaryColor,
    // height: 1.6,
  );
  static TextStyle get desc => const TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.primary,
    color: secondTextColor,
    // height: 1.6,
  );
  static TextStyle get loca => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.primary,
    color: textColor,
    // height: 1.6,
  );
  static TextStyle get loca2 => const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.primary,
      color: thirdTextColor
    // height: 1.6,
  );
  static TextStyle get category => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: FontFamily.primary,
    color: secondTextColor,
    // height: 1.6,
  );
}
