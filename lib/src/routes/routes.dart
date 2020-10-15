import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/change_password.dart';
import 'package:flutter_csm_tecnologia/src/pages/form_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/home-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/notas_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/splash_screen.dart';

Map<String, WidgetBuilder> getPageRoutes() {
  return <String, WidgetBuilder>{
    HomePage.routeName /* 'home' */ : (context) => HomePage(),
    SplashScreen.routeName /* 'splash' */ : (context) => SplashScreen(),
    InstPage.routeName /* 'institution' */ : (context) => InstPage(),
    LoginPage.routeName /* 'login' */ : (context) => LoginPage(),
    NotasPage.routeName /* 'notes' */ : (context) => NotasPage(),
    ChangePassPage.routeName /* 'notes' */ : (context) => ChangePassPage(),
    FormPage.routeName /* 'notes' */ : (context) => FormPage(),
  };
}
