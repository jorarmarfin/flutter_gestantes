import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class MetodoPlatoMedidaCorrectaScreen extends StatelessWidget {
  const MetodoPlatoMedidaCorrectaScreen({Key? key}) : super(key: key);
  static String routerName = 'metodo-plato-medida';

  @override
  Widget build(BuildContext context) {
    final drupalProvider = Provider.of<DrupalProvider>(context);

    return Scaffold(
        drawer: const Menu(),
        backgroundColor: colorCrema,
        appBar: const AppBarComponent(titulo: 'Metodo Plato'),
        body: Text('data'));
  }
}
