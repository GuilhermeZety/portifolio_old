


// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utils/util.dart';

ThemeData CustomTheme = ThemeData(
   snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: Color(0xFF2D3140)),
      elevation: 7,
    ),    
    primaryColor: const Color(0xFF575ddb),
    secondaryHeaderColor: const Color(0xFFD6D6D6),
    canvasColor: const Color(0xFFAAAAAA),
    backgroundColor: const Color(0xFF161818),     
    cardColor: const Color(0xFF20203F),          
    scaffoldBackgroundColor: const Color(0xFF121414),        
    primarySwatch: createMaterialColor(const Color(0xFF666CDE)),         
    // cardColor: const Color(0xFFAAAAAA),
    unselectedWidgetColor:const Color(0xFFD6D6D6),
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      headline2: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      bodyText2: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
      subtitle1: TextStyle(color: Color(0xFFD6D6D6), fontSize: 16),
    ),
    fontFamily: 'Sahitya',
    iconTheme: const IconThemeData(color: Colors.white)
  );