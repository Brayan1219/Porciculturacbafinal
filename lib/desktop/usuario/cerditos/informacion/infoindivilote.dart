import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/infomacho.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/informacion.dart';
import 'package:myapp/utils.dart';

class individuallote_desk extends StatelessWidget {
  final String idlote;
  final  levante;
  final  precebo;

  individuallote_desk(this.idlote,this.levante,this.precebo);

  @override
  Widget build(BuildContext context) {
    print('ID en individual_desk: $idlote');
    print(idlote);
    return indiapp(idlote,levante,precebo);
  }
}

class indiapp extends StatefulWidget {
  final String idlote;
  final  levante;
  final  precebo;

  indiapp(this.idlote,this.levante,this.precebo);

  @override
  State<indiapp> createState() => _indiappState(idlote,levante,precebo);
}

class _indiappState extends State<indiapp> {
  final String idlote;
  final  levante;
  final  precebo;

  _indiappState(this.idlote,this.levante,this.precebo);

  List<dynamic> datos = [];
  List<String> listaFallecidos = [];
  Map<String, DateTime> fechasFallecimiento = {};
  Map<String, String> hora = {};

  @override
  void initState() {
    print('idlote');
    print(idlote);
    super.initState();
    consultarlote();
  }

  void consultarlote() {
    datos.clear();
    FirebaseFirestore.instance
        .collection('lotes')
        .where('dato_lote', isEqualTo: idlote)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Limpiar datos antes de la nueva consulta
        datos = [];
      });

      if (querySnapshot.size > 0) {
        // Verificar si hay resultados antes de intentar acceder a los datos
        var primerDocumento = querySnapshot.docs.first;

        // Obtener la referencia de la subcolección
        var subcoleccionRef =
            primerDocumento.reference.collection('cerditoslote');

        // Obtener los documentos de la subcolección
        subcoleccionRef.get().then((QuerySnapshot subcoleccionSnapshot) {
          setState(() {
            // Mapear los documentos de la subcolección a una lista
            datos = subcoleccionSnapshot.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();
          });

          print('Datos de la subcolección:');
          print(datos);
        });
      } else {
        // No se encontraron documentos que coincidan con el filtro
        print('No se encontró ningún lote con dato_lote: $idlote');
      }
    }).catchError((error) {
      print("Error al consultar Firestore: $error");
    });
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
                                  height: 55 * fem,
                                  child: Image.asset(
                                    'img/mobil/fondoinicio.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 46 * fem,
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
                                  width: 135 * fem,
                                  height: 20 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
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
                                    'INDIVIDUAL / HEMBRA',
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
                    Positioned(
                      left: 20 * fem,
                      top: 40 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 100 * fem,
                          height: 110 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Color(0xfffbf4f4),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 25 * fem,
                      top: 38 * fem,
                      child: Align(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 4 * ffem, right: 4 * ffem, top: 8 * ffem),
                              width: 80 * fem,
                              height: 15 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  '- $idlote -',
                                  style: GoogleFonts.holtwoodOneSc(
                                    fontSize: 6.5 * fem,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 1.3,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                              // Llama al método informacion() aquí
                            ),
                            Container(
                              width: 400,
                              height: 390,
                              margin: EdgeInsets.only(top: 3* fem),
                              child: ListView.builder(
                                itemCount: datos.length,
                                itemBuilder: (context, index) {
                                  final data = datos[index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5* fem, left: 3* fem),
                                            width: 14 * fem,
                                            height: 9 * fem,
                                            child: GestureDetector(
                                              onTap: () {
                                                showEditDialog(idlote, data);
                                              },
                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    Text('CHAPETA ',
                                                      style: SafeGoogleFont(
                                                      'Alfa Slab One',
                                                      fontSize: 2 * fem,
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: 0.4 * fem,
                                                      color: Colors.teal,
                                                    ),),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 1* fem),
                                                      child: Text('${data['chapeta'] ?? 0}',
                                                        style: GoogleFonts.kameron(
                                                          fontSize: 2.7 * fem,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FontStyle.italic,
                                                          letterSpacing: 0,
                                                          color: Colors.black26,
                                                        ),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 3*fem),
                                            width: 14 * fem,
                                            height: 9 * fem,
                                            child: Center(
                                              child: TextField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  labelText: 'SEXO',
                                                ),
                                                controller: TextEditingController(text: '${data['sexo']}'),
                                                style: GoogleFonts.kameron(
                                                  fontSize: 2.7 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 2*fem),
                                            width: 17 * fem,
                                            height: 9 * fem,
                                            child: Center(
                                              child: TextField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  labelText: 'PESO ACTUAL',
                                                ),
                                                controller: TextEditingController(text: '${data['pesoactual'] ?? 0}'),
                                                style: GoogleFonts.kameron(
                                                  fontSize: 2.7 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 2*fem),
                                            width: 21 * fem,
                                            height: 9 * fem,
                                            child: Center(
                                              child: TextField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  labelText: 'FECHA NACIMIENTO',
                                                ),
                                                controller: TextEditingController(text: '${data['fecha_nacimiento']}'),
                                                style: GoogleFonts.kameron(
                                                  fontSize: 2.7 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (datos.any((subcoleccion) =>
                                          subcoleccion['estadolote'] == precebo ||
                                              subcoleccion['estadolote'] == levante))
                                            InkWell(
                                              onTap: () {
                                                estadomuerto(data['tatuaje']);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(left: 2 * fem),
                                                child: Icon(
                                                  Icons.dangerous,
                                                  size: 4 * fem,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40 * fem,
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

  Future showEditDialog(String idlote, Map<String, dynamic> data) async {
    TextEditingController chapetaController = TextEditingController(text: '${data['chapeta'] ?? 0}');

    if (datos.any((subcoleccion) =>
    subcoleccion['estadolote'] == precebo ||
        subcoleccion['estadolote'] == levante)) {
      // Si el lote está en estado precebo o levante, muestra opciones específicas
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Editar Chapeta'),
            content: TextField(
              controller: chapetaController,
              decoration: InputDecoration(
                labelText: 'Nuevo valor de Chapeta',
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    var tatuaje = data['tatuaje'];
                    print('Valor de tatuaje: $tatuaje');
                    print('dato de idlote en actualizar $idlote');
                    data['chapeta'] = chapetaController.text;
                    updateChapetaInFirestore(idlote, tatuaje, chapetaController.text, data);
                  });

                  // Cierra el diálogo
                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Cierra el diálogo sin hacer cambios
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        },
      );
    }
  }



  Future<void> updateChapetaInFirestore(String idLote, String tatuaje, String newChapeta, Map<String, dynamic> data) async {
    try {
      // Busca el documento con el campo único (ej. 'otroCampo')
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('lotes')
          .where('dato_lote', isEqualTo: idLote)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Obtiene el ID del documento encontrado
        String documentoId = querySnapshot.docs[0].id;
        print(documentoId);

        // Obtiene la referencia del documento en Firestore
        QuerySnapshot subcoleccionSnapshot = await FirebaseFirestore.instance
            .collection('lotes')
            .doc(documentoId)
            .collection('cerditoslote')
            .where('tatuaje', isEqualTo: tatuaje)
            .get();

        if (subcoleccionSnapshot.docs.isNotEmpty) {
          // Obtiene el ID del documento en la subcolección
          String subdocumentoId = subcoleccionSnapshot.docs[0].id;
          print(subdocumentoId);

          // Obtiene la referencia del documento en la subcolección y actualiza la chapeta en Firestore
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('lotes')
              .doc(documentoId)
              .collection('cerditoslote')
              .doc(subdocumentoId);

          await documentReference.update({'chapeta': newChapeta});

          print('Chapeta actualizada en Firestore');
        } else {
          print('No se encontró ningún documento en la subcolección con tatuaje: $tatuaje');
        }
      } else {
        print('No se encontró ningún documento con el campo único: $idLote');
      }
    } catch (error) {
      print('Error al actualizar la chapeta en Firestore: $error');
    }
  }

  estadomuerto(String id) async {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print('esta es fallecidos $listaFallecidos');

    await fallecidas();
    bool estaEnFallecidos = listaFallecidos.contains(id.toString().trim());
    print(estaEnFallecidos);

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
                  Text(
                      '¿Estás seguro de cambiar el estado del animal a fallecido?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                  guardarestado_fa(id);
                },
                child: Text('Sí'),

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

  guardarestado_fa(String id){
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

  guardar_fallecidos(String id, DateTime fecha, TimeOfDay hora, String descripcion) {
    // Convertir TimeOfDay a String en formato HH:mm
    String horaString = "${hora.hour}:${hora.minute}";

    // Acceder a la colección "fallecidos" y agregar un nuevo documento con la información proporcionada
    FirebaseFirestore.instance.collection('fallecidos').add({
      'id': id,
      'fecha': fecha,
      'hora': horaString,  // Almacenar la hora como cadena de texto
      'descripcion': descripcion,
      'seccion': 'lote'
    }).then((value) {
      print('Evento guardado en la colección "fallecidos" con ID: ${value.id}');
    }).catchError((error) {
      print('Error al guardar el evento: $error');
      // Manejar el error según tus necesidades
    });
  }




}
