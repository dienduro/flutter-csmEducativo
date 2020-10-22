import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_csm_tecnologia/src/bloc/instituciones/school_bloc.dart';
import 'package:flutter_csm_tecnologia/src/services/instituciones_provider.dart';
import 'package:flutter_csm_tecnologia/src/share_prefs/preferences_user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_csm_tecnologia/src/search/search_delegate.dart';

import 'package:flutter_csm_tecnologia/src/models/institucion_model.dart';

class InstPage extends StatefulWidget {
  static final String routeName = 'institution';
  @override
  _InstPageState createState() => _InstPageState();
}

class _InstPageState extends State<InstPage> {
  final institucionesProvider = new InstitucionesProvider();

  final schoolBloc = new SchoolBloc();
  InstitucionModel selectedSchool;
  TextEditingController _textController;

  final prefs = new UserPreferences();
  String newText = '';

  @override
  void initState() {
    _textController = TextEditingController(text: prefs.school);
    selectedSchool ?? Container();
    _textController.addListener(schoolBloc.instanciaInsti(selectedSchool));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textController.dispose();
    _textController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _crearFondoForm(context),
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

  Widget _crearFondoForm(BuildContext context) {
    prefs.lastPage = InstPage.routeName;
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
              _searchSchoolField(),
              SizedBox(
                height: 10,
              ),
              (selectedSchool != null) ? _botonAcceso(context) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _search() async {
    bool hasData = false;
    var info = await showSearch(
      context: context,
      delegate: DataSearch(),
    ).then(
      (result) async {
        if (result == null) {
          print('no se obtuvieron datos');
        } else {
          _textController.text = result.nombre;
          prefs.school = result.nombre;
          prefs.idSchool = result.id;
          selectedSchool = result;

          print('se econtraron datos$result');
        }
      },
    );
    hasData = true;
    info = hasData;
    return info;
  }

  Widget _searchSchoolField() {
    return StreamBuilder(
      stream: schoolBloc.institucionesStream,
      builder: (context, snapshot) {
        return TextField(
          onTap: () => _search(),
          controller: _textController,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            icon: Icon(
              FontAwesomeIcons.school,
              size: 20.0,
            ),
            filled: true,
            fillColor: Colors.white38,
            labelStyle: TextStyle(color: Colors.black, fontSize: 20),
            labelText: (selectedSchool != null)
                ? selectedSchool.nombre
                : 'Institucion',
            hintStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            counterStyle: TextStyle(color: Theme.of(context).primaryColorDark),
          ),
        );
      },
    );
  }

  Widget _botonAcceso(BuildContext context) {
    return RaisedButton(
      color: Colors.teal,
      padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 10.0),
      shape: StadiumBorder(),
      elevation: 3.0,
      child: Text(
        'Ingresar',
        style: TextStyle(fontSize: 15.0),
      ),
      onPressed: () => Navigator.of(context).pushReplacementNamed('login'),
    );
  }
}
