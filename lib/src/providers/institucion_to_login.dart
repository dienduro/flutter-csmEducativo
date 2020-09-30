import 'package:flutter/material.dart';

class NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 600), curve: Curves.easeInCubic);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
