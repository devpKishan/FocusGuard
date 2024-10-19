import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF6200EE);
const Color accentColor = Color(0xFF03DAC5);
const Color backgroundColor = Color(0xFFF6F6F6);
const Color textColor = Color(0xFF000000);

final TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: textColor),
  bodyLarge: TextStyle(fontSize: 16.0, color: textColor),
  bodyMedium: TextStyle(fontSize: 14.0, color: textColor),
);

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.white,
  backgroundColor: primaryColor, // Button text color
);

final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
  labelStyle: TextStyle(color: textColor),
);

final AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: primaryColor,
  titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
  iconTheme: IconThemeData(color: Colors.white),
);

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple, // Define your primary swatch
  ).copyWith(
    primary: primaryColor,
    secondary: accentColor,
    background: backgroundColor,
    onPrimary: Colors.white, // Text color on primary color
  ),
  textTheme: textTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData getAppTheme() {
  return appTheme;
}
