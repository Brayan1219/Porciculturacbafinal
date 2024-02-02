import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../home.dart';

class salud extends StatelessWidget {
  const salud({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("es_ES", null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SALUD/VACUNAS",
      theme: ThemeData(
      ),
      home: saludapp(),
    );
  }
}

class saludapp extends StatefulWidget {
  @override
  State<saludapp> createState() => _saludappState();
}

class _saludappState extends State<saludapp> {
  List<DateTime> fechasOriginales = [];
  List<DateTime> fechasSumadas = [];
  List<int> idsHembras = [];
  bool hembra = false;
  bool macho = false;
  int idmacho=0;
  int idhembras =0;

  List<dynamic> datosHembras = [];
  List<dynamic> datosMachos = [];
  List<dynamic> datos = [];
  bool botondetalles = false;
  int valorid = 0;
  DateTime hoy = DateTime.now();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      hoy = day;
    });
  }

  @override
  void initState() {
    super.initState();

    consultarcrias();
    consultarHojadevida();
    consultarcerditas();
    consultarmacho();
  }

  void consultarcrias() {
    FirebaseFirestore.instance
        .collection('vacunascrias')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      setState(() {
        datos = querySnapshot.docs.map((doc) => doc.data()).toList();
        print('Datos consultados: $datos');
      });
    });
  }


  void consultarHojadevida() {
    FirebaseFirestore.instance
        .collection('hoja_devida')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena las fechas originales, sumadas y los ID de las hembras en las listas correspondientes
        fechasOriginales = querySnapshot.docs
            .map((doc) => (doc['fecha_monta'] as Timestamp)?.toDate())
            .whereType<DateTime>()
            .toList();

        fechasSumadas = fechasOriginales
            .map((fecha) => fecha.add(Duration(days: 100)))
            .toList();

        idsHembras = querySnapshot.docs
            .map((doc) => doc['id_hembra'] as int) // Ajusta según el tipo de dato real del ID
            .toList();

        // Imprimir fechas y IDs en la consola
        for (var i = 0; i < fechasOriginales.length; i++) {
          print('Fecha original: ${fechasOriginales[i]}');
          print('Fecha sumada 100 días: ${fechasSumadas[i]}');
          print('ID de la hembra: ${idsHembras[i]}');
        }


      });
    });
  }


  Future<String?> obtenerNombreHembra(int idHembra) async {
    try {
      // Realiza la consulta en la colección "registro hembra"
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('registro_hembra')
          .where('id', isEqualTo: idHembra)
          .get();

      // Verifica si hay documentos coincidentes
      if (querySnapshot.docs.isNotEmpty) {
        // Obtén el nombre de la primera coincidencia (asumimos que hay solo uno)
        return querySnapshot.docs[0]['nombre'] as String?;
      } else {
        // No se encontraron documentos con el idHembra dado
        return null;
      }
    } catch (e) {
      print('Error al obtener el nombre de la hembra: $e');
      return null;
    }
  }

  void consultarcerditas() {
    datosHembras.clear();
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datosHembras.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
      });
    });
  }

  void consultarmacho() {
    datosMachos.clear();
    FirebaseFirestore.instance
        .collection('registro_macho')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datosMachos.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
      });
    });
  }


  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // saludVm1 (31:356)
          //padding:  EdgeInsets.fromLTRB(0*fem, 19*fem, 0*fem, 0*fem),
          width:  double.infinity,
          decoration:  BoxDecoration (
            image:  DecorationImage (
              fit:  BoxFit.cover,
              image:  AssetImage (
                  'img/mobil/fondovacu.png'
              ),
            ),
          ),
          child:
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children:  [
              Container(
                color: Colors.white,
                width: 415,
                height: 40 * fem,
                child: Container(
                  margin:  EdgeInsets.fromLTRB(27*fem, 0*fem, 0*fem, 12.72*fem),
                  width:  20.7*fem,
                  height:  20.28*fem,
                  child:InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homemobil()));
                    },
                  child:
                  Image.asset(
                    'img/mobil/flecha.png',
                  ),
        )
                ),
              ),
              Container(
                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                width:  397*fem,
                height:  156*fem,
                child:
                Stack(
                  children:  [
                    Positioned(
                      left:  135*fem,
                      top:  20*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  200*fem,
                          height:  55*fem,
                          child:
                          Text(
                            'CENTRO',
                            textAlign:  TextAlign.center,
                            style:  SafeGoogleFont (
                              'Alfa Slab One',
                              fontSize:  40*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1.3675*ffem/fem,
                              letterSpacing:  1.6*fem,
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left:  169.5*fem,
                      top:  59*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  130*fem,
                          height:  28*fem,
                          child:
                          Text(
                            'vacunacion',
                            textAlign:  TextAlign.center,
                            style:  SafeGoogleFont (
                              'Alfa Slab One',
                              fontSize:  20*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1.3675*ffem/fem,
                              letterSpacing:  0.8*fem,
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left:  130*fem,
                      top:  97*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  250*fem,
                          height:  54*fem,
                          child:
                          Text(
                            'recuerde siempre vacunar a tus animales aqui podras tener todo el registro\n',
                            style:  SafeGoogleFont (
                              'Alegreya',
                              fontSize:  13*ffem,
                              fontWeight:  FontWeight.w400,
                              height:  1.36*ffem/fem,
                              letterSpacing:  0.52*fem,
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left:  -65*fem,
                      top:  13*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  204*fem,
                          height:  143*fem,
                          child:
                          Image.asset(
                            'img/mobil/salud1.png',
                            fit:  BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:  EdgeInsets.fromLTRB(27*fem, 0*fem, 26*fem, 30*fem),
                padding:  EdgeInsets.fromLTRB(15*fem, 0*fem, 15*fem, 0*fem),
                width:  double.infinity,
                decoration:  BoxDecoration (
                  color:  Color(0xffffffff),
                  borderRadius:  BorderRadius.circular(20*fem),
                ),
                child:
                Center(
                  child:
                  SizedBox(
                    width:  double.infinity,
                    height:  200*fem,
                    child:
                    Container(
                    child: contenido(),
                    ),
                  ),
                ),
              ),
              Container(
                // autogroupd9ouZJw (JTM9NxXKsZxadsN6fQD9ou)
                margin:  EdgeInsets.fromLTRB(27*fem, 0*fem, 26*fem, 0*fem),
                width:  double.infinity,
                height:  419*fem,
                child:
                Stack(
                  children:  [
                    Positioned(
                      // rectangle655o5 (275:17)
                      left:  0*fem,
                      top:  316*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  337*fem,
                          height:  133*fem,
                          child:
                          Container(
                            decoration:  BoxDecoration (
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle641gj (275:16)
                      left:  0*fem,
                      top:  0*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  337*fem,
                          height:  449*fem,
                          child:
                          Container(
                            decoration:  BoxDecoration (
                              borderRadius:  BorderRadius.circular(30*fem),
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left:  68*fem,
                      top:  10*fem,
                      child:
                      Align(
                        child:
                        SizedBox(
                          width:  205*fem,
                          height:  410.61*fem,
                          child:Column(
                            children: [
                              Row(
                                children: [
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          hembra = true;
                                          macho = false;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 4 * fem, left: 30*fem),
                                            width: 60*fem,
                                            height: 55 * fem,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5*fem),
                                              color: Color.fromRGBO(98, 161, 145, 170),
                                            ),
                                            child: Center(
                                              // porkSQo (15:110)
                                              child: SizedBox(
                                                width: 60 * fem,
                                                height: 60 * fem,
                                                child: Image.asset(
                                                  'img/mobil/pork.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 10*fem),
                                                width: 50*fem,
                                                height: 10 * fem,
                                                child:  Text(
                                                  'HEMBRAS',
                                                  textAlign:  TextAlign.center,
                                                  style:  SafeGoogleFont (
                                                    'Alfa Slab One',
                                                    fontSize:  7*fem,
                                                    fontWeight:  FontWeight.w400,
                                                    height:  1.3675*ffem/fem,
                                                    letterSpacing:  0.8*fem,
                                                    color:  Colors.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  InkWell(
                                      onTap: (){
                                        setState(() {
                                          hembra = false;
                                          macho = true;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 4 * fem, left: 23*fem),
                                            width: 60*fem,
                                            height: 55 * fem,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5*fem),
                                              color: Color.fromRGBO(98, 161, 145, 170),
                                            ),
                                            child: Center(
                                              // porkSQo (15:110)
                                              child: SizedBox(
                                                width: 60 * fem,
                                                height: 60 * fem,
                                                child: Image.asset(
                                                  'img/mobil/cerdo.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: 10*fem),
                                                width: 50*fem,
                                                height: 10 * fem,
                                                child:  Text(
                                                  'MACHOS',
                                                  textAlign:  TextAlign.center,
                                                  style:  SafeGoogleFont (
                                                    'Alfa Slab One',
                                                    fontSize:  7*fem,
                                                    fontWeight:  FontWeight.w400,
                                                    height:  1.3675*ffem/fem,
                                                    letterSpacing:  0.8*fem,
                                                    color:  Colors.grey,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 1* fem),
                                width:  205*fem,
                                height:  310.61*fem,
                                   //  color: Colors.pink,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      if (hembra)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: generateContainers(),
                                        ),
                                      if (macho)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: generateContainers(),
                                        ),
                                    ],
                                  ),
                                ),
                              )
                            ],
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
            child: TableCalendar(
              locale: "es_ES",
              rowHeight: 25,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 13 * fem),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(fontSize: 10 * fem),
                weekendStyle: TextStyle(fontSize: 10 * fem),
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, hoy),
              focusedDay: hoy,
              firstDay: DateTime.utc(2023, 01, 01),
              lastDay: DateTime.utc(9999, 12, 31),
              onDaySelected: (day, focusedDay) {
                onDaySelected(day, focusedDay);
                _showSelectedDayRectangle(context, day);
              },
              eventLoader: (day) {
                return fechasSumadas.where((date) => isSameDay(date, day)).toList();
              },
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(fontSize: 10 * fem),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  if (events.isNotEmpty) {
                    return _buildEventsMarker(events, date);
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsMarker(List events, DateTime date) {
    if (events.isNotEmpty) {
      return Container(
        margin: EdgeInsets.only(right: 1, bottom: 1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        width: 60,
        height: 60,
        child: Center(
          child: Text(
            '${date.day}',
            style: TextStyle(
              color: Colors.white, // Color del texto
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Future<void> _showSelectedDayRectangle(BuildContext context, DateTime selectedDay) async {
    // Encuentra los índices de las fechas sumadas que coinciden con la fecha seleccionada
    List<int> indices = [];
    for (int i = 0; i < fechasSumadas.length; i++) {
      if (isSameDay(fechasSumadas[i], selectedDay)) {
        indices.add(i);
      }
    }

    // Muestra el diálogo solo si hay eventos para la fecha seleccionada
    if (indices.isNotEmpty) {
      String? nombreHembra = await obtenerNombreHembra(idsHembras[indices[0]]);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: 200,
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  // Muestra el ID y nombre de la hembra para cada evento
                  Column(
                    children: indices.map((index) {
                      if (index >= 0 && index < idsHembras.length) {
                        return Column(
                          children: [
                            Text(
                              'ID de la hembra: ${idsHembras[index]}',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Nombre de la hembra: $nombreHembra',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Vacuna a aplicar: Vermifugacion',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        );
                      } else {
                        print('Índice fuera de rango: $index');
                        return SizedBox.shrink();
                      }
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica que se ejecutará al hacer clic en el botón
                      print('Vacunado');
                      Navigator.pop(context); // Cierra el diálogo
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text('Vacunado'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  List<Widget> generateContainers() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print(datosMachos);
    print(datosHembras);

    List<dynamic> data = hembra ? datosHembras : datosMachos;
    List<Widget> containers = [];

    if (data.isEmpty) {
      containers.add(
        Container(
          margin: EdgeInsets.only(top: 40 * fem),
          child: Text(
            '¡ NO HAY LOTES DISPONIBLES !',
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              '',
              fontSize: 3 * ffem,
              fontWeight: FontWeight.w800,
              color: Colors.black26,
            ),
          ),
        ),
      );
    } else {
      containers = data.map((item) {
        var id = hembra ? item['id'] : item['id_macho'];

        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 6 * fem,
            ),
            SizedBox(
              width: 299 * fem,
              height: 60 * fem,
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 15 * fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                       color: Colors.white,
                      ),
                      child: Container(
                        width: 75 * fem,
                        height: 55 * fem,
                        padding: EdgeInsets.all(4 * fem),
                        child: SizedBox(
                          width: 25 * fem,
                          height: 25 * fem,
                          child: Image.asset(
                            'img/desktop/pork1.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 12 * fem,
                    height: 1.5 * fem,
                    color: Color(0xff62a191),
                  ),
                  Container(
                    width: 95 * fem,
                    height: 55 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            width: 90 * fem,
                            height: 35 * fem,
                            child: ListTile(
                              title: Container(
                                margin: EdgeInsets.only(
                                    left: 15 * fem, bottom: 0 * fem),
                                child: Text('${item.containsKey('id') ? item['id'] : item['id_macho']}',style: TextStyle(fontSize: 8.5 * fem),),
                              ),
                              subtitle: Column(
                                children: [
                                  Text('Nombre: ${item['nombre']}', style: TextStyle(fontSize: 7.5 * fem)),
                                  Text('Peso: ${item['peso']}', style: TextStyle(fontSize: 7.5 * fem)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20 * fem),
                          child: Container(
                            width: 20 * fem,
                            height: 5 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Color.fromRGBO(98, 161, 145, 200),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  DateTime selectedDate = DateTime.now();
                                  TimeOfDay selectedTime = TimeOfDay.now();
                                  TextEditingController descriptionController = TextEditingController();
                                  TextEditingController quieController = TextEditingController();
                                  TextEditingController vacunaController = TextEditingController();

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Agregar Procedimiento'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: quieController,
                                              decoration: InputDecoration(labelText: 'Responsable'),
                                            ),
                                            TextField(
                                              controller: vacunaController,
                                              decoration: InputDecoration(labelText: 'Vacuna / Proceso'),
                                            ),
                                            TextField(
                                              controller: descriptionController,
                                              decoration: InputDecoration(labelText: 'Descripción'),
                                            ),
                                            ListTile(
                                              title: Text('Fecha'),
                                              subtitle: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                                              onTap: () async {
                                                DateTime? pickedDate = await showDatePicker(
                                                  context: context,
                                                  initialDate: selectedDate,
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2101),
                                                );
                                                if (pickedDate != null && pickedDate != selectedDate)
                                                  setState(() {
                                                    selectedDate = pickedDate;
                                                  });
                                              },
                                            ),
                                            ListTile(
                                              title: Text('Hora'),
                                              subtitle: Text('${selectedTime.format(context)}'),
                                              onTap: () async {
                                                TimeOfDay? pickedTime = await showTimePicker(
                                                  context: context,
                                                  initialTime: selectedTime,
                                                );
                                                if (pickedTime != null && pickedTime != selectedTime)
                                                  setState(() {
                                                    selectedTime = pickedTime;
                                                  });
                                              },
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Cancelar
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              // Guardar evento en la colección
                                              await FirebaseFirestore.instance.collection('procesalud').add({
                                                'responsable': quieController.text,
                                                'vacuna_proceso': vacunaController.text,
                                                'descripcion': descriptionController.text,
                                                'fecha': selectedDate,
                                                'hora': selectedTime.format(context),
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Guardar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  child: Text(
                                    'AGREGAR',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      '',
                                      fontSize: 3 * ffem,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
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
            // ... más código del contenedor
          ],
        );
      }).toList();
    }

    return containers;
  }

}

