import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../home.dart';

class salud_desk extends StatelessWidget {
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    initializeDateFormatting("es_ES", null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/LIMPIEZA",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: infoapp(),
    );
  }
}

class infoapp extends StatefulWidget {
  @override
  State<infoapp> createState() => _infoappState();
}

class _infoappState extends State<infoapp> {

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

    var id = valorid;

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
                  // color:  Color(0xffffffff),
                  color: Colors.white,
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
                      margin: EdgeInsets.only(top: 3.5 * fem, right: 120 * fem),
                      child: Text(
                        'SALUD / VACUNACION',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Alfa Slab One',
                          fontSize: 6 * ffem,
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
            Container(
              margin: EdgeInsets.only(top: 30 * fem, left: 200 * fem),
              width: 140 * fem,
              height: 150 * fem,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10 * fem),),
              child: Stack(
                children: [
                  Container(
                    padding:  EdgeInsets.fromLTRB( 0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 140 * fem,
                    height: 150 * fem,
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
                          width:  140*fem,
                          height:  147*fem,
                          child:
                          Stack(
                            children:  [
                              Positioned(
                                left:  40*fem,
                                top:  10*fem,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  60*fem,
                                    height:  35*fem,
                                    child:
                                    Text(
                                      'CENTRO',
                                      textAlign:  TextAlign.center,
                                      style:  SafeGoogleFont (
                                        'Alfa Slab One',
                                        fontSize:  10.5*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.5*fem,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:  52*fem,
                                top:  21*fem,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  35*fem,
                                    height:  10*fem,
                                    child:
                                    Text(
                                      'vacunacion',
                                      textAlign:  TextAlign.center,
                                      style:  SafeGoogleFont (
                                        'Alfa Slab One',
                                        fontSize:  4.5*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.5*fem,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:  41.5*fem,
                                top:  30*fem,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  62*fem,
                                    height:  20*fem,
                                    child:
                                    Text(
                                      'recuerde siempre vacunar a tus animales aqui podras tener todo el registro\n',
                                      style:  SafeGoogleFont (
                                        'Alegreya',
                                        fontSize:  2.2*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.52*fem,
                                        color:  Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:  -11*fem,
                                top:  2*fem,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  45*fem,
                                    height:  50*fem,
                                    child:
                                    Image.asset(
                                      'img/mobil/salud1.png',
                                      fit:  BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 47 * fem),
                                width:  140*fem,
                                height:  115*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top:  2*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width:  20*fem,
                                          height:  20*fem,
                                          child: Image.asset(
                                            'img/mobil/circulo.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left:  8.0*fem,
                                      top:  2.8*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width:  135*fem,
                                          height:  20*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0xffffffff),
                                              //color: Colors.teal
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top:  10.8*fem,
                                      child: Align(
                                        child: SizedBox(
                                          width:  140*fem,
                                          height:  110*fem,
                                          child: Container(
                                            decoration: BoxDecoration (
                                              color: Color(0xffffffff),
                                              //color: Colors.teal
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 15 * fem,
                                top:  43*fem,
                                child: Align(
                                  child: SizedBox(
                                    width:  105*fem,
                                    height:  110.61*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(5*fem),
                                        color: Color(0xffffffff),
                                        // color: Colors.pink
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Tooltip(
                                                message: 'HEMBRAS',
                                                child: InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      hembra = true;
                                                      macho = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(top: 4 * fem, left: 23*fem),
                                                    width: 25*fem,
                                                    height: 25 * fem,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5*fem),
                                                      color: Color.fromRGBO(98, 161, 145, 170),
                                                    ),
                                                    child: Center(
                                                      // porkSQo (15:110)
                                                      child: SizedBox(
                                                        width: 20 * fem,
                                                        height: 20 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/pork.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Tooltip(
                                                message: 'MACHOS',
                                                child: InkWell(
                                                  onTap: (){
                                                    setState(() {
                                                      hembra = false;
                                                      macho = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(top: 4 * fem, left: 10*fem),
                                                    width: 25*fem,
                                                    height: 25 * fem,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5*fem),
                                                      color: Color.fromRGBO(98, 161, 145, 170),
                                                    ),
                                                    child: Center(
                                                      // porkSQo (15:110)
                                                      child: SizedBox(
                                                        width: 20 * fem,
                                                        height: 20 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/cerdo.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 1* fem),
                                            width: 100 * fem,
                                            height: 65 * fem,
                                      //      color: Colors.pink,
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
            margin: EdgeInsets.only(top: 3 * fem),
            child: TableCalendar(
              locale: "es_ES",
              rowHeight: 55,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
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
                // Devuelve una lista de eventos para el día dado
                return fechasSumadas.where((date) => isSameDay(date, day)).toList();
              },
              calendarStyle: CalendarStyle(
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent, // Establece el color del fondo como transparente
                ),
              ),
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events) {
                  // Personaliza la apariencia del marcador de eventos aquí
                  if (events.isNotEmpty) {
                    return _buildEventsMarker(events, date);
                  }
                  return SizedBox.shrink(); // Retorna un widget vacío si no hay eventos
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
        margin: EdgeInsets.only(right: 1, bottom: 13),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        width: 30.0, // Ajusta el tamaño del círculo según tus necesidades
        height: 30.0,
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
              width: 90 * fem,
              height: 20 * fem,
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 3 * fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 25 * fem,
                        height: 20 * fem,
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
                    width: 6 * fem,
                    height: 0.5 * fem,
                    color: Color(0xff62a191),
                  ),
                  Container(
                    width: 50 * fem,
                    height: 25 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            width: 50 * fem,
                            height: 14 * fem,
                            child: ListTile(
                              title: Container(
                                margin: EdgeInsets.only(
                                    left: 5 * fem, bottom: 0 * fem),
                                child: Text('${item.containsKey('id') ? item['id'] : item['id_macho']}'),
                              ),
                              subtitle: Column(
                                children: [
                                  Text('Nombre: ${item['nombre']}', style: TextStyle(fontSize: 2.5 * fem)),
                                  Text('Peso: ${item['peso']}', style: TextStyle(fontSize: 2.5 * fem)),
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