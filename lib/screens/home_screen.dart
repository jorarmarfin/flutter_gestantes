import 'package:flutter/material.dart';
import 'package:flutter_gestantes/themes/default_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routerName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: AppBar(
        title: const Text('¿Cual es su perfil?'),
        centerTitle: true,
        leading: const SizedBox(
          width: 1,
        ),
        actions: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                width: 40,
                margin: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.dehaze,
                  color: colorPrincipal,
                ),
                decoration: containerEstiloBoton(Colors.white, 5),
              ),
            );
          })
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: const [
          _BotonOpcion(
            imagen: icoNutricionistas,
            titulo: 'Nutricionista',
          ),
          _BotonOpcion(
            imagen: icoProfesional,
            titulo: 'Profesional de Salud',
          ),
          _BotonOpcion(
            imagen: icoGestante,
            titulo: 'Gestantes',
          )
        ],
      )),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: colorPrincipal,
        child: ListView(
          children: [
            Container(
              color: colorCrema,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(icoGestante),
                    height: 100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      'NutriGest',
                      style: DefaultTheme.base.textTheme.headline2,
                    ),
                  )
                ],
              ),
            ),
            const ItemMenu(
              itemIcono: Icons.home_outlined,
              itemNombre: 'Inicio',
            ),
            const ItemMenu(
              itemIcono: Icons.slideshow,
              itemNombre: 'Presentacion',
            ),
            const ItemMenu(
              itemIcono: Icons.apps,
              itemNombre: 'Aplicaciones del INS',
            ),
            const ItemMenu(
              itemIcono: Icons.info_outline,
              itemNombre: 'Acerca de Nutrigest',
            ),
          ],
        ));
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.itemNombre,
    required this.itemIcono,
  }) : super(key: key);
  final String itemNombre;
  final IconData itemIcono;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        itemIcono,
        color: Colors.white,
      ),
      onTap: () {},
      title: Text(itemNombre),
    );
  }
}

class _BotonOpcion extends StatelessWidget {
  const _BotonOpcion({
    Key? key,
    required this.imagen,
    required this.titulo,
  }) : super(key: key);
  final String imagen;
  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 150,
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
              )
            ]),
            decoration: containerEstiloBoton(colorNaranja, 20),
          ),
          const Positioned(
            right: 0,
            bottom: 0,
            child: CircleAvatar(
              backgroundColor: colorPrincipal,
              child: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
