import 'package:flutter/material.dart';
import 'package:flutter_gestantes/components/components.dart';

import '../themes/default_theme.dart';

class GestanteScreen extends StatelessWidget {
  const GestanteScreen({Key? key}) : super(key: key);
  static String routerName = 'gestante';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Gestantes'),
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
              link: 'presentacion',
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
                icono: icoComoAlimentarse,
                nombre: '¿Como alimentarse?',
                link: 'como-alimentarse',
                alto: 125),
            BotonComponent(
                icono: icoAlimentacionSaludable,
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
