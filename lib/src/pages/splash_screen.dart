import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/* import 'package:flutter_csm_tecnologia/src/services/instituciones_provider.dart';
import 'package:flutter_csm_tecnologia/src/utils/utils.dart'; */

class SplashScreen extends StatefulWidget /* StatelessWidget */ {
  static final String routeName = 'splash';
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    /*  instiProv.getInstituciones(); */
    /* if (instiProv.urlDone == true) { */
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed('institution'),
    );
    /*  } else {
      mostrarAlertaSplash(context, 'lo setimos ');
    } */
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          _imgSplash(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _imgSplash(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    final _imgFondo = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            height: _size.height * 1,
            width: _size.width * 1,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/drawable-fhd/ic_action_splash.png'),
            ),
          ),
        )
      ],
    );
    return _imgFondo;
  }
}
