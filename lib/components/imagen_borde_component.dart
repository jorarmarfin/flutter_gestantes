import 'package:flutter/material.dart';

class ImagenconBordeComponent extends StatelessWidget {
  const ImagenconBordeComponent({
    Key? key,
    required this.url,
    this.alto,
    this.ancho,
    this.padding = 15.0,
  }) : super(key: key);

  final String url;
  final double? alto;
  final double? ancho;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    Widget widgetImagen;
    if (alto != null) {
      widgetImagen = Image(height: alto, image: NetworkImage(url));
    } else if (ancho != null) {
      widgetImagen = Image(width: ancho, image: NetworkImage(url));
    } else if (alto != null && ancho != null) {
      widgetImagen =
          Image(width: ancho, height: alto, image: NetworkImage(url));
    } else {
      widgetImagen = Image(image: NetworkImage(url));
    }

    return Padding(
      padding: EdgeInsets.all(padding!),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20), child: widgetImagen),
    );
  }
}
