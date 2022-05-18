class PublicacionesModel {
  final List<PublicacionModel> publicaciones;

  PublicacionesModel({
    required this.publicaciones,
  });

  factory PublicacionesModel.fromJson(List<dynamic> parsedJson) {
    List<PublicacionModel> publicaciones = [];
    publicaciones = parsedJson.map((i) => PublicacionModel.fromJson(i)).toList();

    return PublicacionesModel(publicaciones: publicaciones);
  }
}

class PublicacionModel {
  final String titulo;
  final String cuerpo;
  final String imagen;
  final String resumen;
  final String enlace;
  final String tipos;
  final String archivo;

  PublicacionModel({required this.archivo,required this.tipos,required this.enlace,required this.titulo, required this.cuerpo, required this.imagen, required this.resumen,});

  factory PublicacionModel.fromJson(Map<String, dynamic> json) {
    return PublicacionModel(
      titulo: json['titulo'].toString(),
      cuerpo: json['cuerpo'].toString(),
      imagen: json['imagen'].toString(),
      enlace: json['enlace'].toString(),
      tipos: json['field_tipos'].toString(),
      archivo: json['archivo'].toString(),
      resumen: json['resumen'].toString()
      );
  }
}