import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/home-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema,
      title: 'Csm Educativo App',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'institution': (context) => InstPage(),
      },
    );
  }
}
