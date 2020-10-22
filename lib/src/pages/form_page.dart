import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:flutter_csm_tecnologia/src/widget/menu_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  static final String routeName = 'form';

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final scaffoldmKey = GlobalKey<ScaffoldState>();
  final prefs = new UserPreferences();

  bool _guardando = false;
  File image;
  final _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      /* appBar: AppBar(
        title: Text('CSM Educativo'),
      ), */
      drawer: MenuWidget(),
      body: CustomScrollView(
        slivers: [
          _crearAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                _fotoEstudiante(image),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _name(context),
                        SizedBox(
                          height: 25,
                        ),
                        _id(context),
                        SizedBox(
                          height: 25,
                        ),
                        _email(context),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Expanded(flex: 1, child: _birthday(context)),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(flex: 1, child: _phone(context)),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        _address(context),
                        SizedBox(
                          height: 25,
                        ),
                        _crearboton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearAppBar() {
    return SliverAppBar(
      title: Text(
        'CSM educativo',
      ),
      /*  actions: [
        IconButton(
          icon: Icon(Icons.photo),
          onPressed: () {},
        ),
      ], */
      elevation: 2.0,
      backgroundColor: Colors.cyan[800],
      floating: true,
    );
  }

  Widget _fotoEstudiante(File pickedFile) {
    return Stack(
      children: [
        _imagenLogo(image),
        Positioned(
          child: _buttonTakePhoto(),
          left: 210,
          top: 80,
        ),
        /*  Positioned(
          child: _buttonEditProfile(),
          left: 130,
          top: 80,
        ), */
      ],
    );
  }

  Widget _imagenLogo(File pickedFile) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 100,
          width: 100,
          child: InkWell(
            onTap: _seleccionarFoto,
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                /* boxShadow: [
                  BoxShadow(color: Colors.white24, blurRadius: 30.0),
                ], */
                image: DecorationImage(
                  image: AssetImage(pickedFile?.path ??
                      'assets/drawable-fhd/ic_action_splash2.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonTakePhoto() {
    setState(() {});
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
          icon: Icon(
            Icons.camera_alt,
            color: Colors.black87,
          ),
          onPressed: _tomarFoto

          /*  (_tomarFoto == null)
              ? mostarSnackbar('no tomaste ninguna foto')
              : _tomarFoto(); */

          ),
    );
  }

  Widget _name(BuildContext context) {
    TextEditingController _textEditingController;

    return TextFormField(
      initialValue: prefs.studentName,
      /* controller: controllerUser, */
      controller: _textEditingController,
      onChanged: (value) {
        /* TODO: decidir si hacer que cambiuen los valores en un stream y ese ultimo */
      },
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        prefixIcon: Icon(FontAwesomeIcons.userAlt),
        filled: true,
        hoverColor: Colors.black,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Nombre Completo :',
        hintStyle: TextStyle(color: Colors.black),
        /* errorText: snapshot.error, */
        hintText: 'full name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.emailAddress,
      /* onChanged: bloc.changeUser, */
    );
  }

  Widget _id(BuildContext context) {
    return TextFormField(
      enabled: false,
      /* controller: controllerUser, */
      initialValue: prefs.identificacion,
      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(FontAwesomeIcons.idCard),
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        filled: true,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Identificacion :',
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        /* errorText: snapshot.error, */
        hintText: 'Ti',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Theme.of(context).primaryColorLight),
      ),
      keyboardType: TextInputType.number,
      /* onChanged: bloc.changeUser, */
    );
  }

  Widget _email(BuildContext context) {
    return TextFormField(
      /* controller: controllerUser, */

      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        prefixIcon: Icon(Icons.email_outlined),
        filled: true,
        hoverColor: Colors.black,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Email :',
        hintStyle: TextStyle(color: Colors.black),
        /* errorText: snapshot.error, */
        hintText: 'educativo@csm.com',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.emailAddress,
      /* onChanged: bloc.changeUser, */
    );
  }

  Widget _birthday(BuildContext context) {
    return Container(
      width: 25,
      child: TextFormField(
        /* controller: controllerUser, */
        initialValue: prefs.fechaNacimiento,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          /* icon: Icon(Icons.alternate_email, color: Colors.black), */
          prefixIcon: Icon(FontAwesomeIcons.birthdayCake),
          filled: true,
          hoverColor: Colors.black,
          fillColor: Colors.black12,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          labelText: 'Birthday :',
          hintStyle: TextStyle(color: Colors.black),
          /* errorText: snapshot.error, */
          hintText: 'AAAA-MM-DD',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counterStyle: TextStyle(color: Colors.black),
        ),
        keyboardType: TextInputType.datetime,
        /* onChanged: bloc.changeUser, */
      ),
    );
  }

  Widget _phone(BuildContext context) {
    return Container(
      width: 25,
      child: TextFormField(
        /* controller: controllerUser, */

        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          /* icon: Icon(Icons.alternate_email, color: Colors.black), */
          prefixIcon: Icon(FontAwesomeIcons.phoneAlt),
          filled: true,
          hoverColor: Colors.black,
          fillColor: Colors.black12,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          labelText: 'Phone :',
          hintStyle: TextStyle(color: Colors.black),
          /* errorText: snapshot.error, */
          hintText: 'full name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          counterStyle: TextStyle(color: Colors.black),
        ),
        keyboardType: TextInputType.phone,
        /* onChanged: bloc.changeUser, */
      ),
    );
  }

  Widget _address(BuildContext context) {
    return TextFormField(
      /* controller: controllerUser, */

      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        /* icon: Icon(Icons.alternate_email, color: Colors.black), */
        prefixIcon: Icon(FontAwesomeIcons.mapMarkerAlt),
        filled: true,
        hoverColor: Colors.black,
        fillColor: Colors.black12,
        labelStyle: TextStyle(color: Colors.black, fontSize: 20),
        labelText: 'Address :',
        hintStyle: TextStyle(color: Colors.black),
        /* errorText: snapshot.error, */
        hintText: 'direccion',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterStyle: TextStyle(color: Colors.black),
      ),
      keyboardType: TextInputType.streetAddress,
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
          /* (snapshot.hasData) ? */ flatButtonForm(
              /* bloc, context */) /* : Container() */,
    );
    /*  },
    ); */
  }

  Widget flatButtonForm(/* LoginBloc bloc, BuildContext context */) {
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

  Future _tomarFoto() async {
    _procesarImagen(ImageSource.camera);
    setState(() {});
  }

  Future _seleccionarFoto() async {
    _procesarImagen(ImageSource.gallery);
    setState(() {});
  }

  void mostarSnackbar(String mensaje) {
    final snackbar = SnackBar(
      content: Text(mensaje),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldmKey.currentState.showSnackBar(snackbar);
  }

  Future _procesarImagen(ImageSource origen) async {
    final PickedFile pickedFile = await _picker.getImage(
      imageQuality: 10,
      source: origen,
    );
    image =
        File(pickedFile?.path ?? 'assets/drawable-fhd/ic_action_splash2.jpg');
    if (image != null) {
    } else {
      mostarSnackbar('no se guardo ninguna imagen');
    }
    setState(() {});
    /* TODO:Pasar a la camara */
  }
}
