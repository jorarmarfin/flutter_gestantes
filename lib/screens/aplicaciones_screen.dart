import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class AplicacionesScreen extends StatelessWidget {
  const AplicacionesScreen({Key? key}) : super(key: key);
  static String routerName = 'aplicaciones';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Nuestras Aplicaciones'),
      body: FutureBuilder(
        future: drupalProvider.getAplicaciones(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: drupalProvider.listaAplicaciones.length,
              itemBuilder: (BuildContext context, int index) {
                final aplicacion = drupalProvider.listaAplicaciones[index];
                final imagen = drupalProvider.baseUrl + aplicacion.imagen;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                image: NetworkImage(imagen),
                                width: 100,
                              )),
                          Expanded(
                              child: Text(
                            aplicacion.titulo,
                            textAlign: TextAlign.center,
                            style: DefaultTheme.base.textTheme.headline3,
                          ))
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(aplicacion.descripcion,
                            textAlign: TextAlign.justify)),
                    GestureDetector(
                      onTap: () {
                        final Uri _url = Uri.parse(aplicacion.enlace);
                        _launchInBrowser(_url);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(15),
                        width: double.infinity,
                        decoration: containerEstiloBoton(colorPrincipal, 20),
                        child: Text(
                          'DESCARGAR',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

}
