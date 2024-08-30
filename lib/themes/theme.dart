import 'package:crypto_mobile/constants/palettes.dart';
import 'package:crypto_mobile/themes/text_style.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.light,
    primaryColor: paleLavender,
    scaffoldBackgroundColor: paleLavender,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: darkTeal),
      displayMedium: TextStyle(color: darkTeal),
      displaySmall: TextStyle(color: darkTeal),
      bodyLarge: TextStyle(color: deepPurple),
      bodyMedium: TextStyle(color: deepPurple),
      bodySmall: TextStyle(color: deepPurple),
      titleMedium: darkBoldMediumTextStyle,
    ),
    appBarTheme: AppBarTheme(
      elevation: 6.0,
      centerTitle: true,
      color: mintGreen,
      titleTextStyle: darkMediumTextStyle.copyWith(fontFamily: 'Inter'),
      shadowColor: mintGreen,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: mintGreen,
      elevation: 6.0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      selectedItemColor: deepPurple,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: deepBlue,
      filled: true,
      fillColor: paleLavender,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: deepBlue.withOpacity(0.2),
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: darkBoldMediumTextStyle,
      contentTextStyle: darkSmallTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: paleLavender,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkTeal, // Text color
        // backgroundColor: Colors.blue, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Button shape
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        textStyle: darkBoldMediumTextStyle,
      ),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(paleLavender),
      trackColor: WidgetStatePropertyAll(softYellow),
    ));

final ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    brightness: Brightness.dark,
    primaryColor: deepPurple,
    scaffoldBackgroundColor: deepBlue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: softYellow),
      displayMedium: TextStyle(color: softYellow),
      displaySmall: TextStyle(color: softYellow),
      bodyLarge: TextStyle(color: softYellow),
      bodyMedium: TextStyle(color: softYellow),
      bodySmall: TextStyle(color: softYellow),
      titleMedium: lightBoldMediumTextStyle,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.01,
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
      selectedItemColor: babyBlue,
      unselectedItemColor: paleLavender,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: babyBlue,
      filled: true,
      fillColor: deepBlue,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: babyBlue,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      border: OutlineInputBorder(
        borderSide: const BorderSide(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: lightBoldMediumTextStyle,
      contentTextStyle: lightSmallTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: deepBlue,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: babyBlue, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Button shape
        ),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24),
        textStyle: darkBoldMediumTextStyle,
      ),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(paleLavender),
      trackColor: WidgetStatePropertyAll(softYellow),
    ));
