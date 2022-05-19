import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoPlatoArmandoScreen extends StatelessWidget {
  const MetodoPlatoArmandoScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-plato-armando';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);

    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Metodo Plato'),
      body: Text('data')
    );
  }
}

