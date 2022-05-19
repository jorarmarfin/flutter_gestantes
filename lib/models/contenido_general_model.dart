// To parse this JSON data, do
//
//     final contenidoGeneralModel = contenidoGeneralModelFromMap(jsonString);

import 'dart:convert';

class ContenidoGeneralModel {
    ContenidoGeneralModel({
      required  this.titulo,
        this.descripcionCompleto,
        this.descripcion,
        this.imagen,
        this.imagenPrincipal,
        this.mensaje,
        this.seccion,
        this.tipoPresentacion,
        this.items,
    });

    String titulo;
    String ?descripcionCompleto;
    String ?descripcion;
    String ?imagen;
    String ?imagenPrincipal;
    String ?mensaje;
    String ?seccion;
    String ?tipoPresentacion;
    String ?items;

    factory ContenidoGeneralModel.fromJson(String str) => ContenidoGeneralModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContenidoGeneralModel.fromMap(Map<String, dynamic> json) => ContenidoGeneralModel(
        titulo: json["titulo"],
        descripcionCompleto: json["descripcion_completo"],
        descripcion: json["descripcion"],
        imagen: json["imagen"],
        imagenPrincipal: json["imagen_principal"],
        mensaje: json["mensaje"],
        seccion: json["seccion"],
        tipoPresentacion: json["tipo_presentacion"],
        items: json["items"],
    );

    Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "descripcion_completo": descripcionCompleto,
        "descripcion": descripcion,
        "imagen": imagen,
        "imagen_principal": imagenPrincipal,
        "mensaje": mensaje,
        "seccion": seccion,
        "tipo_presentacion": tipoPresentacion,
        "items": items,
    };
}
