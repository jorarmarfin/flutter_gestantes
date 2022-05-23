import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class CalculadoraGestanteScreen extends StatelessWidget {
  const CalculadoraGestanteScreen({Key? key}) : super(key: key);
  static String routerName = 'calculadora-gestante';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Menu(),
      backgroundColor: colorCrema,
      appBar: AppBarComponent(titulo: 'Herramientas de apoyo'),
      body: SingleChildScrollView(child: _Contenido()),
    );
  }
}

class _Contenido extends StatelessWidget {
  const _Contenido({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculadoraProvider = Provider.of<CalculadoraProvider>(context);
    return Form(
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Text('VALORACION NUTRICIONAL ANTROPOMÉTRICA',
            style: DefaultTheme.base.textTheme.headline3,
            textAlign: TextAlign.center),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
              'Clasificación del estado nutricional de la gestante según el índice de masa corporal pregestacional'),
        ),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text('¿Conoce el peso pregestacional?'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _MyRadioSi(calculadoraProvider: calculadoraProvider),
            _MyRadioNo(calculadoraProvider: calculadoraProvider),
          ],
        ),
        (calculadoraProvider.selectedRadio)
            ? const InputTextComponent(
                placeholder: 'Peso pregestacional (kg): Ej 69,0',
                maxLength: 4,
                mask: '99,9')
            : Container(),
        const InputTextComponent(
            placeholder: 'Peso actual (kg): Ej 69,2',
            maxLength: 4,
            mask: '99,9'),
        const InputTextComponent(
            placeholder: 'Talla (cm): Ej 165,2', maxLength: 5, mask: '999,9'),
        const InputTextComponent(
            placeholder: 'Edad (años): Ej 32', maxLength: 2, mask: '99'),
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
              'Ganancia de peso según la clasificación del índice de masa corporal pregestacional'),
        ),
        const InputTextComponent(
            placeholder: 'Semana de gestación Ej 13', maxLength: 2, mask: '99'),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: const Text('Tipo Embarazo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _MyRadioUnico(calculadoraProvider: calculadoraProvider),
            _MyRadioMellizos(calculadoraProvider: calculadoraProvider),
          ],
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: const EdgeInsets.all(5),
          decoration: containerEstiloBoton(colorPrincipal, 25),
          child: const Center(
            child: Text(
              'DIAGNOSTICO',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ]),
    );
  }
}

class _MyRadioNo extends StatelessWidget {
  const _MyRadioNo({
    Key? key,
    required this.calculadoraProvider,
  }) : super(key: key);

  final CalculadoraProvider calculadoraProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          decoration: containerEstiloBoton(Colors.white, 20),
          child: Row(children: [
            Radio(
                value: false,
                groupValue: calculadoraProvider.selectedRadio,
                activeColor: Colors.purple,
                onChanged: (value) {
                  calculadoraProvider.selectedRadio = value as bool;
                }),
            const Text('No')
          ]),
        ),
        const Text(
          '* Solo en casos especiales.',
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}

class _MyRadioSi extends StatelessWidget {
  const _MyRadioSi({
    Key? key,
    required this.calculadoraProvider,
  }) : super(key: key);

  final CalculadoraProvider calculadoraProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          decoration: containerEstiloBoton(Colors.white, 20),
          child: Row(children: [
            Radio(
                value: true,
                groupValue: calculadoraProvider.selectedRadio,
                activeColor: Colors.purple,
                onChanged: (value) {
                  calculadoraProvider.selectedRadio = value as bool;
                }),
            const Text('Si')
          ]),
        ),
        const Text('')
      ],
    );
  }
}

class _MyRadioUnico extends StatelessWidget {
  const _MyRadioUnico({
    Key? key,
    required this.calculadoraProvider,
  }) : super(key: key);

  final CalculadoraProvider calculadoraProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          decoration: containerEstiloBoton(Colors.white, 20),
          child: Row(children: [
            Radio(
                value: 'unico',
                groupValue: calculadoraProvider.selectedRadioTipoEmbarazo,
                activeColor: Colors.purple,
                onChanged: (value) {
                  calculadoraProvider.selectedRadioTipoEmbarazo =
                      value as String;
                }),
            const Text('Único')
          ]),
        ),
        const Text('')
      ],
    );
  }
}

class _MyRadioMellizos extends StatelessWidget {
  const _MyRadioMellizos({
    Key? key,
    required this.calculadoraProvider,
  }) : super(key: key);

  final CalculadoraProvider calculadoraProvider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 175,
          decoration: containerEstiloBoton(Colors.white, 20),
          child: Row(children: [
            Radio(
                value: 'mellizos',
                groupValue: calculadoraProvider.selectedRadioTipoEmbarazo,
                activeColor: Colors.purple,
                onChanged: (value) {
                  calculadoraProvider.selectedRadioTipoEmbarazo =
                      value as String;
                }),
            const Text('Múltiple (mellizos)')
          ]),
        ),
        const Text('')
      ],
    );
  }
}
