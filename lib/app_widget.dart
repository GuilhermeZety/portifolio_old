




// ignore_for_file: invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portifolio/pages/home/home_page.dart';

import 'styles/custom_theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);
  
  @override
  State<AppWidget> createState() => _AppWidgetState();  
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      // theme: customTheme.theme,
      theme: CustomTheme,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
      },
      initialRoute: '/',
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}