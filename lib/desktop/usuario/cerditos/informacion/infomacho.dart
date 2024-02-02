import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class infomacho_desk extends StatelessWidget {
  final int idhembra;

  infomacho_desk(this.idhembra);

  @override
  Widget build(BuildContext context) {
    print('ID en individual_desk: $idhembra');
    print(idhembra);
    return infomacho(idhembra);
  }
}

class infomacho extends StatefulWidget {
  final int idhembra;

  infomacho(this.idhembra);

  @override
  State<infomacho> createState() => _infomachoState(idhembra);
}

class _infomachoState extends State<infomacho> {
  final int idhembra;

  _infomachoState(this.idhembra);

  List<dynamic> datos = [];

  bool botondetalles1 = false;
  bool botondetalles2 = false;
  int idMacho = 0;
  int indiceItemSeleccionado = 0;
  List<String> fechamonta = [];
  List<String> listaFallecidos = [];



  @override
  void initState() {
    super.initState();
    consultarDatos();
    fallecidas();
  }

  Future consultarDatos() async {
    try {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('hoja_devida')
          .where('id_hembra', isEqualTo: idhembra)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<int> idMachos = [];

        for (var doc in querySnapshot.docs) {
          if (doc['id_macho'] is int) {
            idMachos.add(doc['id_macho'] as int);
          }

          if (doc['fecha_monta'] != null) {
            fechamonta.add(DateFormat('yyyy-MM-dd').format(doc['fecha_monta'].toDate()));
          }
        }


        List<Map<String, dynamic>> detallesMachos = [];

        for (var macho in idMachos) {
          var machoSnapshot = await FirebaseFirestore.instance
              .collection('registro_macho')
              .where('id_macho', isEqualTo: macho)
              .get();

          datos.addAll(machoSnapshot.docs.map((doc) => doc.data()).toList());

          if (machoSnapshot.docs.isNotEmpty) {
            detallesMachos.addAll(machoSnapshot.docs.map((doc) => doc.data()));
          }
        }

        setState(() {
          datos = detallesMachos;
          print(datos);
          print(idMachos);
          print(fechamonta);
        });

        return build(context);
      } else {
        // Manejar el caso donde no hay coincidencias
        return imagen();
      }
    } catch (e) {
      // Manejar errores
      print('Error en la consulta: $e');
      // Puedes mostrar un mensaje de error o realizar alguna otra acción aquí
    }
  }

  Future<void> fallecidas() async {
    listaFallecidos.clear();
    await FirebaseFirestore.instance
        .collection('fallecidos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          String id = doc['id'].toString();
          listaFallecidos.add(id);
        }
        print('IDs consultados: $listaFallecidos');
      });
    });
  }




  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 140 * fem,
                height: 150 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 140 * fem,
                        height: 55 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Align(
                                child: SizedBox(
                                  width: 140 * fem,
                                  height: 65 * fem,
                                  child: Image.asset(
                                    'img/mobil/fondoinicio.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 56 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 20 * fem,
                                  height: 20 * fem,
                                  child: Image.asset(
                                    'img/mobil/circulo.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8.5 * fem,
                              top: 46.8 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 125 * fem,
                                  height: 20 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 1 * fem,
                              top: 12 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 140 * fem,
                                  height: 20 * fem,
                                  child: Text(
                                    'INFORMACION',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Alfa Slab One',
                                      fontSize: 9 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 0.2 * ffem / fem,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 18.5 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 140 * fem,
                                  height: 19 * fem,
                                  child: Text(
                                    'MACHOS',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Jost',
                                      fontSize: 4 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 0.1 * ffem / fem,
                                      letterSpacing: 0.4 * fem,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 15 * fem,
                              top: 30 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 110 * fem,
                                  height: 110.61 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            left: 20 * fem,
                            top: 35 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 60 * fem,
                                height: 30 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(5 * fem),
                                    color: Color(0xfffbf4f4),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                  child: SingleChildScrollView(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: generateContainers(datos, fechamonta, fem),
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
                    Positioned(
                      left: 20 * fem,
                      top: 71 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 100 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Color(0xfffbf4f4),
                            ),
                            child: ListView.builder(
                              itemCount: datos.length,
                              itemBuilder: (context, index) {
                                final data = datos[index];
                                return Column(
                                  children: [
                                    if(indiceItemSeleccionado == index)
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 4 * ffem,
                                          right: 4 * ffem,
                                          top: 2 * ffem),
                                      width: 310 * fem,
                                      height: 10 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '- ${data['nombre']} -',
                                          style: GoogleFonts.holtwoodOneSc(
                                            fontSize: 5.5 * fem,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 1.3,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if(indiceItemSeleccionado == index)
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 40 * fem,
                                            height: 50 * fem,
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5 * fem,
                                                      left: 4 * fem),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5 * fem),
                                                      color: Colors.white54),
                                                  width: 25 * fem,
                                                  height: 8 * fem,
                                                  child: Center(
                                                    child: Text(
                                                      'ID:  ${data['id_macho']}',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if(indiceItemSeleccionado == index)
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5 * fem,
                                                      left: 4 * fem),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5 * fem),
                                                      color: Colors.white54),
                                                  width: 25 * fem,
                                                  height: 8 * fem,
                                                  child: Center(
                                                    child: Text(
                                                      'PESO: ${data['peso']}',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if(indiceItemSeleccionado == index)
                                          Container(
                                            margin:
                                                EdgeInsets.only(left: 3 * fem),
                                            width: 2 * fem,
                                            height: 50 * fem,
                                            color: Colors.white54,
                                          ),
                                          if(indiceItemSeleccionado == index)
                                          Container(
                                            margin: EdgeInsets.only(bottom: 8  * fem, left: 4* fem),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 6 * fem,
                                                  margin: EdgeInsets.only(top: 0 * fem),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white54),
                                                  child: Center(
                                                    child: Text(
                                                      'FECHA INGRESO:',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if(indiceItemSeleccionado == index)
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 2 * fem),
                                                  child: Center(
                                                    child: Text(
                                                      '${DateFormat('yyyy-MM-dd').format(data['fecha_ingreso'].toDate())}',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if(indiceItemSeleccionado == index )
                                                Container(
                                                  height: 6 * fem,
                                                  margin: EdgeInsets.only(
                                                      top: 4 * fem),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white54),
                                                  child: Center(
                                                    child: Text(
                                                      'FECHA NACIMIENTO:',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black38,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 2 * fem),
                                                  child: Center(
                                                    child: Text(
                                                      '${DateFormat('yyyy-MM-dd').format(data['fecha_nacimiento'].toDate())}',
                                                      style:
                                                          GoogleFonts.kameron(
                                                        fontSize: 3.5 * fem,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        letterSpacing: 0,
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80 * fem,
                      top: 20 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 60 * fem,
                          height: 30 * fem,
                          child: Image.asset(
                            'img/mobil/cerdito1.png',
                            fit: BoxFit.cover,
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

  List<Widget> generateContainers(List<dynamic> data, List<String> fechamonta,double fem) {
    double baseWidth = 390;
    double ffem = fem * 0.97;

    List<Widget> containers = [];
    for (var index = 0; index < data.length; index++) {
      final item = data[index];
      var fechaMonta = fechamonta[index];

      containers.add(
        Tooltip(
          message: 'Monta: $fechaMonta',
          child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(2 * fem),
              child:InkWell(
                onTap: () {
                  setState(() {
                    botondetalles1 = true;
                    botondetalles2 = false;
                    indiceItemSeleccionado = index;
                  });
                },
                child:Container(
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                      5 * fem),
                  color: Colors.white,
                ),
                  width: 30 * fem,
                  height: 25 * fem,
                  child:Column(
                    children: [
                      InkWell(
                        onTap: () {
                          estadomuerto(item['id_macho']);
                        },
                      child: Container(
                  padding: EdgeInsets.all(0.5 * fem),
              child: SizedBox(
                width: 10 * fem,
                height: 10 * fem,
                child: Image.asset(
                  'img/desktop/pork1.png',
                  fit: BoxFit.contain,
                ),
              ),
                      ),
                      ),
                      Container(
                        width: 20 * fem,
                        height: 10 * fem,
                          child: ListTile(
                            title: Container(
                              margin: EdgeInsets.only(
                                  left: 4 * fem, top: 0 * fem, bottom: 0 * fem),
                              child: Text('${item['id_macho']}',style: TextStyle(fontSize: 3 * fem),),
                            ),
                            subtitle: Container(
                              width: 20 * fem,
                              height: 8 * fem,
                              child: Column(
                              children: [
                                Text('Nombre: ${item['nombre']}',style: TextStyle(fontSize: 2 * fem),),
                                Text('Peso: ${item['peso']}',style: TextStyle(fontSize: 2 * fem),),
                              ],
                            ),
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
      );
    }
    return containers;
  }

  estadomuerto(item) async {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    await fallecidas();
    var idmacho = item;
    bool estaEnFallecidos = listaFallecidos.contains(idmacho.toString().trim());

    if (!estaEnFallecidos) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // El usuario no puede cerrar la alerta tocando fuera de ella
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cambiar estado'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('¿Estás seguro de cambiar el estado del animal?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Sí'),
                onPressed: () {
                  guardarestado_fa(idmacho);
                 // Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Cierra la alerta sin hacer cambios
                },
              ),
            ],
          );
        },
      );
    }
  }

  guardarestado_fa(int id){
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    TextEditingController descriptionController = TextEditingController();

    showDialog<void>(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Agregar Evento'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Descripción'),
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
                onPressed: () {
                  // Guardar evento en la colección
                  guardar_fallecidos( id, selectedDate, selectedTime, descriptionController.text,);
                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
            ],
          );
        });
  }

  guardar_fallecidos(int id, DateTime fecha, TimeOfDay hora, String descripcion) {
    String horaString = "${hora.hour}:${hora.minute}";

    FirebaseFirestore.instance.collection('fallecidos').add({
      'id': id,
      'fecha': fecha,
      'hora': horaString,
      'descripcion': descripcion,
      'seccion': 'hembra',
    }).then((value) {
      print('Evento guardado en la colección "fallecidos" con ID: ${value.id}');
    }).catchError((error) {
      print('Error al guardar el evento: $error');

    });
  }

  imagen(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: 140 * fem,
      height: 150 * fem,
      child: Image.asset(
        'img/desktop/PORCI33.gif',
        fit: BoxFit.cover,
      ),
    );
  }
}

class infomacho2 extends StatelessWidget {
  final List<dynamic> datos;

  infomacho2(this.datos);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          final item = datos[index]; // Obtén un elemento de la lista de datos

          // Convierte los Timestamp a objetos DateTime
          final fechaIngreso = (item['fecha_ingreso'] as Timestamp).toDate();
          final fechaNacimiento =
              (item['fecha_nacimiento'] as Timestamp).toDate();

          // Formatea las fechas en un formato legible (solo fecha)
          final formattedFechaIngreso =
              DateFormat('yyyy-MM-dd').format(fechaIngreso);
          final formattedFechaNacimiento =
              DateFormat('yyyy-MM-dd').format(fechaNacimiento);

          // Aquí puedes mostrar los datos en un ListTile o en cualquier otro widget
          return ListTile(
            title: Text(item['nombre']),
            // Reemplaza 'nombre' por el nombre del campo que deseas mostrar
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${item['id']}'),
                Text('Fecha de Ingreso: $formattedFechaIngreso'),
                Text('Fecha de Nacimiento: $formattedFechaNacimiento'),
                Text('Peso: ${item['peso']}'),
                // Puedes agregar más campos según sea necesario
              ],
            ),
          );
        },
      ),
    );
  }
}
