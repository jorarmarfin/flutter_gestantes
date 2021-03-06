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
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Alimentación saludable'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _Contenido(drupalProvider: drupalProvider),
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
  }) : super(key: key);
  final DrupalProvider drupalProvider;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
