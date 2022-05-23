import 'package:flutter/material.dart';

class CalculadoraProvider extends ChangeNotifier {
  bool _selectedRadio = true;
  String _selectedRadioTipoEmbarazo = '';

  bool get selectedRadio => _selectedRadio;

  set selectedRadio(bool value) {
    _selectedRadio = value;
    notifyListeners();
  }

  String get selectedRadioTipoEmbarazo => _selectedRadioTipoEmbarazo;

  set selectedRadioTipoEmbarazo(String value) {
    _selectedRadioTipoEmbarazo = value;
    notifyListeners();
  }
}
