import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class crias_mobil extends StatelessWidget {
  final int idhembra;
  crias_mobil(this.idhembra);

  @override
  Widget build(BuildContext context) {
    return criasmo(idhembra);
  }
}

class criasmo extends StatefulWidget {
  final int idhembra;
  criasmo(this.idhembra);
  @override
  State<criasmo> createState() => _criasState(idhembra);
}

class _criasState extends State<criasmo> {
  final int idhembra;
  _criasState(this.idhembra);

  List<dynamic> datos = [];
  List<dynamic> datosh = [];
  List<dynamic> datoscerditas = [];
  List<dynamic> datocamada = [];
  List<dynamic> listaDeIDs = [];
  List<dynamic> idcrias = [];
  List<dynamic> crias = [];
  List<dynamic> datosCamadaSeleccionada = [];
  List<String> listaFallecidos = [];


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool botondetalles1 = false;
  String loteSeleccionado = '';

  @override
  void initState() {
    super.initState();
    print('id de la hembra en crias$idhembra');
    consultarCerdita();
    idslotes();
    fallecidas();
    consultarhembras();
  }

  @override
  void didUpdateWidget(covariant criasmo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('id de la hembra en crias${widget.idhembra}');
    consultarCerdita();
  }

  void consultarhembras() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Agrega los datos a la lista sin sobrescribir
        datosh.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
      });
    });
  }

  void consultarCerdita() {
    datocamada.clear();
    datoscerditas.clear();
    datos.clear();
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .where('id', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datoscerditas = querySnapshot.docs.map((DocumentSnapshot doc) {

          int camadas = doc['camadas'] ?? 0;

          for (int i = camadas; i >= 1; i--) {
            datocamada.add(i);
            datocamada.sort();
          }

          return {
            consultarcrias()
          };
        }).toList();
      });
    })
        .catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }



  void consultarcrias() async {
    try {
      for(int camada in  datocamada){
        // Consulta para obtener documentos de la subcolección
        QuerySnapshot<Map<String, dynamic>> subcoleccionSnapshot = await _firestore
            .collection('crias')
            .doc(idhembra.toString())
            .collection('camada$camada')
            .get();

        // Verificar si hay documentos en la subcolección
        if (subcoleccionSnapshot.docs.isNotEmpty) {
          print('Datos del documento $idhembra en camada$camada:');
          // Limpiar la lista antes de agregar nuevos datos

          // Iterar sobre los documentos de la subcolección
          for (QueryDocumentSnapshot<Map<String, dynamic>> documentoSubcoleccion
          in subcoleccionSnapshot.docs) {
            // Acceder a los datos del documento y agregarlos a la lista
            Map<String, dynamic> datosDocumento = documentoSubcoleccion.data();
            Map<String, dynamic> datosCamada = {
              'camada': camada,
              'datos': datosDocumento,
            };
            int criavalor= camada;
            datos.add(datosCamada);
            print('$camada con sus datos: $datosDocumento');
          }

          // Ahora puedes usar la lista datos en otros lugares si es necesario
        } else {
          print('No hay documentos en camada$camada');
        }
      }
    } catch (e) {
      print('Error en la consulta de camadas: $e');
    }
  }

  void idslotes() {
    listaDeIDs.clear();
    FirebaseFirestore.instance
        .collection('lotes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((doc) {
          String idLote = doc.id;
          String datoLote = doc['dato_lote']; // Accede al campo dato_lote
          listaDeIDs.add(datoLote);
          idcrias.add(idLote);
        });

        // Imprime la lista con IDs y datos de lote
        print('IDs y datos de la colección: $listaDeIDs');
        print('ID crias: $idcrias');
      });
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
                width: 300 * fem,
                height: 410 * fem,
                //color: Colors.black45,
                child: Stack(
                  children: [
                    Positioned(
                      left: 35 * fem,
                      top: 5 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 220 * fem,
                          height: 65 * fem,
                          child: Container(
                            margin: EdgeInsets.only(top: 1 * ffem),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  73, 187, 217, 190),
                              borderRadius: BorderRadius.circular(5 * fem),
                              // color: Colors.blue,
                            ),
                            child: SingleChildScrollView(
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: generateContainers(datocamada,datoscerditas, fem),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10 * fem, top: 90 * fem,),
                        width: 280 * fem,
                        height: 300 * fem,
                        child: infor()
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  List<Widget> generateContainers(List<dynamic> datocamada, List<dynamic> datoscerditas,double fem) {
    List<Widget> containers = [];

    for (int i = 0; i < datocamada.length; i++) {
      print('estos son  los datos de generatecontainer');
      print(datocamada[i]);
      print(datos);
      containers.add(
          InkWell(
            onTap: () {
              setState(() {
                print('lista muertos $listaFallecidos');
                if (listaFallecidos.contains(idhembra.toString())){
                  print('La condición se cumple');
                  opcion2(i, datoscerditas);
                }else{
                  print('La condición no se  cumple');
                  var vari= i +1;
                  opcion(vari,datoscerditas);
                  botondetalles1 = true;}
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: 5 * fem,top: 7*fem),
              width: 50 * fem,
              height: 50 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5 * fem),
                color: Color(0xffffffff),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3* fem),
                    width: 45 * fem,
                    height: 40 * fem,
                    child: Image.asset(
                      'img/desktop/crias.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2* fem),
                    child: Text('CAMADA  ${i +1}',style: SafeGoogleFont(
                      'Alfa Slab One',
                      fontSize: 6 * fem,
                      fontWeight: FontWeight.w400,
                      height: 0.2 * fem / fem,
                      letterSpacing: 0.5 * fem,
                      color: Colors.teal,
                    ),),),
                ],
              ),
            ),
          )
      );
    }
    return containers;
  }

  opcion(int i,List<dynamic> datoscerditas){
    var camada= i;
    print(i);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿QUE DESEA HACER?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Escoja la opsion que desea agregar'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Editar Informacion'),
              onPressed: () {
                setState(() {
                  mostrarInformacion(camada, datoscerditas);
                });
              },
            ),
            TextButton(
              child: Text('Agregar a Lote'),
              onPressed: () {
                setState(() {
                  lotes();
                });
                // Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> opcion2(int i, List<dynamic> datoscerditas) async {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    var camada = i;
    print(i);
    print('dato cerdita $datoscerditas');

    TextEditingController remplaController = TextEditingController();

    List hembrasConCamada = datosh.where((cerdita) => (cerdita['camadas'] ?? 0) > 0).toList();


    List<String> hembrasSeleccionadas = [];

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('HEMBRA REMPLAZO'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Escoja la hembra de remplazo'),
                DropdownButton<String>(
                  items: hembrasConCamada
                      .map<DropdownMenuItem<String>>((dynamic item) {
                    return DropdownMenuItem<String>(
                      value: item['id'].toString(),
                      child: Text(item['id'].toString()),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    remplaController.text = newValue ?? "";
                  },
                  hint: Text('Seleccione un ID'),
                  value: remplaController.text.isEmpty ? null : remplaController.text,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                String hembraremplazo = remplaController.text;
                print(hembraremplazo);

                CollectionReference criasCollection = FirebaseFirestore.instance.collection('crias');

                try {
                  // Obtén el valor actual de "camadas" en la hembra seleccionada
                  QuerySnapshot<Map<String, dynamic>> hembraQuerySnapshot = await FirebaseFirestore.instance
                      .collection('registro_hembra')
                      .where('id', isEqualTo: int.parse(hembraremplazo))
                      .get();


                  // Verifica si hay algún documento que cumple con la condición
                  if (hembraQuerySnapshot.docs.isNotEmpty) {
                    // Supongamos que estamos interesados en el primer documento si hay múltiples coincidencias
                    DocumentSnapshot hembraSnapshot = hembraQuerySnapshot.docs.first;

                    // Obtiene el valor actual de "camadas" en la hembra seleccionada
                    int camadasActual = (hembraSnapshot['camadas'] ?? 0) as int;

                    // Incrementa el campo 'camadas' en la hembra seleccionada
                    await FirebaseFirestore.instance
                        .collection('registro_hembra')
                        .doc(hembraSnapshot.id)  // Utiliza el ID del documento
                        .update({
                      'camadas': FieldValue.increment(1),
                    });

                    int idHembra = hembraSnapshot['id'] as int;
                    // Crea una nueva colección para la camada dentro de la colección "crias"
                    CollectionReference camadaCollection = criasCollection
                        .doc(idHembra.toString())  // Utiliza el ID del documento
                        .collection('camada${camadasActual + 1}');

                    // Itera sobre los datos de las camadas y guárdalos en la colección "crias"
                    for (Map<String, dynamic> camadaData in datos) {
                      Map<String, dynamic> datosCamada = camadaData['datos'];

                      // Guarda los datos de la camada en la nueva colección
                      await camadaCollection.add(datosCamada);

                      print('Datos de la camada ${camadasActual + 1} guardados en la colección "crias"');
                    }

                    Navigator.of(context).pop();
                  } else {
                    // No se encontraron documentos que cumplan con la condición
                    print('No se encontró ninguna hembra con el ID especificado.');
                  }
                } catch (e) {
                  print('Error al procesar la operación: $e');
                  // Manejar el error según sea necesario
                }
              },

              child: Text('GUARDAR'),
            ),
          ],
        );
      },
    );
  }


  mostrarInformacion(int camada, List<dynamic> datoscerditas) {
    print(datos);

    datosCamadaSeleccionada = datos.where((cerdita) => cerdita['camada'] == camada).toList();


    print('datosCamadaSeleccionada nose que pasa $datosCamadaSeleccionada');
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información de la Camada $camada'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var cerdita in datosCamadaSeleccionada)
                  ListTile(
                    title: Text('TATUAJE: ${cerdita['datos']['tatuaje']}'),
                    subtitle:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SEXO: ${cerdita['datos']['sexo']}'),
                        Text('PESO AL NACER: ${cerdita['datos']['peso_nacer']}'),
                        Text('CHAPETA: ${cerdita['datos']['chapeta']}'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                datosCamadaSeleccionada.clear();
                datos.clear();
                consultarcrias();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }



  lotes() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    TextEditingController nuevoLoteController = TextEditingController();
    TextEditingController existeLoteController = TextEditingController();

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // El usuario no puede cerrar la alerta tocando fuera de ella
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            margin: EdgeInsets.only(top: 3* fem),
            child: Center(child: Text('AGREGAR A UN LOTE',style: SafeGoogleFont(
              'Alfa Slab One',
              fontSize: 5 * fem,
              fontWeight: FontWeight.w400,
              height: 0.2 * fem / fem,
              letterSpacing: 0.3 * fem,
              color: Colors.teal,
            ),)),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 0.8 * fem,
                  color: Color(0xfffbf4f4),
                  margin: EdgeInsets.only(bottom: 1 * fem),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Loteexistente();
              },
              child: Column(
                children: [
                  Image.asset(
                    'img/desktop/loteexis.jpg',
                    width: 30 * fem,
                    height: 30 * fem,
                  ),
                  SizedBox(width: 8),
                  Container(
                    margin: EdgeInsets.only(top: 3 * fem),
                    child: Text(
                      'LOTE EXISTENTE',
                      style: TextStyle(
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                NuevoLote(nuevoLoteController);
              },
              child: Column(
                children: [
                  Image.asset(
                    'img/desktop/lotemas.jpg',
                    width: 30 * fem,
                    height: 30 * fem,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'LOTE NUEVO',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void NuevoLote(TextEditingController nuevoLoteController) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('NUEVO LOTE')),
          content: Container(
            width: 10 * fem,
            height: 10 * fem,
            child: Column(
              children: [
                Text('Ingrese el número del lote:'),
                Container(
                  width: 10 * fem,
                  height: 6 * fem,
                  child: TextField(
                    controller: nuevoLoteController,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                String nuevoLote = nuevoLoteController.text;

                // Obtiene la referencia a la colección principal "lotes"
                CollectionReference lotesCollection =
                _firestore.collection('lotes');

                // Añade un documento con un ID automático en la colección "lotes"
                DocumentReference nuevoLoteRef =
                await lotesCollection.add({'dato_lote': nuevoLote});

                // Obtiene la referencia a la subcolección "cerditoslote" dentro del documento recién creado
                CollectionReference cerditosLoteCollection =
                nuevoLoteRef.collection('cerditoslote');

                // Añade documentos a la subcolección "cerditoslote"
                for (var cerdito in datos) {
                  await cerditosLoteCollection.add({
                    'sexo': cerdito['sexo'],
                    'tatuaje': cerdito['tatuaje'],
                    'chapeta': cerdito['chapeta'],
                    'peso_nacer': cerdito['peso_nacer'],
                    'fecha_nacimiento': cerdito['fecha_nacimiento'],
                    'vacunas': cerdito['vacunas'],
                    'estadolote': 'Precebo'
                    // Agrega más campos según sea necesario
                  });
                }

                Navigator.of(context).pop();
              },
              child: Text('GUARDAR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }


  void Loteexistente() {
    print('datos del select: $listaDeIDs');

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    TextEditingController loteSeleccionadoController = TextEditingController();

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text('LOTE EXISTENTE')),
          content: Container(
            width: 10 * fem,
            height: 10 * fem,
            child: Column(
              children: [
                Text('Seleccione lote'),
                Container(
                  width: 20 * fem,
                  height: 6 * fem,
                  child: DropdownButton<String>(
                    value: listaDeIDs.isNotEmpty ? listaDeIDs[0] : null,
                    onChanged: (String? newValue) {
                      setState(() {
                        loteSeleccionadoController.text = newValue!;
                      });
                    },
                    items: listaDeIDs.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                String loteSeleccionado = loteSeleccionadoController.text;

                CollectionReference lotesCollection = _firestore.collection('lotes');

                // Consulta los documentos en la colección "lotes" que tienen el campo "dato_lote" igual al valor seleccionado
                QuerySnapshot loteQuery = await lotesCollection.where('dato_lote', isEqualTo: loteSeleccionado).get();

                if (loteQuery.docs.isNotEmpty) {
                  // Toma la referencia del primer documento encontrado (puedes ajustar la lógica si esperas más de un resultado)
                  DocumentReference loteExistenteRef = loteQuery.docs[0].reference;

                  // Obtiene la referencia a la subcolección "cerditoslote" dentro del documento encontrado
                  CollectionReference cerditosLoteCollection = loteExistenteRef.collection('cerditoslote');

                  // Añade documentos a la subcolección "cerditoslote"
                  for (var cerdito in datos) {
                    await cerditosLoteCollection.add({
                      'sexo': cerdito['sexo'],
                      'tatuaje': cerdito['tatuaje'],
                      'chapeta': cerdito['chapeta'],
                      'peso_nacer': cerdito['peso_nacer'],
                      'fecha_nacimiento': cerdito['fecha_nacimiento'],
                      'vacunas': cerdito['vacunas'],
                      'estadolote': 'Precebo'
                      // Agrega más campos según sea necesario
                    });
                  }

                  Navigator.of(context).pop();
                } else {
                  // No se encontró ningún documento con el valor seleccionado, puedes manejar esto como desees
                  print('No se encontró el lote con el dato_lote seleccionado.');
                }
              },
              child: Text('SELECCIONAR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }



  Widget infor() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    if (botondetalles1) {
      return Container(
        width: 100 * fem,
        height: 80 * fem,
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(height: 25.0),
                child: TabBar(
                  tabs: [
                    Tab(text: 'Informacion'),
                    Tab(text: 'Peso'),
                    Tab(text: 'Salud'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                     // color: Colors.red,
                      child: Center(
                        child: ListView(
                          children: [
                            for (var cerdita in datosCamadaSeleccionada)
                              ListTile(
                                title: Text('TATUAJE: ${cerdita['datos']['tatuaje']}'),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('SEXO: ${cerdita['datos']['sexo']}    ',style: TextStyle(fontSize: 10 * fem)),
                                    Text('  PESO AL NACER: ${cerdita['datos']['peso_nacer' ]}   ',style: TextStyle(fontSize: 10 * fem)),
                                    Text('  CHAPETA: ${cerdita['datos']['chapeta']}',style: TextStyle(fontSize: 10 * fem)),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Contenido de la Pestaña 2
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text('Contenido de la Pestaña 2'),
                      ),
                    ),
                    // Contenido de la Pestaña 3
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Contenido de la Pestaña 3'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(); // Devuelve un contenedor vacío si botondetalles1 es falso
    }
  }

}
