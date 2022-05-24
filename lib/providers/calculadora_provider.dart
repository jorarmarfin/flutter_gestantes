import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gestantes/data/cuadro_ganancia_peso_data.dart';
import '../data/data.dart';
import '../models/models.dart';

class CalculadoraProvider extends ChangeNotifier {
  bool esGestante = true;
  bool _radioConocePesoPGEstacional = true;
  double pesoPreGestacional = 0.0;
  double pesoPreGestacionalEstimado = 0.0;
  double pesoActual = 0.0;
  double _talla = 0.0;
  int edad = 0;
  int semanaGestacion = 1;
  String _radioTipoEmbarazo = 'unico';
  int alturaUterina = 0;

  double tallaMetros = 0.0;
  double imcpg = 0.0;
  double gananciaPeso = 0.0;
  double gananciaPesoEstimado = 0.0;
  String clasificacionImcpg = '';
  String clasificacionGanaciaPeso = '';

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  double get talla => _talla;

  set talla(double value) {
    _talla = value;
    tallaMetros = value / 100;
    notifyListeners();
  }

  bool get radioConocePesoPGEstacional => _radioConocePesoPGEstacional;

  set radioConocePesoPGEstacional(bool value) {
    _radioConocePesoPGEstacional = value;
    notifyListeners();
  }

  String get radioTipoEmbarazo => _radioTipoEmbarazo;

  set radioTipoEmbarazo(String value) {
    _radioTipoEmbarazo = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formkey.currentState?.validate() ?? false;
  }

  calculaIndiceMasaCorporalPreGestacional() {
    double peso = 0.0;
    if (_radioConocePesoPGEstacional) {
      peso = pesoPreGestacional;
    } else {
      //Calcula clasificacion
      double talla3digitos = getNumber(tallaMetros, precision: 2);
      List<Cuadro4Model> cuadro = cuadro4Data
          .where((element) => element.talla == talla3digitos)
          .toList();

      if (pesoActual < cuadro.first.p1) {
        clasificacionImcpg = 'Delgadez';
      }
      if (pesoActual >= cuadro.first.p2 && pesoActual < cuadro.first.p3) {
        clasificacionImcpg = 'Normal';
      }
      if (pesoActual >= cuadro.first.p4 && pesoActual < cuadro.first.p5) {
        clasificacionImcpg = 'Sobrepeso';
      }
      if (pesoActual >= cuadro.first.p6) {
        clasificacionImcpg = 'Obesidad';
      }
      //Calcula ganancia de peso estimada
      if (clasificacionImcpg == 'Delgadez') {
        List<CuadroGananciaPesoModel> cuadro = cuadroGananciaPesoDelgadezData
            .where((element) => element.semana == semanaGestacion)
            .toList();
        gananciaPesoEstimado = cuadro.first.p1;
      }
      if (clasificacionImcpg == 'Normal') {
        List<CuadroGananciaPesoModel> cuadro = cuadroGananciaPesoNormalData
            .where((element) => element.semana == semanaGestacion)
            .toList();
        gananciaPesoEstimado =
            (_radioTipoEmbarazo == 'unico') ? cuadro.first.p1 : cuadro.first.p3;
      }
      if (clasificacionImcpg == 'Sobrepeso') {
        List<CuadroGananciaPesoModel> cuadro = cuadroGananciaPesoSobrePesoData
            .where((element) => element.semana == semanaGestacion)
            .toList();
        gananciaPesoEstimado =
            (_radioTipoEmbarazo == 'unico') ? cuadro.first.p1 : cuadro.first.p3;
      }
      if (clasificacionImcpg == 'Obesidad') {
        List<CuadroGananciaPesoModel> cuadro = cuadroGananciaPesoObesidadData
            .where((element) => element.semana == semanaGestacion)
            .toList();
        gananciaPesoEstimado =
            (_radioTipoEmbarazo == 'unico') ? cuadro.first.p1 : cuadro.first.p3;
      }
      pesoPreGestacionalEstimado = pesoActual - gananciaPesoEstimado;
      peso = pesoPreGestacional;
    }
    imcpg = peso / pow(tallaMetros, 2);
    imcpg = getNumber(imcpg, precision: 3);
  }

  double getNumber(double input, {int precision = 2}) => double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  calculaClasificacionIndiceMasaCorporalPreGestacional() {
    if (_radioConocePesoPGEstacional) {
      List<Cuadro1Model> cuadro = cuadro1Data.where((element) {
        return imcpg >= element.minimo && imcpg < element.maximo;
      }).toList();
      if (cuadro.isNotEmpty) {
        clasificacionImcpg = cuadro.first.clasificacion;
      }
    } else {}
  }

  calculaGananciaPeso() {
    if (_radioConocePesoPGEstacional) {
      gananciaPeso = pesoActual - pesoPreGestacional;
    } else {}
  }
}
