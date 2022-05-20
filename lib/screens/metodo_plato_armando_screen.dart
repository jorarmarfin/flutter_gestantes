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
    var screenSize = MediaQuery.of(context).size;
    final localProvider = Provider.of<LocalProvider>(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => localProvider.mostrarTuberculo = false,
          child: Image.asset(icoEscoba),
        ),
        drawer: const Menu(),
        backgroundColor: colorCrema,
        appBar: const AppBarComponent(titulo: 'Armando un Plato3'),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(imgPlato0),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        elevation: 5,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  localProvider.mostrarTuberculo = true;
                                  Navigator.pop(
                                    context,
                                  );
                                },
                                child: Image.asset(imgTuberculo1)),
                            const SizedBox(
                              height: 5,
                            ),
                            Image.asset(imgTuberculo2),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                  height: screenSize.height * 0.3,
                  width: screenSize.width * 0.5,
                  color: Colors.white.withOpacity(0.05)),
            ),
            (localProvider.mostrarTuberculo)
                ? Container(
                    padding: const EdgeInsets.only(left: 45, top: 45),
                    height: screenSize.height * 0.3,
                    width: screenSize.width * 0.5,
                    child: Image.asset(imgTuberculo1))
                : Container(),
            Text('MIRAAAAA->' + localProvider.mostrarTuberculo.toString())
          ],
        ));
  }
}
