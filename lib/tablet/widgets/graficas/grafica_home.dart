import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class grafica extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(
    Color.fromRGBO(229, 203, 206, 1).value,
    <int, Color>{
      50: Color.fromRGBO(229, 203, 206, 0.1),
      100: Color.fromRGBO(229, 203, 206, 0.2),
      200: Color.fromRGBO(229, 203, 206, 0.3),
      300: Color.fromRGBO(229, 203, 206, 0.4),
      400: Color.fromRGBO(229, 203, 206, 0.5),
      500: Color.fromRGBO(229, 203, 206, 0.6),
      600: Color.fromRGBO(229, 203, 206, 0.7),
      700: Color.fromRGBO(229, 203, 206, 0.8),
      800: Color.fromRGBO(229, 203, 206, 0.9),
      900: Color.fromRGBO(229, 203, 206, 1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "HOME",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: graficahome(),
    );
  }
}

class graficahome extends StatefulWidget {
  const graficahome({super.key});

  @override
  State<graficahome> createState() => _graficahomeState();
}

class _graficahomeState extends State<graficahome> {
  int sumaDestetados = 0;

  @override
  void initState() {
    super.initState();
    sumarDestetados();
  }

  Future<int> sumarDestetados() async {
    CollectionReference hojaDeVidaCollection =
    FirebaseFirestore.instance.collection('hoja_devida');

    QuerySnapshot snapshot = await hojaDeVidaCollection.get();

    snapshot.docs.forEach((DocumentSnapshot document) {
      int destetados = (document.data() as Map<String, dynamic>?)?['destetados'] as int? ?? 0;

      sumaDestetados += destetados;
    });

    return sumaDestetados;
  }

  final CollectionReference machosCollection = FirebaseFirestore.instance.collection('registro_macho');
  final CollectionReference hembrasCollection = FirebaseFirestore.instance.collection('registro_hembra');

  Future<int> getCountMachos() async {
    QuerySnapshot snapshot = await machosCollection.get();
    return snapshot.size;
  }

  Future<int> getCountHembras() async {
    QuerySnapshot snapshot = await hembrasCollection.get();
    return snapshot.size;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: generateData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error al obtener los datos');
                } else {
                  return SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    series: <BarSeries>[
                      BarSeries<Map<String, dynamic>, String>(
                        dataSource: snapshot.data ?? [],
                        xValueMapper: (datum, index) =>
                            datum['category'].toString(),
                        yValueMapper: (datum, index) => datum['value'],
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.inside,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            onTap: () async {
              int machosCount = await getCountMachos();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Tocaste el gráfico'),
                    content: Text('Número de Machos: $machosCount'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> generateData() async {
    int machosCount = await getCountMachos();
    int hembrasCount = await getCountHembras();

    return [
      {'category': 'HEMBRAS', 'value': hembrasCount},
      {'category': 'MACHOS', 'value': machosCount},
      {'category': 'CRIAS', 'value': sumaDestetados},
      // Puedes agregar más datos según sea necesario
    ];
  }

}
