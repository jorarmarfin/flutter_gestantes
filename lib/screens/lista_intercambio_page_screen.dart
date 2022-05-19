import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class ScreenArguments {
  final double alto;

  ScreenArguments(this.alto);
}

class ListaIntercambioPageScreen extends StatelessWidget {
  const ListaIntercambioPageScreen({Key? key}) : super(key: key);
  static String routerName = 'lista-intercambio-page';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Lista Intercambio'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _Contenido(drupalProvider: drupalProvider, alto: args.alto),
          const BotonFooter()
        ],
      ),
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({
    Key? key,
    required this.drupalProvider,
    required this.alto,
  }) : super(key: key);
  final DrupalProvider drupalProvider;
  final double alto;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: drupalProvider.getContenidoGeneral(drupalProvider.nid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final contenidoGeneral = drupalProvider.contenidoGeneral;
          final url = drupalProvider.baseUrl +
              contenidoGeneral.imagenPrincipal.toString();
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    contenidoGeneral.descripcion.toString(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                InteractiveViewer(child: ImagenconBordeComponent(url: url)),
                SizedBox(
                  height: alto,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
