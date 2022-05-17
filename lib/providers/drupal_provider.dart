import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gestantes/models/aplicaciones_model.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class DrupalProvider extends ChangeNotifier {
  final String baseUrl =
      'https://f3e887x9h7.execute-api.us-west-2.amazonaws.com/live/nutrigest';
  final String _apiToken = 'Basic dXNlcl9yZXN0OmhvbGFwZXJ1';
  PresentacionModel presentacion = PresentacionModel(
      titulo: '', cuerpo: '', imagen: '', resumen: '', imagenes: '');
  List<AplicacionModel> listaAplicaciones = [];

  Future getPresentacion() async {
    var url = Uri.parse('$baseUrl/api/presentacion?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final json = jsonDecode(response.body)[0];
    final str = jsonEncode(json);
    presentacion = PresentacionModel.fromJson(str);
    return presentacion;
  }

  Future getAplicaciones() async {
    var url = Uri.parse('$baseUrl/api/aplicaciones?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final decodeData = jsonDecode(response.body);
    listaAplicaciones = AplicacionesModel.fromJson(decodeData).aplicaciones;
  }
}
