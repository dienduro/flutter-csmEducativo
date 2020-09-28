import 'package:flutter/material.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user_shcl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_csm_tecnologia/src/search/search_delegate.dart';

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';
import 'package:flutter_csm_tecnologia/src/providers/instituciones_provider.dart';

class InstPage extends StatefulWidget {
  @override
  _InstPageState createState() => _InstPageState();
}

class _InstPageState extends State<InstPage> {
  final institucionesProvider = new InstitucionesProvider();
  InstitucionModel selectedSchool;
  TextEditingController _textController;
  String _school = 'la normal';
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    _textController = new TextEditingController(text: prefs.idSchool);
    super.initState();

    _textController.addListener(() {
      _setSelectedInstituteTextField();
    });
  }

  _setSelectedInstituteTextField() {
    print('mostrar texto de institucion del llamado:$_school');
    return _textController.text;
  }

  @override
  Widget build(BuildContext context) {
    /* final _screenSize = MediaQuery.of(context).size; */
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _crearTextField(context),
        ],
      ),
    );
  }

  Widget _crearFondo(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _fondoAzul = Container(
      height: double.infinity,
      width: double.infinity,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/drawable-fhd/prelogin_background.png',
        ),
      ),
    );

    final _whereStudy = SafeArea(
      child: Container(
        width: double.infinity,
        child: Image(
          image: AssetImage(
            'assets/drawable-fhd/where_you_study.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );

    final _institutionImage = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: _screenSize.height * 0.34,
          width: _screenSize.width * 1,
          /*  width: double.infinity,
          height: _screenSize.height * 0.4, */
          child: Image(
              image: AssetImage(
                'assets/drawable-fhd/bkg_institution.png',
              ),
              fit: BoxFit.fill),
        )
      ],
    );

    return Stack(
      children: [
        _fondoAzul,
        Positioned(
          top: _screenSize.height * 0.66,
          child: _institutionImage,
        ),
        _whereStudy,
      ],
    );
  }

  Widget _crearTextField(BuildContext context) {
    /* final searchModalRoute = ModalRoute.of(context).settings.arguments; */
    return Center(
      child: Container(
        width: 330.0,
        height: 220.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: SweepGradient(
            colors: [
              Colors.white10,
              Colors.black26,
              Colors.white30,
              Colors.black12,
              Colors.white10,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Institución Educativa',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              Divider(),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _textController,
                /*  onTap: () */ /* async {
                  final selectedInstitute = await showSearch(
                    context: context,
                    delegate: DataSearch(),
                    query: _textController.text,
                  );

                  if (selectedInstitute == null) {
                    print('no se obtuvieron datos');
                    return selectedInstitute;
                  } else {
                    selectedSchool = selectedInstitute;

                    setState(() {
                      final _school = selectedSchool.nombre;

                      /* print('regreseon el valor de _schoolset: $_school'); */

                      return _school;
                    });
                  }
                }, */
                onChanged: (setSchool) async {
                  prefs.school = setSchool;
                  final selectedInstitute = await showSearch(
                    context: context,
                    delegate: DataSearch(),
                    query: _textController.text,
                  );

                  if (selectedInstitute == null) {
                    print('no se obtuvieron datos');
                    return selectedInstitute;
                  } else {
                    setSchool = selectedInstitute.nombre;

                    /*  setState(() {
                      /* print('regreseon el valor de _schoolset: $_school'); */
                    }); */
                  }
                },
                /* {
                  prefs.school = setSchool;
                  setSchool = selectedSchool.nombre;
                  print('valor del setSchool$setSchool');
                  setState(() {
                    return setSchool = _school;
                  });
                }, */
                style: TextStyle(color: Colors.black),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  errorText: null,
                  /*  errorText: snapshot.error, */
                  icon: Icon(
                    FontAwesomeIcons.school,
                    size: 20.0,
                    /* color: Colors.white, */
                  ),
                  filled: true,
                  fillColor: Colors.white38,
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                  /* labelText:
                      /* (selectedSchool != null)
                      ? selectedSchool.nombre
                      :  */
                      'Institucion', */

                  hintText: (selectedSchool != null)
                      ? selectedSchool.nombre
                      : 'Institucion',
                  hintStyle: TextStyle(color: Colors.black),
                  /* hintText: 'Institución', */
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  /* counterText: snapshot.data, */
                  counterStyle:
                      TextStyle(color: Theme.of(context).primaryColorDark),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              (selectedSchool != null)
                  ? RaisedButton(
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(
                          horizontal: 85.0, vertical: 10.0),
                      shape: StadiumBorder(),
                      elevation: 3.0,
                      child: Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                        /* print(searchModalRoute); */
                      },
                      /* snapshot.hasData ? () => _login(context, bloc) : null */
                    )
                  : /* RaisedButton(
                      color: Colors.teal,
                      padding:
                          EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
                      shape: StadiumBorder(),
                      elevation: 3.0,
                      child: Text(
                        'Buscar',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: null,
                      /* snapshot.hasData ? () => _login(context, bloc) : null */
                    ), */
                  SizedBox(
                      height: 20.0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
