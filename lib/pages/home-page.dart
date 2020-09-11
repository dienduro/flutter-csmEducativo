import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/pages/institition-page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
