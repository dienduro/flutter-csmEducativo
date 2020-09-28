import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          _institutionPage(),
          _loginPage(),
        ],
      ),
    );
  }

  Widget _institutionPage() {
    return InstPage();
  }

  Widget _loginPage() {
    return LoginPage();
  }
}

/* class _NavegacionModel with ChangeNotifier {} */
