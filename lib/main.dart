import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/home_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user_shcl.dart';
import 'package:flutter_csm_tecnologia/theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /* final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>(); */
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: miTema,
      title: 'Csm Educativo App',
      initialRoute: 'home',
      routes: {
        'home': (context) => HomePage(),
        'institution': (context) => InstPage(),
        'login': (context) => LoginPage(),
      },
    );
  }
}
