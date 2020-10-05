import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';

import 'package:flutter_csm_tecnologia/src/routes/routes.dart';

import 'package:flutter_csm_tecnologia/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*  MultiProvider(
      providers: [
        /* Implementar en ancestor en los provider  */
        ChangeNotifierProvider(
          create: (_) => new NavegacionModel(),
        ),
        /* ChangeNotifierProvider(
            create: (_) => new LoginProvider(),
          ) */
      ],
      child: */
        LoginInherited(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: miTema,
        title: 'Csm Educativo App',
        initialRoute: 'home',
        routes: getPageRoutes(),
        /* ), */
      ),
    );
  }
}
