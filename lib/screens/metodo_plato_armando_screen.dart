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
    double margenizquierdo = (screenSize.width - 320) / 2;
    final localProvider = Provider.of<LocalProvider>(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            localProvider.mostrarTuberculo = false;
            localProvider.mostrarVerdura = false;
            localProvider.mostrarCarne = false;
            localProvider.mostrarFruta = false;
            localProvider.imgPlato = imgPlato0;
          },
          child: Image.asset(icoEscoba),
        ),
        drawer: const Menu(),
        backgroundColor: colorCrema,
        appBar: const AppBarComponent(titulo: 'Armando un Plato'),
        body: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
                //Plato de Fondo
                top: 15,
                left: margenizquierdo,
                child: Image.asset(localProvider.imgPlato, height: 320)),
            Positioned(
                top: 43,
                left: margenizquierdo + 30,
                child: _BotonTuberculo(localProvider: localProvider)),
            Positioned(
                top: 43,
                right: margenizquierdo + 30,
                child: _BotonVerdura(localProvider: localProvider)),
            Positioned(
                top: 170,
                left: margenizquierdo + 30,
                child: _BotonCarne(localProvider: localProvider)),
            if (localProvider.mostrarTuberculo)
              Positioned(
                top: 80,
                left: margenizquierdo + 50,
                child: SizedBox(
                    child: Image.asset(
                  localProvider.tuberculoElegido,
                  height: 70,
                )),
              )
            else
              Container(),
            if (localProvider.mostrarVerdura)
              Positioned(
                top: 150,
                right: margenizquierdo + 30,
                child: SizedBox(
                    child: Image.asset(
                  localProvider.verduraElegida,
                  height: 70,
                )),
              )
            else
              Container(),
            if (localProvider.mostrarCarne)
              Positioned(
                top: 190,
                left: margenizquierdo + 50,
                child: SizedBox(
                    child: Image.asset(
                  localProvider.carneElegida,
                  height: 70,
                )),
              )
            else
              Container(),
            Positioned(
              top: 350,
              right: 40,
              child: _BotonFruta(localProvider: localProvider),
            ),
            if (localProvider.mostrarFruta)
              Positioned(
                top: 400,
                right: margenizquierdo + 40,
                child: SizedBox(
                    child: Image.asset(
                  localProvider.frutaElegida,
                  height: 100,
                )),
              )
            else
              Container(),
          ],
        ));
  }
}

class _BotonTuberculo extends StatelessWidget {
  const _BotonTuberculo({
    Key? key,
    required this.localProvider,
  }) : super(key: key);

  final LocalProvider localProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    const Text(
                      'Cereales, tubéculos y menestras',
                      style: TextStyle(color: colorPrincipal),
                    ),
                    _Alimento(
                        localProvider: localProvider,
                        tipoAlimento: 't',
                        imagenDeAlimento: imgTuberculo1),
                    const SizedBox(
                      height: 5,
                    ),
                    _Alimento(
                        localProvider: localProvider,
                        tipoAlimento: 't',
                        imagenDeAlimento: imgTuberculo2),
                  ],
                ),
              );
            });
      },
      child: Container(
          height: 130,
          width: 130,
          color: Colors.white.withOpacity(0.05)), //withOpacity(0.05)
    );
  }
}

class _BotonVerdura extends StatelessWidget {
  const _BotonVerdura({
    Key? key,
    required this.localProvider,
  }) : super(key: key);

  final LocalProvider localProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 5,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Verduras',
                        style: TextStyle(color: colorPrincipal),
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'v',
                          imagenDeAlimento: imgVerdura1),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'v',
                          imagenDeAlimento: imgVerdura2),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'v',
                          imagenDeAlimento: imgVerdura3),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'v',
                          imagenDeAlimento: imgVerdura4),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
          height: 270,
          width: 130,
          color: Colors.green.withOpacity(0.05)), //withOpacity(0.05)
    );
  }
}

class _BotonCarne extends StatelessWidget {
  const _BotonCarne({
    Key? key,
    required this.localProvider,
  }) : super(key: key);

  final LocalProvider localProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 5,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Carnes pescado y huevo',
                        style: TextStyle(color: colorPrincipal),
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'c',
                          imagenDeAlimento: imgCarne1),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'c',
                          imagenDeAlimento: imgCarne2),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'c',
                          imagenDeAlimento: imgCarne3),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
          height: 130,
          width: 130,
          color: Colors.orange.withOpacity(0.05)), //withOpacity(0.05)
    );
  }
}

class _BotonFruta extends StatelessWidget {
  const _BotonFruta({
    Key? key,
    required this.localProvider,
  }) : super(key: key);

  final LocalProvider localProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 5,
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Frutas',
                        style: TextStyle(color: colorPrincipal),
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'f',
                          imagenDeAlimento: imgFruta1),
                      const SizedBox(
                        height: 5,
                      ),
                      _Alimento(
                          localProvider: localProvider,
                          tipoAlimento: 'f',
                          imagenDeAlimento: imgFruta2),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        decoration: containerEstiloBoton(colorPrincipal, 20),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'FRUTAS',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.add, color: Colors.white)
            ]),
      ), //withOpacity(0.05)
    );
  }
}

class _Alimento extends StatelessWidget {
  const _Alimento({
    Key? key,
    required this.localProvider,
    required this.imagenDeAlimento,
    required this.tipoAlimento,
  }) : super(key: key);

  final LocalProvider localProvider;
  final String imagenDeAlimento;
  final String tipoAlimento;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (tipoAlimento == 't') {
            localProvider.mostrarTuberculo = true;
            localProvider.tuberculoElegido = imagenDeAlimento;
          }
          if (tipoAlimento == 'v') {
            localProvider.mostrarVerdura = true;
            localProvider.verduraElegida = imagenDeAlimento;
          }
          if (tipoAlimento == 'c') {
            localProvider.mostrarCarne = true;
            localProvider.carneElegida = imagenDeAlimento;
          }
          if (tipoAlimento == 'f') {
            localProvider.mostrarFruta = true;
            localProvider.frutaElegida = imagenDeAlimento;
          }

          Navigator.pop(
            context,
          );
        },
        child: Image.asset(imagenDeAlimento));
  }
}
