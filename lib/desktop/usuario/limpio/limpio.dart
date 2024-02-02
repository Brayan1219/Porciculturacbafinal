import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../mobil/widgets/controlimpio.dart';
import '../../../utils.dart';
import '../home.dart';
import 'package:intl/date_symbol_data_local.dart';

class limpio_desk extends StatelessWidget {
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
      home: limpio_des(),
    );
  }
}

class limpio_des extends StatefulWidget {
  @override
  State<limpio_des> createState() => _limpio_desState();

}

class _limpio_desState extends State<limpio_des> {
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
            DateTime(
                fecha.year, fecha.month, fecha.day, hora.hour, hora.minute),
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
    datoslimpio.clear();
    FirebaseFirestore.instance
        .collection('limpieza')
        .get()
        .then((QuerySnapshot querySnapshot) {
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
      final fechaEventoDateTime =
          fechaEvento.toDate(); // Convierte Timestamp a DateTime
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
            content:
                Text("Por el momento no hay registro de limpieza en el día."),
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
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: 832 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: 1280 * fem,
                height: 18 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 2 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35 * fem,
                      height: 40 * fem,
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_desk()),
                            );
                          },
                          child: Icon(Icons.arrow_back,color: Color(0xa062a191),size: 6.5 * fem),
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.5 * fem, right: 150 * fem),
                      child: Text(
                        'LIMPIEZA',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Alfa Slab One',
                          fontSize: 7 * ffem,
                          fontWeight: FontWeight.w400,
                          color: Color(0xfff8d8d8),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 120 * fem),
                        width: 25 * fem,
                        height: 60 * fem,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            width: 25 * fem,
                            height: 25 * fem,
                            child: Image.asset(
                              'img/desktop/logo2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30 * fem,
              left: 45 * fem,
              child: Container(
                    width: 145 * fem,
                    height: 35 * fem,

                child: Image.asset(
                  'img/desktop/PORCI333.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 70 * fem,
              left: 45 * fem,
              child: Container(
                width: 145 * fem,
                height: 100 * fem,
                decoration: BoxDecoration(
                  color: Color(0xfffff6f6),
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: contenido(),
              ),
            ),
            Positioned(
              top: 30 * fem,
              left: 200 * fem,
              child: Container(
                width: 140 * fem,
                height: 150 * fem,
                decoration: BoxDecoration(
                  //  color:  Colors.pink,
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: resultado(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
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
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 3 * fem),
            child: TableCalendar(
              locale: "es_ES",
              rowHeight: 55,
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
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
      final fechaEventoDateTime =
          fechaEvento.toDate(); // Convierte Timestamp a DateTime
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

