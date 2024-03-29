import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';

import 'package:flutter_csm_tecnologia/src/routes/routes.dart';
import 'package:flutter_csm_tecnologia/src/services/notes_services.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';

import 'package:flutter_csm_tecnologia/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => new NoteServices(),
      lazy: false,
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final prefs = new UserPreferences();
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
        initialRoute: prefs.lastPage,
        routes: getPageRoutes(),
        /* ), */
      ),
    );
  }
}
