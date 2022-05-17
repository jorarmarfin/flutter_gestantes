import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class BotonComponent extends StatelessWidget {
  const BotonComponent({
    Key? key,
    required this.icono,
    required this.nombre,
    required this.link,
    this.alto = 140.0,
  }) : super(key: key);
  final String icono;
  final String nombre;
  final String link;
  final double alto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, link),
      child: Container(
        width: 100,
        height: alto,
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
        margin: const EdgeInsets.all(5),
        decoration: containerEstiloBoton(colorNaranja, 20),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: containerEstiloBoton(colorPrincipal, 10),
            child: Image(
              image: AssetImage(icono),
              height: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            nombre,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
