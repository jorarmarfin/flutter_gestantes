import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoManoPageScreen extends StatelessWidget {
  const MetodoManoPageScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-mano-page';

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
          final List imagenes = contenidoGeneral.imagen.toString().split('|');
          // final url = drupalProvider.baseUrl +
          //     contenidoGeneral.imagenPrincipal.toString();
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
                ...imagenes.map((e) {
                  final url = drupalProvider.baseUrl + e;
                  return ZoomIn(child: ImagenconBordeComponent(url: url));
                }),
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
