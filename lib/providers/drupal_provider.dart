import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

import '../models/models.dart';

class DrupalProvider extends ChangeNotifier {
  final String baseUrl =
      'https://f3e887x9h7.execute-api.us-west-2.amazonaws.com/live/nutrigest';
  final String _apiToken = 'Basic dXNlcl9yZXN0OmhvbGFwZXJ1';
  PresentacionModel presentacion = PresentacionModel(
      titulo: '', cuerpo: '', imagen: '', resumen: '', imagenes: '');
  ContenidoGeneralModel contenidoGeneral = ContenidoGeneralModel(titulo: '');
  List<AplicacionModel> listaAplicaciones = [];
  List<RecetaModel> listaRecetas = [];
  List<PublicacionModel> listaPublicaciones = [];
  String _tipoPublicacion = 'Profesional';
  int nid = 0;

  String get tipoPublicacion => _tipoPublicacion;

  set tipoPublicacion(String value) {
    _tipoPublicacion = value;
    notifyListeners();
  }

  Future getPresentacion(String api) async {
    var url = Uri.parse('$baseUrl/api/$api?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final json = jsonDecode(response.body)[0];
    final str = jsonEncode(json);
    presentacion = PresentacionModel.fromJson(str);
  }

  Future getAplicaciones() async {
    var url = Uri.parse('$baseUrl/api/aplicaciones?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final decodeData = jsonDecode(response.body);
    listaAplicaciones = AplicacionesModel.fromJson(decodeData).aplicaciones;
  }

  Future getContenidoGeneral(int nid) async {
    var url = Uri.parse('$baseUrl/api/contenido-general/$nid?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final json = jsonDecode(response.body)[0];
    final str = jsonEncode(json);
    contenidoGeneral = ContenidoGeneralModel.fromJson(str);
  }

  Future getRecetarios(String tipo) async {
    var url = Uri.parse('$baseUrl/api/recetarios/$tipo?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final decodeData = jsonDecode(response.body);
    listaRecetas = RecetariosModel.fromJson(decodeData).receta;
  }

  Future getPublicaciones(String tipo) async {
    var url = Uri.parse('$baseUrl/api/publicaciones/$tipo?_format=json');
    final response = await http.get(url, headers: {
      'Authorization': _apiToken,
    });
    final decodeData = jsonDecode(response.body);
    listaRecetas = RecetariosModel.fromJson(decodeData).receta;
    listaPublicaciones = PublicacionesModel.fromJson(decodeData).publicaciones;
  }

  Future<void> launchInBrowser(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url,
        mode: LaunchMode.externalApplication // .externalApplication,
        )) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Nutrigest',
        text:
            'NutriGest es una aplicación móvil desarrollada para los profesionales de la salud nutricionistas como herramienta de apoyo para la atención nutricional',
        linkUrl:
            'https://play.google.com/store/apps/developer?id=Instituto+Nacional+de+Salud&hl=es',
        chooserTitle: 'Nutri');
  }
}
