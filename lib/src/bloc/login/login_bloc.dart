import 'dart:async';

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

//recuperar los datos escuchado del stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get paswordStream => _passwordController.stream;
  //Insaertar valores Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePass => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
