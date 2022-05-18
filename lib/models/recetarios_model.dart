class RecetariosModel {
  final List<RecetaModel> receta;

  RecetariosModel({
    required this.receta,
  });

  factory RecetariosModel.fromJson(List<dynamic> parsedJson) {
    List<RecetaModel> receta = [];
    receta = parsedJson.map((i) => RecetaModel.fromJson(i)).toList();

    return RecetariosModel(receta: receta);
  }
}

class RecetaModel {
  final String titulo;
  final String enlace;
  final String imagen;
  final String descripcion;

  RecetaModel({required this.titulo, required this.enlace, required this.imagen, required this.descripcion,});

  factory RecetaModel.fromJson(Map<String, dynamic> json) {
    return RecetaModel(
      titulo: json['titulo'].toString(),
      enlace: json['enlace'].toString(),
      imagen: json['imagen'].toString(),
      descripcion: json['descripcion'].toString()
      );
  }
}