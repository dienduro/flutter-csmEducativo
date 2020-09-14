import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/pages/institition-page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          _institutionPage(),
        ],
      ),
    );
  }

  Widget _institutionPage() {
    return InstPage();
  }
}

/* class _NavegacionModel with ChangeNotifier {} */
