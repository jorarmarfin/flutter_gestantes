import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class ComoAlimentarseScreen extends StatelessWidget {
  const ComoAlimentarseScreen({Key? key}) : super(key: key);
  static String routerName = 'como-alimentarse';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: '¿Como alimentarse?'),
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
      future: drupalProvider.getContenidoGeneral(46),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final arrayImagenes =
              drupalProvider.contenidoGeneral.imagen.toString().split('|');
          return ListView.builder(
              itemCount: arrayImagenes.length,
              itemBuilder: (BuildContext context, int index) {
                final url = drupalProvider.baseUrl + arrayImagenes[index];
                return ZoomIn(
                    child: Column(
                  children: [
                    ImagenconBordeComponent(url: url),
                    (index == arrayImagenes.length - 1)
                        ? const SizedBox(
                            height: 50,
                          )
                        : Container()
                  ],
                ));
              });
        }
      },
    );
  }
}
