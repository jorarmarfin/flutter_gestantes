import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../providers/providers.dart';
import '../themes/default_theme.dart';

class DiagnosticoGestanteScreen extends StatelessWidget {
  const DiagnosticoGestanteScreen({Key? key}) : super(key: key);
  static String routerName = 'diagnostico-gestante';

  @override
  Widget build(BuildContext context) {
    final calculadoraProvider = Provider.of<CalculadoraProvider>(context);
    calculadoraProvider.calculaIndiceMasaCorporalPreGestacional();
    // calculadoraProvider.calculaClasificacionIndiceMasaCorporalPreGestacional();
    // calculadoraProvider.calculaGananciaPeso();

    return Scaffold(
      drawer: const Menu(),
      backgroundColor: colorCrema,
      appBar: const AppBarComponent(titulo: 'Diagnostico'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TablaDiagnostico3Result(
              tablaTitulo: 'Clasificación del IMC PG',
              label1: 'PESO PREGESTACIONAL:',
              result1: (calculadoraProvider.radioConocePesoPGEstacional)
                  ? calculadoraProvider.pesoPreGestacional.toString() + ' kg'
                  : calculadoraProvider.pesoPreGestacionalEstimado.toString() +
                      'kg (Estimado)',
              label2: 'IMC PG:',
              result2: calculadoraProvider.imcpg.toString(),
              label3: 'CLASIFICACIÓN:',
              result3: calculadoraProvider.clasificacionImcpg,
            ),
            const TablaDiagnostico3Result(
              tablaTitulo: 'Ganancia de peso segun clasificación del IMC PG',
              label1: 'PESO ACTUAL:',
              result1: '69,2 kg',
              label2: 'GANANCIA DE PESO ACTUAL:',
              result2: '0,2 kg',
              label3: 'CLASIFICACIÓN:',
              result3: 'Baja ganancia de peso',
            ),
            const TablaDiagnostico2Result(
              tablaTitulo:
                  'Clasificación de la altura uterina según la edad gestacional',
              label1: 'ALTURA UTERINA ACTUAL:',
              result1: '13 cm',
              label2: 'CLASIFICACIÓN:',
              result2: 'Valor Anormal',
            ),
            (calculadoraProvider.esGestante)
                ? const _MensajeGestante()
                : Container()
          ],
        ),
      ),
    );
  }
}

class _MensajeGestante extends StatelessWidget {
  const _MensajeGestante({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: containerEstiloBoton(Colors.white, 20),
          child: Row(children: [
            Image.asset(imgGestanteResultado),
            Expanded(
              child: Column(
                children: const [
                  Text(
                      'Incrementa el peso, recuerda que no solo es el bebé quien crece sino también la placenta y otros órganos de tu cuerpo.'),
                  SizedBox(
                    height: 9,
                  ),
                  Text('Náuseas y vómitos en los primeros meses.'),
                  SizedBox(
                    height: 9,
                  ),
                  Text('Algunas veces puede tener estreñimiento.'),
                  SizedBox(
                    height: 9,
                  ),
                  Text('Es normal que te sientas muy sensible.'),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class TablaDiagnostico3Result extends StatelessWidget {
  const TablaDiagnostico3Result({
    Key? key,
    required this.tablaTitulo,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.result1,
    required this.result2,
    required this.result3,
  }) : super(key: key);
  final String tablaTitulo;
  final String label1;
  final String label2;
  final String label3;
  final String result1;
  final String result2;
  final String result3;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        height: 170,
        width: double.infinity,
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                tablaTitulo,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              decoration: containerEstiloBotonHeader(colorPrincipal, 20)),
          Table(
            children: [
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label1),
                )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result1),
                    )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label2),
                )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result2),
                    )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label3),
                )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result3,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ]),
            ],
          ),
        ]),
        decoration: containerEstiloBoton(Colors.white, 20));
  }
}

class TablaDiagnostico2Result extends StatelessWidget {
  const TablaDiagnostico2Result({
    Key? key,
    required this.tablaTitulo,
    required this.label1,
    required this.label2,
    required this.result1,
    required this.result2,
  }) : super(key: key);
  final String tablaTitulo;
  final String label1;
  final String label2;

  final String result1;
  final String result2;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        height: 140,
        width: double.infinity,
        child: Column(children: [
          Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Text(
                tablaTitulo,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
              decoration: containerEstiloBotonHeader(colorPrincipal, 20)),
          Table(
            children: [
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label1),
                )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(result1),
                    )),
              ]),
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(label2),
                )),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        result2,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              ]),
            ],
          ),
        ]),
        decoration: containerEstiloBoton(Colors.white, 20));
  }
}
