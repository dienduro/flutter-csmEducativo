import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_inherited.dart';

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginInherited.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User: ${bloc.lastUser}'),
            Text('Password: ${bloc.lastPsswrd}'),
          ],
        ),
      ),
    );
  }
}
