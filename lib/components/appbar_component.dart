import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({Key? key, required this.titulo, this.botonBack = true})
      : super(key: key);
  final String titulo;
  final bool botonBack;

  @override
  Widget build(BuildContext context) {
    final widgetBack = (botonBack)
        ? const BackButton()
        : const SizedBox(
            width: 1,
          );
    return AppBar(
      title: Text(titulo),
      centerTitle: true,
      leading: widgetBack,
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
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
