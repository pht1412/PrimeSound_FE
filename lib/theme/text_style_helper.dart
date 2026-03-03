import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title20BoldInter => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get title16BoldInter => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15BoldInter => TextStyle(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body13BoldInter => TextStyle(
    fontSize: 13.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get body12BoldInter => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10BoldInter => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.white_A700,
  );

  TextStyle get label8BoldInter => TextStyle(
    fontSize: 8.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.gray_400,
  );
}
