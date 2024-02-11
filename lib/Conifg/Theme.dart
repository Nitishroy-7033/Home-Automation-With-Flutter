import 'package:flutter/material.dart';
import 'package:smart_home/Conifg/Colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
);
var darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: dBgColor,
    onBackground: dOnBgColor,
    primaryContainer: dContainerColor,
    onPrimaryContainer: dOnContainer,
    primary: dPrimaryColor,
  ),
);
