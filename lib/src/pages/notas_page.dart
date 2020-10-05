import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/bloc/login/login_bloc.dart';

class NotasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc();
    return Scaffold(
      body: Center(
        child: Text('${bloc.lastUser}'),
      ),
    );
  }
}
