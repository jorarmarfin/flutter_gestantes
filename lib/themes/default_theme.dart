import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Colores
const colorPrincipal = Color(0xff711B96);
const colorSecundario = Color(0xff7F32A1);
const colorCrema = Color(0xffFDEBAC);
const colorNaranja = Color(0xffF59F3E);
//#fdebac, #711B96, #7F32A1, #FDEBAC, #F59F3E
//Imagenes
const imgLoading = 'assets/images/loading.gif';

//Iconos
const icoNutricionistas = 'assets/icons/nutricionistas.png';
const icoProfesional = 'assets/icons/profesional.png';
const icoGestante = 'assets/icons/gestante.png';

class DefaultTheme {
  static ThemeData base = ThemeData.light().copyWith(
    primaryColor: colorPrincipal,
    appBarTheme: const AppBarTheme(color: colorPrincipal),
    textTheme: TextTheme(
        headline1: GoogleFonts.akayaTelivigala(
            fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),
        headline2: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)
//headline2-6,subtitle1-2,bodyText1-2,caption
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            maximumSize: Size(5, 8),
            elevation: 0,
            primary: Colors.white,
            onPrimary: Colors.black)),
  );
}

BoxDecoration fondoScreen(String fondo) {
  return BoxDecoration(
    image: DecorationImage(image: AssetImage(fondo), fit: BoxFit.fill),
  );
}

BoxDecoration containerEstiloBoton(color, double radio) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radio),
  );
}

BoxDecoration containerEstiloRecuadro(color, radio) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radio),
  );
}