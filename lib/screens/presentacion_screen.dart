import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class PresentacionScreen extends StatelessWidget {
  const PresentacionScreen({Key? key}) : super(key: key);
  static String routerName = 'presentacion';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    final size = MediaQuery.of(context).size;
    final alto = size.height;
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Presentación'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _Contenido(drupalProvider: drupalProvider, alto: alto),
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
      future: drupalProvider.getPresentacion('presentacion'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final url =
              drupalProvider.baseUrl + drupalProvider.presentacion.imagen;
          return SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(url),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  drupalProvider.presentacion.resumen,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 150,
              )
            ]),
          );
        }
      },
    );
  }
}
