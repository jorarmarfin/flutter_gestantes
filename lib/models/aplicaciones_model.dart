class AplicacionesModel {
  final List<AplicacionModel> aplicaciones;

  AplicacionesModel({
    required this.aplicaciones,
  });

  factory AplicacionesModel.fromJson(List<dynamic> parsedJson) {
    List<AplicacionModel> aplicaciones = [];
    aplicaciones = parsedJson.map((i) => AplicacionModel.fromJson(i)).toList();

    return AplicacionesModel(aplicaciones: aplicaciones);
  }
}

class AplicacionModel {
  final String imagen;
  final String titulo;
  final String enlace;
  final String descripcion;

  AplicacionModel({
    required this.imagen,
    required this.titulo,
    required this.enlace,
    required this.descripcion,
  });

  factory AplicacionModel.fromJson(Map<String, dynamic> json) {
    return AplicacionModel(
        imagen: json['imagen'].toString(),
        titulo: json['titulo'].toString(),
        enlace: json['enlace'].toString(),
        descripcion: json['descripcion'].toString());
  }
}
