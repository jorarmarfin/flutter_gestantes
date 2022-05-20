import 'package:flutter/material.dart';
import 'package:flutter_gestantes/components/components.dart';

import '../themes/default_theme.dart';

class NutricionistaScreen extends StatelessWidget {
  const NutricionistaScreen({Key? key}) : super(key: key);
  static String routerName = 'nutricionista';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Nutricionista'),
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
              alto: 110,
            ),
            BotonComponent(
              icono: icoPublicaciones,
              nombre: 'Publicaciones',
              link: 'publicaciones-nutricional',
              alto: 110,
            ),
            BotonComponent(
              icono: icoCalculadoras,
              nombre: 'Calculadoras',
              link: 'home',
              alto: 110,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            BotonComponent(
                icono: icoListaIntercambio,
                nombre: 'Lista de intercambio',
                link: 'lista-intercambio',
                alto: 125),
            BotonComponent(
                icono: icoMetodoPlato,
                nombre: 'Método del plato',
                link: 'metodo-plato',
                alto: 125),
            BotonComponent(
                icono: icoMetodoMano,
                nombre: 'Método de la mano',
                link: 'metodo-mano',
                alto: 125),
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
