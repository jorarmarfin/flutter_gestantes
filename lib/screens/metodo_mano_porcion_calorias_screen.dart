import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoManoPorcionCaloriasScreen extends StatelessWidget {
  const MetodoManoPorcionCaloriasScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-mano-porcion-calorias';

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
      //drupalProvider.nid
      future: drupalProvider.getContenidoGeneral(32),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final contenidoGeneral = drupalProvider.contenidoGeneral;
          final List<String> grupos = [
            'Grupo 1. Cereales tubérculos y menestras',
            'Grupo 2. Verduras',
            'Grupo 3. Frutas',
            'Grupo 4. Lácteos y Derivados',
            'Grupo 5. Carnes, pescados y Huevos',
            'Grupo 6. Azúcares y Derivados',
            'Grupo 7. Grasas',
          ];
          final List titulo = contenidoGeneral.titulo.split('|');
          final List tarjetas = contenidoGeneral.tarjetas.toString().split('|');
          final List imagenes = contenidoGeneral.imagen.toString().split('|');
          final List etiquetas =
              contenidoGeneral.imagenEtiqueta.toString().split('|');
          List grupo = [];
          List etiquetaGrupo = [];
          String tmp = etiquetas[0];
          int suma = 0;
          for (var i = 0; i < etiquetas.length; i++) {
            if (etiquetas[i] == tmp) {
              suma++;
            } else {
              etiquetaGrupo.add(suma);
              tmp = etiquetas[i];
              suma = 1;
            }
          }
          etiquetaGrupo.add(suma);

          final List imgAlimentos = [];
          for (var i = 0; i < etiquetaGrupo[0]; i++) {
            grupo.add(imagenes[i]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[1]; i++) {
            num j = i + etiquetaGrupo[0];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[2]; i++) {
            num j = i + etiquetaGrupo[0] + etiquetaGrupo[1];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[3]; i++) {
            num j = i + etiquetaGrupo[0] + etiquetaGrupo[1] + etiquetaGrupo[2];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[4]; i++) {
            num j = i +
                etiquetaGrupo[0] +
                etiquetaGrupo[1] +
                etiquetaGrupo[2] +
                etiquetaGrupo[3];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[5]; i++) {
            num j = i +
                etiquetaGrupo[0] +
                etiquetaGrupo[1] +
                etiquetaGrupo[2] +
                etiquetaGrupo[3] +
                etiquetaGrupo[4];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);
          grupo = [];
          for (var i = 0; i < etiquetaGrupo[6]; i++) {
            num j = i +
                etiquetaGrupo[0] +
                etiquetaGrupo[1] +
                etiquetaGrupo[2] +
                etiquetaGrupo[3] +
                etiquetaGrupo[4] +
                etiquetaGrupo[5];
            grupo.add(imagenes[j.toInt()]);
          }
          imgAlimentos.add(grupo);

          int indice = -1;
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
                ...grupos.map((e) {
                  indice++;
                  return _TarjetaGrupo(
                      contador: indice,
                      nombreGrupo: e,
                      tarjetas: tarjetas,
                      drupalProvider: drupalProvider,
                      grupo1: imgAlimentos[indice]);
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

class _TarjetaGrupo extends StatelessWidget {
  const _TarjetaGrupo({
    Key? key,
    required this.tarjetas,
    required this.drupalProvider,
    required this.grupo1,
    required this.contador,
    required this.nombreGrupo,
  }) : super(key: key);

  final List tarjetas;
  final DrupalProvider drupalProvider;
  final List grupo1;
  final int contador;
  final String nombreGrupo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
          child: Container(
              margin: const EdgeInsets.all(8.0),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    nombreGrupo,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(tarjetas[contador]),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 200,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return ZoomIn(
                          child: Image.network(
                            drupalProvider.baseUrl + grupo1[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                      itemCount: grupo1.length,
                      control: const SwiperControl(),
                    ),
                  )
                ],
              ))),
    );
  }
}
