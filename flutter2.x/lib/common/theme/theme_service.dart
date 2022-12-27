
import 'package:flutter/material.dart';
import 'package:flutter2_10_5/common/theme/color_schemes.dart';

class Themes {
  static final oneTheme = ThemeData(
    colorScheme: oneColorScheme,
    fontFamily: 'PingFang',
    useMaterial3: true,
    primaryColor: oneColorScheme.primary,
  );

  static final darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: 'PingFang',
    useMaterial3: true,
    primaryColor: darkColorScheme.primary,
  );
}