import 'package:flutter/material.dart';
import 'package:flutter_gestantes/themes/default_theme.dart';

import '../components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routerName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(
          titulo: '¿Cuál es tu perfil?', botonBack: false),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          _BotonOpcion(
            imagen: icoNutricionistas,
            titulo: 'Nutricionista',
            link: 'nutricionista',
          ),
          _BotonOpcion(
            imagen: icoProfesional,
            titulo: 'Profesional de Salud',
            link: 'profesional',
          ),
          _BotonOpcion(
            imagen: icoGestante,
            titulo: 'Gestantes',
            link: 'gestante',
          )
        ],
      )),
    );
  }
}

class _BotonOpcion extends StatelessWidget {
  const _BotonOpcion({
    Key? key,
    required this.imagen,
    required this.titulo,
    required this.link,
  }) : super(key: key);
  final String imagen;
  final String titulo;
  final String link;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, link),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 140,
              child: Row(children: [
                Image(image: AssetImage(imagen)),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    titulo,
                    style: DefaultTheme.base.textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ]),
              decoration: containerEstiloBoton(colorNaranja, 20),
            ),
            const Positioned(
              right: -12,
              bottom: 50,
              child: CircleAvatar(
                backgroundColor: colorPrincipal,
                child: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
