import 'package:flutter/material.dart';

class ImagenconBordeComponent extends StatelessWidget {
  const ImagenconBordeComponent({
    Key? key,
    required this.url,
    this.alto,
    this.ancho,
  }) : super(key: key);

  final String url;
  final double? alto;
  final double? ancho;

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
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20), child: widgetImagen),
    );
  }
}
