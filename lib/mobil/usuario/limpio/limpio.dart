import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils.dart';
import '../../widgets/controlimpio.dart';
import '../home.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class limpio extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    initializeDateFormatting("es_ES", null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/LIMPIEZA",
      theme: ThemeData(
      primarySwatch: mycolor,
    ),
      home: limpioapp(),
    );
  }
}

class limpioapp extends StatefulWidget {
  @override
  State<limpioapp> createState() => _limpioappState();
}

class _limpioappState extends State<limpioapp> {


  TimeOfDay? _eventoHora;
  DateTime hoy = DateTime.now();
  Map<DateTime, List<Evento>> events = {};
  TextEditingController _eventocontrol = TextEditingController();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      hoy = day;
    });
  }


  void agregarEvento(DateTime fecha, String descripcion, TimeOfDay? hora) {
    // Formatea la hora en un formato legible (12 horas) si se proporciona
    final horaFormateada = hora != null
        ? DateFormat('hh:mm a', 'es_ES').format(
      DateTime(fecha.year, fecha.month, fecha.day, hora.hour, hora.minute),
    )
        : null;

    FirebaseFirestore.instance.collection('limpieza').add({
      'fecha': fecha,
      'descripcion': descripcion,
      'hora': horaFormateada,
    }).then((_) {
      // Después de agregar el evento, consulta los datos actualizados
      consultarDatos();
    });
  }



  List<dynamic> datoslimpio = [];
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarDatos();
  }

  // Función para obtener los datos de Firestore
  void consultarDatos() {
    FirebaseFirestore.instance.collection('limpieza').get().then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena los datos en la lista
        datoslimpio = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }


  void mostrarEventos(DateTime fecha) {
    // Filtra los eventos por la fecha seleccionada
    final eventosFechaSeleccionada = datoslimpio.where((evento) {
      final fechaEvento = evento['fecha'] as Timestamp;
      final fechaEventoDateTime = fechaEvento.toDate(); // Convierte Timestamp a DateTime
      return isSameDay(fechaEventoDateTime, fecha);
    }).toList();

    if (eventosFechaSeleccionada.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text("Eventos del día"),
            content: Column(
              children: eventosFechaSeleccionada
                  .map((evento) => ListTile(
                title: Text(evento['descripcion'] ?? ""),
                subtitle: evento['hora'] != null
                    ? Text(
                  "Hora: ${evento['hora']}",
                )
                    : null,
              ))
                  .toList(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              )
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Sin registro"),
            content: Text("Por el momento no hay registro de limpieza en el día."),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cerrar"),
              )
            ],
          );
        },
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body:Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            // homeKpj (15:10)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // autogroup2r9hsbM (ACtGxwNsc9FPUR6mJM2R9H)
                  width: 575 * fem,
                  height: 355 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // materialappCtX (20:3)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              27 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 575 * fem,
                          height: 145 * fem,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(237, 142, 180, 120)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => homemobil()));
                                        },
                                        borderRadius: BorderRadius.circular(50.0),
                                        // Personaliza la forma del botón
                                        child: Container(
                                          width: 30 * fem,
                                          height: 40.05 * fem,
                                          margin: EdgeInsets.only(top: 10*ffem),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              'img/mobil/flecha.png',                                          width: 42 * fem,
                                              height: 40.05 * fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                  width: 494.5 * fem,
                                  height: 132 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 25 * fem,
                                        top: 35 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 229 * fem,
                                            height: 35 * fem,
                                            child: Text(
                                              'LIMPIEZA',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Alfa Slab One',
                                                fontSize: 25 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3675 * ffem / fem,
                                                letterSpacing: 1 * fem,
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle6inK (15:17)
                        left: 51 * fem,
                        top: 84 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 339 * fem,
                            height: 68 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse1STR (15:16)
                        left: 0 * fem,
                        top: 84 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 102 * fem,
                            height: 94 * fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                              width: 102 * fem,
                              height: 94 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8mVh (15:24)
                        left: 27 * fem,
                        top: 78 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 337 * fem,
                            height: 280 * fem,
                            child: Container(
                              child: contenido(),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroup65nftaK (ACtHX1Hmrp7CuN2siq65NF)
                  padding:
                  EdgeInsets.fromLTRB(26 * fem, 0 * fem, 26 * fem, 20 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25 * fem,
                      ),
                      Container(
                        // rectangle13ogb (15:35)
                        width: double.infinity,
                        height: 445 * fem,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 205, 197, 170),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: resultado(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              scrollable: true,
              title: Text("AGREGAR PERSONA"),
              content: Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: _eventocontrol,
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    String eventoDescripcion = _eventocontrol.text;
                    if (eventoDescripcion.isNotEmpty) {
                      agregarEvento(hoy, eventoDescripcion, _eventoHora);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Guardar"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (selectedTime != null) {
                      setState(() {
                        _eventoHora = selectedTime;
                      });
                    }
                  },
                  child: Text(_eventoHora == null
                      ? "Hora"
                      : "Hora seleccionada: ${_eventoHora!.format(context)}"),
                ),

              ],
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget contenido() {

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              locale: "es_ES",
              rowHeight: 43,
              headerStyle:
              HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, hoy),
              focusedDay: hoy,
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(9999, 12, 31),
              onDaySelected: (day, focusedDay) {
                onDaySelected(day, focusedDay);
                mostrarEventos(day);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget resultado() {
    // Filtra los eventos por la fecha seleccionada
    final eventosFechaSeleccionada = datoslimpio.where((evento) {
      final fechaEvento = evento['fecha'] as Timestamp;
      final fechaEventoDateTime = fechaEvento.toDate(); // Convierte Timestamp a DateTime
      return isSameDay(fechaEventoDateTime, hoy);
    }).toList();

    return Column(
      children: [
        SizedBox(height: 16), // Espaciador vertical
        eventosFechaSeleccionada.isNotEmpty
            ? Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "CONTROL DE LIMPIEZA",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 8),
              ListView.builder(
                shrinkWrap: true,
                itemCount: eventosFechaSeleccionada.length,
                itemBuilder: (context, index) {
                  final evento = eventosFechaSeleccionada[index];

                  final descripcion = evento['descripcion'] ?? "";
                  final fechaEvento = evento['fecha'] as Timestamp;
                  final hora = evento['hora'] != null
                      ? "Hora: ${evento['hora']}"
                      : "Sin hora especificada";

                  return ListTile(
                    title: Text(descripcion),
                    subtitle: Text(
                      "Fecha: ${DateFormat('dd/MM/yyyy').format(fechaEvento.toDate())}\n$hora",
                    ),
                  );
                },
              ),
            ],
          ),
        )
            : Container(
          padding: EdgeInsets.all(16),
          child: Text(
            "Aún no se encuentra ningún registro para esta fecha",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }



}