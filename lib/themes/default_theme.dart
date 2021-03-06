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
const imgINS = 'assets/images/ins.png';
const imgPlato0 = 'assets/images/plato-0.png';
const imgPlato1 = 'assets/images/plato-1.png';
const imgTuberculo1 = 'assets/images/t01.png';
const imgTuberculo2 = 'assets/images/t02.png';
const imgVerdura1 = 'assets/images/verdura1.png';
const imgVerdura2 = 'assets/images/verdura2.png';
const imgVerdura3 = 'assets/images/verdura3.png';
const imgVerdura4 = 'assets/images/verdura4.png';
const imgCarne1 = 'assets/images/carne1.png';
const imgCarne2 = 'assets/images/carne2.png';
const imgCarne3 = 'assets/images/carne3.png';
const imgFruta1 = 'assets/images/fruta1.png';
const imgFruta2 = 'assets/images/fruta2.png';
const imgGestanteResultado = 'assets/images/gestante-resultado.png';

//Iconos
const icoNutricionistas = 'assets/icons/nutricionistas.png';
const icoProfesional = 'assets/icons/profesional.png';
const icoGestante = 'assets/icons/gestante.png';
const icoPresentacion = 'assets/icons/presentacion-icon.png';
const icoComoAlimentarse = 'assets/icons/como-alimentarse.png';
const icoListaIntercambio = 'assets/icons/lista-de-intercambio.png';
const icoMetodoMano = 'assets/icons/metodo-de-la-mano.png';
const icoMetodoPlato = 'assets/icons/metodo-del-plato.png';
const icoAlimentacionSaludable = 'assets/icons/alimentacion-saludable.png';
const icoPublicaciones = 'assets/icons/publicaciones.png';
const icoRecetarios = 'assets/icons/recetarios.png';
const icoCalculadoras = 'assets/icons/calculadoras.png';
const icoEscoba = 'assets/icons/escoba.png';

class DefaultTheme {
  static ThemeData base = ThemeData.light().copyWith(
    primaryColor: colorPrincipal,
    appBarTheme: const AppBarTheme(color: colorPrincipal),
    textTheme: TextTheme(
      headline1: GoogleFonts.akayaTelivigala(
          fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold),
      headline2: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      headline3: const TextStyle(
          color: colorPrincipal, fontSize: 25, fontWeight: FontWeight.bold),
      bodyText2: const TextStyle(color: colorPrincipal),
//headline2-6,subtitle1-2,bodyText1-2,caption
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: colorPrincipal),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            maximumSize: const Size(5, 8),
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

BoxDecoration containerEstiloBotonHeader(color, double radio) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radio), topRight: Radius.circular(radio)),
  );
}

BoxDecoration containerEstiloRecuadro(color, radio) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(radio),
  );
}
