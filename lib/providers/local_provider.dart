import 'package:flutter/material.dart';

class LocalProvider extends ChangeNotifier {
  bool _mostrarTuberculo = false;

  bool get mostrarTuberculo => _mostrarTuberculo;

  set mostrarTuberculo(bool value) {
    _mostrarTuberculo = value;
    notifyListeners();
  }
}
