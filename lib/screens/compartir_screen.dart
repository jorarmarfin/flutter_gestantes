import 'package:flutter/material.dart';

import '../components/components.dart';
import '../themes/default_theme.dart';

class CompartirScreen extends StatelessWidget {
  const CompartirScreen({Key? key}) : super(key: key);
  static String routerName = 'compartir';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Compartir'),
      body: Column(children: const [
        SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(imgINS),
          width: 100,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'NutriGest es una aplicación móvil desarrollada para los profesionales de la salud nutricionistas como herramienta de apoyo para la atención nutricional de gestantes, que busca contribuir a optimizar el tiempo destinado para dicha atención, a fin de ofrecer una atención especializada y de calidad. Fue elaborada a partir de las necesidades identificadas por los profesionales de la salud nutricionistas para brindar una mejor atención nutricional a las gestantes. Asimismo, permite a profesionales de la salud y gestantes en general identificar de modo referencial la clasificación de su estado nutricional según el índice de masa corporal pregestacional, la ganancia de peso y la clasificación de la altura uterina según la edad gestacional; brindando mensajes claves para una alimentación saludable.',
            textAlign: TextAlign.justify,
          ),
        )
      ]),
    );
  }
}
