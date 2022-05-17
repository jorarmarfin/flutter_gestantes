import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

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
              link: 'presentacion',
            ),
            const ItemMenu(
              itemIcono: Icons.apps,
              itemNombre: 'Aplicaciones del INS',
              link: 'aplicaciones',
            ),
            const ItemMenu(
              itemIcono: Icons.share,
              itemNombre: 'Compartir',
              link: 'compartir',
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
    this.link = 'home',
  }) : super(key: key);
  final String itemNombre;
  final IconData itemIcono;
  final String link;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        itemIcono,
        color: Colors.white,
      ),
      onTap: () => Navigator.pushNamed(context, link),
      title: Text(itemNombre),
    );
  }
}
