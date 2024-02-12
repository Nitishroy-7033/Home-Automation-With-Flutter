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
    inputDecorationTheme: InputDecorationTheme(
      fillColor: dBgColor,
      filled: true,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: dOnBgColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: dOnBgColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: dOnBgColor,
      ),
    ));
