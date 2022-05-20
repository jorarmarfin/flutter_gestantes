import 'package:flutter/material.dart';
import 'package:flutter_gestantes/screens/screens.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoManoScreen extends StatelessWidget {
  const MetodoManoScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-mano';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Metodo de la mano'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Text(
                    'Es un método sencillo, práctico y a la vez un recurso didáctico visual de aprendizaje y educación alimentaria, que consiste en determinar la cantidad que representa una porción de alimento, según el grupo de alimentos al cual pertenece, utilizando nuestra mano como una herramienta de comparación.'),
              ),
              BotonAzulPaginaComponent(
                btnNombre: '¿Qué es una porción?',
                btnOnTap: () {
                  drupalProvider.nid = 29;
                  Navigator.pushNamed(context, 'metodo-mano-porcion',
                      arguments: ScreenArgumentsMP(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Método de la mano',
                btnOnTap: () {
                  drupalProvider.nid = 30;
                  Navigator.pushNamed(context, 'metodo-mano-page');
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Ejemplos del método de la mano',
                btnOnTap: () {
                  drupalProvider.nid = 31;
                  Navigator.pushNamed(context, 'metodo-mano-ejemplo',
                      arguments: ScreenArguments(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Tamaño de porción y calorías',
                btnOnTap: () {
                  drupalProvider.nid = 32;
                  Navigator.pushNamed(context, 'metodo-mano-porcion-calorias',
                      arguments: ScreenArguments(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Distorsión de las porciones ',
                btnOnTap: () {
                  drupalProvider.nid = 33;
                  Navigator.pushNamed(context, 'metodo-mano-distorsion',
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
