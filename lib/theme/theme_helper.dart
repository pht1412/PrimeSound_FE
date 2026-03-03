import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = "lightCode";

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get green_900 => Color(0xFF008000);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get gray_600 => Color(0xFF808080);
  Color get black_900 => Color(0xFF000000);
  Color get blue_gray_100 => Color(0xFFD0CFCE);
  Color get green_A200 => Color(0xFF59F678);
  Color get green_A700 => Color(0xFF00AB22);
  Color get green_A700_7f => Color(0x7F00FF33);
  Color get cyan_800 => Color(0xFF008686);
  Color get cyan_100 => Color(0xFFC1FFF3);
  Color get indigo_800_e5 => Color(0xE5252698);
  Color get indigo_900_99 => Color(0x9900035B);
  Color get green_A700_01 => Color(0xFF1DB954);
  Color get indigo_A700 => Color(0xFF0000FF);
  Color get gray_400 => Color(0xFFB3B3B3);
  Color get gray_900 => Color(0xFF1E1E1E);
  Color get gray_800 => Color(0xFF3D3D3D);
  Color get gray_400_01 => Color(0xFFBBBBBB);
  Color get gray_900_01 => Color(0xFF121212);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get greyCustom => Colors.grey;
  Color get color7F1DB9 => Color(0x7F1DB954);
  Color get color337F00 => Color(0x337F00FF);
  Color get color98E525 => Color(0x98E52526);
  Color get color5B9900 => Color(0x5B990003);
  Color get color888888 => Color(0x88888888);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
