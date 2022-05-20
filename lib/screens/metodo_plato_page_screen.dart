import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class ScreenArgumentsMP {
  final double alto;

  ScreenArgumentsMP(this.alto);
}

class MetodoPlatoPageScreen extends StatelessWidget {
  const MetodoPlatoPageScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-plato-page';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    final ScreenArgumentsMP args =
        ModalRoute.of(context)!.settings.arguments as ScreenArgumentsMP;

    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Metodo Plato'),
      body: _Contenido(drupalProvider: drupalProvider, alto: args.alto),
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

          final List titulo = contenidoGeneral.titulo.split('|');
          final List items = contenidoGeneral.items.toString().split('|');
          final List imagenes =
              contenidoGeneral.imagenPrincipal.toString().split('|');
          int index = 0;
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    titulo[1],
                    style: DefaultTheme.base.textTheme.headline3,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    contenidoGeneral.descripcion.toString(),
                  ),
                ),
                ...items.map((e) {
                  index++;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: SizedBox(
                        width: double.infinity,
                        child: Text(index.toString() + '. ' + e)),
                  );
                }),
                ...imagenes.map((e) {
                  final url = drupalProvider.baseUrl + e;
                  return ZoomIn(
                      child: ImagenconBordeComponent(
                    url: url,
                    alto: 250,
                  ));
                }),
                // _Vineta(items: items, index: 0),
                // _Vineta(items: items, index: 1),
                // _Vineta(items: items, index: 2),
                // ImagenconBordeComponent(
                //   url: url1,
                //   alto: 250,
                // ),
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
