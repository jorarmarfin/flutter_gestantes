import 'package:flutter/material.dart';

import '../components/components.dart';
import '../themes/default_theme.dart';

class CreditosScreen extends StatelessWidget {
  const CreditosScreen({Key? key}) : super(key: key);
  static String routerName = 'creditos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Creditos'),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: const [_Contenido(), BotonFooter()],
      ),
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      SizedBox(
        height: 20,
      ),
      FadeInImage(
          placeholder: AssetImage(imgLoading), image: AssetImage(imgINS)),
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'NutriGest Herramienta de apoyo para la atención nutricional de gestantes, es una APP diseñada, desarrollada y validada por los profesionales de la salud nutricionistas: Lic. Luis Aguilar Esenarro, Lic. César Domínguez Curi y Lic. Carmen Valladares Escobedo de la Dirección Ejecutiva de Prevención de Riesgo y Daño Nutricional del Centro Nacional de Alimentación y Nutrición del Instituto Nacional de salud. Lima, Perú.',
          textAlign: TextAlign.justify,
        ),
      ),
      SizedBox(
        height: 200,
      )
    ]);
  }
}
