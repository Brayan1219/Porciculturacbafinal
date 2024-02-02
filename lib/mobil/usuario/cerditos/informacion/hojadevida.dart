import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class hojavida_mobil extends StatelessWidget {
  final int idhembra;
  hojavida_mobil(this.idhembra);

  @override
  Widget build(BuildContext context) {
    return hojavida(idhembra);
  }
}

class hojavida extends StatefulWidget {
  final int idhembra;
  hojavida(this.idhembra);
  @override
  State<hojavida> createState() => _hojavidaState(idhembra);
}

class _hojavidaState extends State<hojavida> {
  final int idhembra;
  _hojavidaState(this.idhembra);
  List<dynamic> datos = [];
  bool botondetalles1 = false;
  bool botondetalles2 = false;

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarDatos();
  }

  // Función para obtener los datos de Firestore
  void consultarDatos() {
    FirebaseFirestore.instance.collection('registro_macho').get().then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena los datos en la lista
        datos = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
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
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: generateContainers(datos, fem),
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
                            if(botondetalles1)
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
                            if(botondetalles1)
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
                                          if(botondetalles1)
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
                                    if(botondetalles1)
                                      Container(
                                        margin:
                                        EdgeInsets.only(left: 3 * fem),
                                        width: 2 * fem,
                                        height: 50 * fem,
                                        color: Colors.white54,
                                      ),
                                    if(botondetalles1)
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
                                            if(botondetalles1)
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
                                            if(botondetalles1 )
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
          ],
        ),
      ),
    );
  }

  List<Widget> generateContainers(List<dynamic> data, double fem) {
    double baseWidth = 390;
    double ffem = fem * 0.97;

    List<Widget> containers = [];
    for (var item in data) {
      var id = item['id'];
      containers.add(
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(2 * fem),
              child:InkWell(
                onTap: () {
                  setState(() {
                    botondetalles1 = !botondetalles1;
                    botondetalles2 = false;
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
                          estadomuerto();
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
      );
    }
    return containers;
  }

  estadomuerto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
                // Aquí puedes agregar la lógica para cambiar el estado del animal a "vivo"
                Navigator.of(context).pop(); // Cierra la alerta
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
