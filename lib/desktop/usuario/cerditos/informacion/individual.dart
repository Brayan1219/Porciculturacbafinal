import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/infomacho.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/informacion.dart';
import 'package:myapp/utils.dart';

class individual_desk extends StatelessWidget {
  final int idhembra;

  individual_desk(this.idhembra);

  @override
  Widget build(BuildContext context) {
    print('ID en individual_desk: $idhembra');
    print(idhembra);
    return indiapp(idhembra);
  }
}

class indiapp extends StatefulWidget {
  final int idhembra;

  indiapp(this.idhembra);

  @override
  State<indiapp> createState() => _indiappState(idhembra);
}

class _indiappState extends State<indiapp> {
  final int idhembra;

  _indiappState(this.idhembra);

  List<dynamic> datos = [];
  List<String> listaFallecidos = [];
  Map<String, DateTime> fechasFallecimiento = {};
  Map<String, String> hora = {};

  @override
  void initState() {
    super.initState();
    consultarcerdita();
    fallecidas();
  }

  void consultarcerdita() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .where('id', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datos = querySnapshot.docs
            .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
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
          fechasFallecimiento[id] = doc['fecha'].toDate();
          hora[id] = doc['hora'];

        }
        print('IDs consultados: $listaFallecidos');
        print(hora);
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
                      left: 30 * fem,
                      top: 40 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 80 * fem,
                          height: 110 * fem,
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
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 4 * ffem,
                                          right: 4 * ffem,
                                          top: 8 * ffem),
                                      width: 310 * fem,
                                      height: 15 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '- ${data['nombre']} -',
                                          style: GoogleFonts.holtwoodOneSc(
                                            fontSize: 6.5 * fem,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 1.3,
                                            color: Colors.black38,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 1 * ffem),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 3 * fem, left: 12 * fem),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5 * fem),
                                                  color: Colors.white54),
                                              width: 25 * fem,
                                              height: 8 * fem,
                                              child: Center(
                                                child: Text(
                                                  'ID:  ${data['id']}',
                                                  style: GoogleFonts.kameron(
                                                    fontSize: 3.5 * fem,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.italic,
                                                    letterSpacing: 0,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 3 * fem, left: 5 * fem),
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
                                                  style: GoogleFonts.kameron(
                                                    fontSize: 3.5 * fem,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle: FontStyle.italic,
                                                    letterSpacing: 0,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 3 * fem),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5 * fem),
                                          color: Colors.white54),
                                      width: 54 * fem,
                                      height: 8 * fem,
                                      child: Center(
                                        child: Text(
                                          'NUMERO PESONES:${data['pesones']}',
                                          style: GoogleFonts.kameron(
                                            fontSize: 3.5 * fem,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            letterSpacing: 0,
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250 * fem,
                                      height: 22 * fem,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 6 * fem,
                                            margin:
                                                EdgeInsets.only(top: 8 * fem),
                                            decoration: BoxDecoration(
                                                color: Colors.white54),
                                            child: Center(
                                              child: Text(
                                                'FECHA INGRESO:',
                                                style: GoogleFonts.kameron(
                                                  fontSize: 3.5 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(top: 2 * fem),
                                            child: Center(
                                              child: Text(
                                                '${DateFormat('yyyy-MM-dd').format(data['fecha_ingreso'].toDate())}',
                                                style: GoogleFonts.kameron(
                                                  fontSize: 3.5 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 250 * fem,
                                      height: 20 * fem,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 6 * fem,
                                            margin:
                                                EdgeInsets.only(top: 4 * fem),
                                            decoration: BoxDecoration(
                                                color: Colors.white54),
                                            child: Center(
                                              child: Text(
                                                'FECHA NACIMIENTO:',
                                                style: GoogleFonts.kameron(
                                                  fontSize: 3.5 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black38,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.only(top: 2 * fem),
                                            child: Center(
                                              child: Text(
                                                '${DateFormat('yyyy-MM-dd').format(data['fecha_nacimiento'].toDate())}',
                                                style: GoogleFonts.kameron(
                                                  fontSize: 3.5 * fem,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  letterSpacing: 0,
                                                  color: Colors.black26,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 2 * fem),
                                      width: 480 * fem,
                                      height: 20 * fem,
                                        child: Stack(
                                          children: [
                                            if (listaFallecidos.contains(idhembra.toString()))
                                                  Column(
                                                    children: [
                                                      Center(
                                                        child: Container(
                                                          height: 6 * fem,
                                                          decoration: BoxDecoration(color: Colors.white54),
                                                          child: Center(
                                                            child: Text(
                                                              'FALLECIMIENTO:',
                                                              style: GoogleFonts.kameron(
                                                                fontSize: 3.5 * fem,
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FontStyle.italic,
                                                                letterSpacing: 0,
                                                                color: Colors.black38,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(left: 15 * fem),
                                                                width:30 * fem,
                                                                child: Text(
                                                                  'Fecha:',
                                                                  style: GoogleFonts.kameron(
                                                                    fontSize: 3.5 * fem,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    color: Colors.black26,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width:30 * fem,
                                                                margin: EdgeInsets.only(left: 15 * fem),
                                                                child: Text(
                                                                  '${DateFormat('yyyy-MM-dd').format(fechasFallecimiento[idhembra.toString()]!)}',
                                                                  style: GoogleFonts.kameron(
                                                                    fontSize: 3.5 * fem,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    color: Colors.black26,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                width:25 * fem,
                                                                child: Text(
                                                                  'Hora:',
                                                                  style: GoogleFonts.kameron(
                                                                    fontSize: 3.5 * fem,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    color: Colors.black26,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width:25 * fem,
                                                                child: Text(
                                                                  '${hora[idhembra.toString()] ?? ""}',
                                                                  style: GoogleFonts.kameron(
                                                                    fontSize: 3.5 * fem,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontStyle: FontStyle.italic,
                                                                    letterSpacing: 0,
                                                                    color: Colors.black26,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                        )
                                          ],
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            // Llama al método informacion() aquí
                          ),
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
}
