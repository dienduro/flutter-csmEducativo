import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/home-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/splash_screen.dart';
import 'package:flutter_csm_tecnologia/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema,
      title: 'Csm Educativo App',
      initialRoute: 'splash',
      routes: {
        'splash': (context) => SplashScreen(),
        'home': (context) => HomePage(),
        'institution': (context) => InstPage(),
        'login': (context) => LoginPage(),
      },
    );
  }
}
