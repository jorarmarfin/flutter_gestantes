import 'dart:convert';

class PresentacionModel {
  PresentacionModel({
    required this.titulo,
    required this.cuerpo,
    required this.imagen,
    required this.resumen,
    this.imagenes,
  });

  String titulo;
  String cuerpo;
  String imagen;
  String resumen;
  String? imagenes;

  factory PresentacionModel.fromJson(String str) =>
      PresentacionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PresentacionModel.fromMap(Map<String, dynamic> json) =>
      PresentacionModel(
        titulo: json["titulo"],
        cuerpo: json["cuerpo"],
        imagen: json["imagen"],
        resumen: json["resumen"],
        imagenes: json["imagenes"],
      );

  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "cuerpo": cuerpo,
        "imagen": imagen,
        "resumen": resumen,
        "imagenes": imagenes,
      };
}
