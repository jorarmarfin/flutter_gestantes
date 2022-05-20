import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoManoPorcionScreen extends StatelessWidget {
  const MetodoManoPorcionScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-mano-porcion';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);

    return Scaffold(
        drawer: const Menu(),
        backgroundColor: colorCrema,
        appBar: const AppBarComponent(titulo: 'Metodo Mano'),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _Contenido(drupalProvider: drupalProvider, alto: 50),
            const BotonFooter()
          ],
        ));
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

          final List titulo = contenidoGeneral.titulo.split('|');
          // final List items = contenidoGeneral.items.toString().split('|');
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
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      titulo[1],
                      style: DefaultTheme.base.textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    contenidoGeneral.descripcion.toString(),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // _Vineta(items: items, index: 0),
                // _Vineta(items: items, index: 1),
                // _Vineta(items: items, index: 2),
                ImagenconBordeComponent(
                  url: url,
                ),
                // ImagenconBordeComponent(url: url2, alto: 250),
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

