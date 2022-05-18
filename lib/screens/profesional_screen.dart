import 'package:flutter/material.dart';
import 'package:flutter_gestantes/components/components.dart';

import '../themes/default_theme.dart';

class ProfesionalScreen extends StatelessWidget {
  const ProfesionalScreen({Key? key}) : super(key: key);
  static String routerName = 'profesional';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Profesional de la salud'),
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BotonComponent(
                icono: icoPresentacion,
                nombre: 'Presentacion',
                link: 'presentacion'),
            BotonComponent(
              icono: icoPublicaciones,
              nombre: 'Publicaciones',
              link: 'publicaciones',
            ),
            BotonComponent(
              icono: icoCalculadoras,
              nombre: 'Conoce tu ganacia de peso',
              link: 'home',
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BotonComponent(
                icono: icoPresentacion,
                nombre: '¿Como alimentarse?',
                link: 'como-alimentarse',
                alto: 125),
            BotonComponent(
                icono: icoComoAlimentarse,
                nombre: 'Alimentación saludable',
                link: 'alimentacion-saludable',
                alto: 125),
            BotonComponent(
                icono: icoRecetarios,
                nombre: 'Recetarios',
                link: 'recetarios',
                alto: 125),
          ],
        ),
        Expanded(child: Container()),
        const BotonFooter()
      ]),
    );
  }
}
