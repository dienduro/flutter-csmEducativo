import 'package:flutter/material.dart';

import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/splash_screen.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
    );
  }
}

class _Paginas extends StatelessWidget {
  final prefs = new UserPreferences();
  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    /* final navegacionModel = Provider.of<NavegacionModel>(context); */
    return /* LoginInherited(
      child: */
        PageView(
      /* controller: navegacionModel.pageController, */
      physics: NeverScrollableScrollPhysics(),
      children: [
        _splashPage(),
        _institutionPage(),
        _loginPage(),
      ],
      /*  ), */
    );
    /* ); */
  }

  Widget _splashPage() {
    return SplashScreen();
  }

  Widget _institutionPage() {
    return InstPage();
  }

  Widget _loginPage() {
    return LoginPage();
  }
}
