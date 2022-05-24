import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../themes/default_theme.dart';

class InputTextComponent extends StatelessWidget {
  const InputTextComponent({
    Key? key,
    required this.placeholder,
    required this.mask,
    required this.maxLength,
    required this.variableProvider,
  }) : super(key: key);
  final String placeholder;
  final String mask;
  final int maxLength;
  final String variableProvider;

  @override
  Widget build(BuildContext context) {
    final calculadoraProvider = Provider.of<CalculadoraProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: containerEstiloBoton(Colors.white, 20),
      child: TextFormField(
        style: const TextStyle(color: colorPrincipal),
        keyboardType: TextInputType.phone,
        maxLength: maxLength,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [TextInputMask(mask: mask, reverse: false)],
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              value.length < maxLength ||
              double.parse(value) <= 0) {
            return 'El valor ingresado no es valido';
          }
          if (variableProvider == 'edad' && int.parse(value) < 12) {
            return 'El valor ingresado no es valido';
          }
          return null;
        },
        onChanged: (value) {
          if (value != "") {
            if (variableProvider == 'pesoPreGestacional') {
              calculadoraProvider.pesoPreGestacional = double.parse(value);
            }
            if (variableProvider == 'pesoActual') {
              calculadoraProvider.pesoActual = double.parse(value);
            }
            if (variableProvider == 'talla') {
              calculadoraProvider.talla = double.parse(value);
            }
            if (variableProvider == 'edad') {
              calculadoraProvider.edad = int.parse(value);
            }
            if (variableProvider == 'semanaGestacion') {
              calculadoraProvider.semanaGestacion = int.parse(value);
            }
            if (variableProvider == 'altura-uterina') {
              calculadoraProvider.alturaUterina = int.parse(value);
            }
          }
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelText: placeholder),
      ),
    );
  }
}
