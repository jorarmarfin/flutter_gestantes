import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoPlatoEjemplosRealesScreen extends StatelessWidget {
  const MetodoPlatoEjemplosRealesScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-plato-ejemplos';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);

    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Ejemlos Reales'),
      body: FutureBuilder(
        future: drupalProvider.getContenidoGeneral(drupalProvider.nid),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final contenidoGeneral = drupalProvider.contenidoGeneral;
            final imagenPrincipal =
                contenidoGeneral.imagenPrincipal.toString().split('|');
            final imagen = contenidoGeneral.imagen.toString().split('|');
            imagen.addAll(imagenPrincipal);
            return ListView.builder(
              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: imagen.length,
              itemBuilder: (BuildContext context, int index) {
                final url = drupalProvider.baseUrl + imagen[index];
                return ZoomIn(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image(
                        image: NetworkImage(url, scale: 0.05),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
