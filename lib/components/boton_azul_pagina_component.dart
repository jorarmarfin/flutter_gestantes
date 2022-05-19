import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class BotonAzulPaginaComponent extends StatelessWidget {
  const BotonAzulPaginaComponent({
    Key? key,
    required this.btnNombre,
    required this.btnOnTap,
  }) : super(key: key);
  final String btnNombre;
  final VoidCallback btnOnTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btnOnTap,
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: containerEstiloBoton(colorPrincipal, 25),
        child: Center(
          child: Text(
            btnNombre,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
