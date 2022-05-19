import 'package:flutter/material.dart';
import 'package:flutter_gestantes/screens/lista_intercambio_page_screen.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class ListaIntercambioScreen extends StatelessWidget {
  const ListaIntercambioScreen({Key? key}) : super(key: key);
  static String routerName = 'lista-intercambio';

  @override
  Widget build(BuildContext context) {
    const String txtPage =
        'Es una herramienta educativa que permite al profesional de la salud nutricionista realizar acciones de educación nutricional de manera individual o colectiva, logrando elaborar un plan de alimentación basado en los hábitos y preferencias alimentarias de la persona.';
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Lista de Intercambio'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(txtPage),
              ),
              BotonAzulPaginaComponent(
                btnNombre: 'Contenido nutricional según porciones',
                btnOnTap: () {
                  drupalProvider.nid = 34;
                  Navigator.pushNamed(context, 'lista-intercambio-page',
                      arguments: ScreenArguments(50.0));
                },
              ),
              BotonAzulPaginaComponent(
                btnNombre:
                    'Número de porciones por etapas de vida en personas saludables ',
                btnOnTap: () {
                  drupalProvider.nid = 35;
                  Navigator.pushNamed(context, 'lista-intercambio-page',
                      arguments: ScreenArguments(400.0));
                },
              )
            ],
          ),
          const BotonFooter()
        ],
      ),
    );
  }
}
