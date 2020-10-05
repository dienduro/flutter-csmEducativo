import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/home-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/notas_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/splash_screen.dart';

Map<String, WidgetBuilder> getPageRoutes() {
  return <String, WidgetBuilder>{
    'home': (context) => HomePage(),
    'splash': (context) => SplashScreen(),
    'institution': (context) => InstPage(),
    'login': (context) => LoginPage(),
    'notes': (context) => NotasPage(),
  };
}
