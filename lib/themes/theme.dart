import 'package:crypto_mobile/constants/palettes.dart';
import 'package:crypto_mobile/themes/text_style.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.light,
    primaryColor: mintGreen,
    scaffoldBackgroundColor: paleLavender,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: darkTeal),
      displayMedium: TextStyle(color: darkTeal),
      displaySmall: TextStyle(color: darkTeal),
      bodyLarge: TextStyle(color: deepPurple),
      bodyMedium: TextStyle(color: deepPurple),
      bodySmall: TextStyle(color: deepPurple),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 6.0,
      centerTitle: true,
      color: mintGreen,
      titleTextStyle: darkMediumTextStyle,
      shadowColor: mintGreen,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: mintGreen,
      elevation: 6.0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      selectedItemColor: deepPurple,
    ));

final ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.dark,
    primaryColor: deepPurple,
    scaffoldBackgroundColor: darkTeal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: softPink),
      displayMedium: TextStyle(color: softPink),
      displaySmall: TextStyle(color: softPink),
      bodyLarge: TextStyle(color: paleLavender),
      bodyMedium: TextStyle(color: paleLavender),
      bodySmall: TextStyle(color: paleLavender),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 6.0,
      centerTitle: true,
      color: deepOlive,
      titleTextStyle: lightMediumTextStyle,
      shadowColor: paleLavender,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: deepOlive,
      elevation: 6.0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      selectedItemColor: paleLavender,
    ));
