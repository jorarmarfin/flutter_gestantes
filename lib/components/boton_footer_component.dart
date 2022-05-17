import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class BotonFooter extends StatelessWidget {
  const BotonFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: colorPrincipal,
      child: Row(
        children: [
          const SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'home'),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: containerEstiloBoton(Colors.white, 5),
              child: Row(children: const [
                Icon(Icons.home, color: colorPrincipal),
                Text(
                  'Inicio',
                  style: TextStyle(color: colorPrincipal),
                )
              ]),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }
}
