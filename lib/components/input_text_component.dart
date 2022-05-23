import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

import '../themes/default_theme.dart';

class InputTextComponent extends StatelessWidget {
  const InputTextComponent({
    Key? key,
    required this.placeholder,
    required this.mask,
    required this.maxLength,
  }) : super(key: key);
  final String placeholder;
  final String mask;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
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
          if (value == null) return 'no ingresaste';
          return value.length < maxLength ? 'minimo 3 digitos' : null;
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelText: placeholder),
      ),
    );
  }
}
