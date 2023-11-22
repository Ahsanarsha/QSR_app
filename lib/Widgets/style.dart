import 'package:flutter/material.dart';

// class StyleScreen {
  final ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: const Color(0xff212129),
    secondaryHeaderColor: Colors.white,
    backgroundColor: Colors.black,
    hintColor: const Color(0xffA3A3A3),
    // primaryColor: kPrimaryColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(),
    ),
    iconTheme: const IconThemeData(),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),displayMedium: TextStyle(
        color: Colors.white,fontWeight: FontWeight.bold
      ),
    )
  );
// }
