import 'package:flutter/material.dart';
import 'package:flutter_gestantes/screens/screens.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoPlatoScreen extends StatelessWidget {
  const MetodoPlatoScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-plato';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Metodo del Plato'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child:
                    Text('Es una manera sencilla de planificacion de comidas.'),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: Text(
                    'Que ayudará a la gestante a comer una variedad de alimentos y a controlar el tamaño de sus porciones a ser consumidos durante el día.'),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 15),
                child: Text(
                    'Para su aplicación se necesita de un plato de aproximadamente 23 cm de diametro y de una taza o un vaso de 240 ml.'),
              ),
              BotonAzulPaginaComponent(
                btnNombre: '¿Cómo hacerlo?',
                btnOnTap: () {
                  drupalProvider.nid = 36;
                  Navigator.pushNamed(context, 'metodo-plato-page',
                      arguments: ScreenArgumentsMP(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Armando un plato',
                btnOnTap: () {
                  drupalProvider.nid = 35;
                  Navigator.pushNamed(context, 'metodo-plato-armando');
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Ejemplos Reales',
                btnOnTap: () {
                  drupalProvider.nid = 38;
                  Navigator.pushNamed(context, 'metodo-plato-ejemplos',
                      arguments: ScreenArguments(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: '¿Cuál plato tiene la medida correcta? ',
                btnOnTap: () {
                  drupalProvider.nid = 39;
                  Navigator.pushNamed(context, 'metodo-plato-medida',
                      arguments: ScreenArguments(50.0));
                },
              ),
            ],
          ),
          const BotonFooter()
        ],
      ),
    );
  }
}
