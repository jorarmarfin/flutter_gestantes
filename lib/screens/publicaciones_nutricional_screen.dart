import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestantes/models/models.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class PublicacionesNutricionalScreen extends StatelessWidget {
  const PublicacionesNutricionalScreen({Key? key}) : super(key: key);
  static String routerName = 'publicaciones-nutricional';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Publicaciones'),
      body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        _Contenido(drupalProvider: drupalProvider),
        const BotonFooter()
      ]),
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
      future: drupalProvider.getPublicaciones('Nutricionista'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final listPublicaciones = drupalProvider.listaPublicaciones;
          return ListView.builder(
              itemCount: listPublicaciones.length,
              itemBuilder: (BuildContext context, int index) {
                final url =
                    drupalProvider.baseUrl + listPublicaciones[index].imagen;
                final enlace = (listPublicaciones[index]
                        .archivo
                        .contains('pdf'))
                    ? drupalProvider.baseUrl + listPublicaciones[index].archivo
                    : listPublicaciones[index].enlace;
                return Column(
                  children: [
                    ZoomIn(
                      child: GestureDetector(
                          onTap: () => drupalProvider.launchInBrowser(enlace),
                          child: _ItemReceta(
                            url: url,
                            publicaciones: listPublicaciones,
                            index: index,
                          )),
                    ),
                    (index == listPublicaciones.length - 1)
                        ? const SizedBox(
                            height: 50,
                          )
                        : Container()
                  ],
                );
              });
        }
      },
    );
  }
}

class _ItemReceta extends StatelessWidget {
  const _ItemReceta({
    Key? key,
    required this.url,
    required this.publicaciones,
    required this.index,
  }) : super(key: key);

  final String url;
  final List<PublicacionModel> publicaciones;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(children: [
            Image(
              image: NetworkImage(url),
              height: 100,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  publicaciones[index].titulo,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
