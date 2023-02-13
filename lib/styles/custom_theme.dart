


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:portifolio/utils/util.dart';

ThemeData CustomTheme = ThemeData(
   snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Color(0xFF2D3140)),
      elevation: 7,
    ),    
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF121414),
      elevation: 3,
    ),
    primaryColor: const Color(0xFF575ddb),
    secondaryHeaderColor: const Color(0xFFC1C1C1),
    canvasColor: const Color(0xFFAAAAAA),     
    cardColor: const Color(0xFF20203F),          
    scaffoldBackgroundColor: const Color(0xFF121414),         
    // cardColor: const Color(0xFFAAAAAA),
    unselectedWidgetColor:const Color(0xFFD6D6D6),
    // brightness: Brightness.dark,
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      displayMedium: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      bodyMedium: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      titleMedium: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    ),
    fontFamily: 'Sahitya',
    iconTheme: const IconThemeData(color: Colors.white), colorScheme: ColorScheme.fromSwatch(primarySwatch: createMaterialColor(const Color(0xFF666CDE))).copyWith(background: const Color(0xFF161818))
  );