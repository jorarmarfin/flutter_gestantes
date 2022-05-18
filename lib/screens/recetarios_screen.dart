import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gestantes/models/recetarios_model.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class RecetariosScreen extends StatelessWidget {
  const RecetariosScreen({Key? key}) : super(key: key);
  static String routerName = 'recetarios';

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
      appBar: const AppBarComponent(titulo: 'Recetarios'),
      body: FutureBuilder(
        future: drupalProvider.getRecetarios('Gestante'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final recetas = drupalProvider.listaRecetas;
            return ListView.builder(
                itemCount: recetas.length,
                itemBuilder: (BuildContext context, int index) {
                  final url = drupalProvider.baseUrl + recetas[index].imagen;
                  return ZoomIn(
                    child: GestureDetector(
                        onTap: () => drupalProvider
                            .launchInBrowser(recetas[index].enlace),
                        child: _ItemReceta(
                          url: url,
                          recetas: recetas,
                          index: index,
                        )),
                  );
                });
          }
        },
      ),
    );
  }
}

class _ItemReceta extends StatelessWidget {
  const _ItemReceta({
    Key? key,
    required this.url,
    required this.recetas,
    required this.index,
  }) : super(key: key);

  final String url;
  final List<RecetaModel> recetas;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(children: [
            Image(image: NetworkImage(url)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                recetas[index].titulo,
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
