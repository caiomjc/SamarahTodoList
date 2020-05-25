import 'package:flutter/material.dart';

ThemeData basicTheme() {
  return ThemeData(
    primaryColor: Colors.amber,
    accentColor: Colors.amber,
    fontFamily: 'Lora',
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      subtitle2: TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
      headline4: TextStyle(
        color: Colors.amber,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      caption: TextStyle(
        color: Colors.amber,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.amber,
    ),
    textSelectionHandleColor: Colors.amber,
  );
}
