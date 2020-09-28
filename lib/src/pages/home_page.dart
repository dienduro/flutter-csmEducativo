import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/controllers/instituciones_controller.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition_page.dart';
import 'package:flutter_csm_tecnologia/src/pages/login_page.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user_shcl.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final InstitucionesController _putController =
      Get.put(InstitucionesController());
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
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
