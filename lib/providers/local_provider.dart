import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class LocalProvider extends ChangeNotifier {
  bool _mostrarTuberculo = false;
  bool _mostrarVerdura = false;
  bool _mostrarCarne = false;
  String imgPlato = imgPlato0;
  int alimentos = 0;
  String tuberculoElegido = '';
  String verduraElegida = '';
  String carneElegida = '';

  bool get mostrarTuberculo => _mostrarTuberculo;

  set mostrarTuberculo(bool value) {
    _mostrarTuberculo = value;
    cambiaDePlato();
    notifyListeners();
  }

  bool get mostrarVerdura => _mostrarVerdura;

  set mostrarVerdura(bool value) {
    _mostrarVerdura = value;
    cambiaDePlato();
    notifyListeners();
  }

  bool get mostrarCarne => _mostrarCarne;

  set mostrarCarne(bool value) {
    _mostrarCarne = value;
    cambiaDePlato();
    notifyListeners();
  }

  cambiaDePlato() {
    if (_mostrarTuberculo && _mostrarVerdura && _mostrarCarne) {
      imgPlato = imgPlato1;
    }
  }
}
