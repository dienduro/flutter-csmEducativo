import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/widget/menu_widget.dart';

class ChangePassPage extends StatelessWidget {
  static final String routeName = 'change';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CSM Educativo'),
        ),
        drawer: MenuWidget(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _actualPass(context),
              SizedBox(
                height: 40,
              ),
              _newPass(context),
              SizedBox(
                height: 40,
              ),
              _crearboton(),
            ],
          ),
        ));
  }

  Widget _actualPass(BuildContext context) {
    return TextField(
      /* controller: controllerUser, */
      obscureText: true,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        filled: true,
        hoverColor: Colors.black,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Contraseña Actual:',
        hintStyle: TextStyle(color: Colors.black),
        /* errorText: snapshot.error, */
        hintText: 'last password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.emailAddress,
      /* onChanged: bloc.changeUser, */
    );
  }

  Widget _newPass(BuildContext context) {
    return TextField(
      /* controller: controllerUser, */
      obscureText: true,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        filled: true,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Nuevo Contraseña:',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        /* errorText: snapshot.error, */
        hintText: 'last password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
      ),
      keyboardType: TextInputType.emailAddress,
      /* onChanged: bloc.changeUser, */
    );
  }

  Widget _crearboton(/* LoginBloc bloc */) {
    /*  return StreamBuilder(
      stream: bloc.loginValidStreamRx,
      builder: (BuildContext context, AsyncSnapshot snapshot) { */
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(colors: [
            Color.fromARGB(120, 90, 175, 120),
            Color.fromARGB(120, 47, 188, 145),
          ])),
      child:
          /* (snapshot.hasData) ? */ flatButtonlogin(
              /* bloc, context */) /* : Container() */,
    );
    /*  },
    ); */
  }

  Widget flatButtonlogin(/* LoginBloc bloc, BuildContext context */) {
    return FlatButton(
        /*  color: Colors.white54, */
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
        shape: StadiumBorder(),
        child: Text(
          'Cambiar',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
        onPressed: () {} /* async => _login(bloc, context), */

        /* snapshot.hasData ? () */
        );
  }
}
