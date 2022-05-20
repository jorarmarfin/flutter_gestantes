import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoManoDistorsionScreen extends StatelessWidget {
  const MetodoManoDistorsionScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-mano-distorsion';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);

    return Scaffold(
        drawer: const Menu(),
        backgroundColor: colorCrema,
        appBar: const AppBarComponent(titulo: 'Porciones de alimento'),
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
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 200,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ZoomIn(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            drupalProvider.baseUrl + imagenes[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    itemCount: imagenes.length,
                    control: const SwiperControl(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(contenidoGeneral.mensaje.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ZoomIn(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        drupalProvider.baseUrl +
                            contenidoGeneral.imagenPrincipal.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
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
