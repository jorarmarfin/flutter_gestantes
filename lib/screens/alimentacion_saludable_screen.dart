import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class AlimentacionSaludableScreen extends StatelessWidget {
  const AlimentacionSaludableScreen({Key? key}) : super(key: key);
  static String routerName = 'alimentacion-saludable';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'home'),
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Alimentación saludable'),
      body: FutureBuilder(
        future: drupalProvider.getContenidoGeneral(59),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final contenidoGeneral = drupalProvider.contenidoGeneral;
            final url = drupalProvider.baseUrl +
                contenidoGeneral.imagenPrincipal.toString();
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(contenidoGeneral.descripcion.toString()),
                GestureDetector(
                    onTap: () {
                      drupalProvider
                          .launchInBrowser(contenidoGeneral.mensaje.toString());
                    },
                    child: ImagenconBordeComponent(url: url)),
              ],
            );
          }
        },
      ),
    );
  }
}
