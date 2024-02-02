import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/infomacho.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/informacion.dart';
import 'package:myapp/utils.dart';

import 'crias.dart';
import 'hojadevida.dart';


class individual extends StatelessWidget {
  final int idhembra;
  individual(this.idhembra);

  @override
  Widget build(BuildContext context) {
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
  bool interfazhembra = true;
  bool interfazmacho = false;
  bool hojadevida = false;
  bool interfazcrias = false;
  List<dynamic> hoja = [];

  List<String> listaFallecidos = [];
  Map<String, DateTime> fechasFallecimiento = {};
  Map<String, String> hora = {};


  @override
  void initState() {
    super.initState();
    consultarcerdita();
    fallecidas();
    consultarcri();
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

  void consultarcri() {
    hoja.clear();
    FirebaseFirestore.instance
        .collection('hoja_devida')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena solo los valores del campo id_hembras en la lista
        hoja.addAll(querySnapshot.docs.map((doc) => doc['id_hembra']).toList());
        print(hoja);
      });
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 42*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // autogroupn71ytzB (ACtQc8p4ZrpjZBwJWaN71y)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 26*fem),
                  width: 572*fem,
                  height: 680*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // materialapp2Kh (31:19)
                        left: 0*fem,
                        top: 0*fem,
                        child: Container(
                          width: 572*fem,
                          height: 636*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle5M75 (20:56)
                                left: 0*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 390*fem,
                                    height: 277*fem,
                                    child: Image.asset(
                                      'img/mobil/fondoinicio.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // ellipse1Tfu (20:43)
                                left: 0*fem,
                                top: 225*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 102*fem,
                                    height: 94*fem,
                                    child: Image.asset(
                                      'img/mobil/circulo.png',
                                      width: 102*fem,
                                      height: 94*fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle6yeF (20:44)
                                left: 51*fem,
                                top: 225*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 339*fem,
                                    height: 68*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle7hKM (20:60)
                                left: 339*fem,
                                top: 204*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 233*fem,
                                    height: 89*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                // informacionwd1 (20:61)
                                left: 84.5*fem,
                                top: 35*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 221*fem,
                                    height: 35*fem,
                                    child: Text(
                                      'INFORMACION',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Alfa Slab One',
                                        fontSize: 25*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3675*ffem/fem,
                                        letterSpacing: 1*fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // informacionofD (31:12)
                                left: 130.5*fem,
                                top: 68*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 129*fem,
                                    height: 14*fem,
                                    child: Stack(
                                      children: [
                                        if (interfazhembra)
                                      Text(
                                        'INDIVIDUAL / HEMBRA',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Alfa Slab One',
                                          fontSize: 9*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3675*ffem/fem,
                                          letterSpacing: 0.4*fem,
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                        if(interfazmacho)
                                          Text(
                                            'INDIVIDUAL / MACHO',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Alfa Slab One',
                                              fontSize: 10*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.3675*ffem/fem,
                                              letterSpacing: 0.4*fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        if(hojadevida)
                                          Text(
                                            'HOJA DE VIDA',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Alfa Slab One',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.3675*ffem/fem,
                                              letterSpacing: 0.4*fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        if(interfazcrias)
                                          Text(
                                            'CRIAS / CAMADAS',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Alfa Slab One',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.3675*ffem/fem,
                                              letterSpacing: 0.4*fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                    ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // iconmenu1WP (31:6)
                                left: 25 * fem,
                                top: 33 * fem,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => informacion()));
                                  },
                                  child: SizedBox(
                                    width: 25.7 * fem,
                                    height: 40.05 * fem,
                                    child: Image.asset(
                                      'img/mobil/flecha.png',
                                      width: 25.7 * fem,
                                      height: 40.05 * fem,
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                // rectangle24L2s (31:14)
                                left: 51*fem,
                                top: 157*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 288*fem,
                                    height: 479*fem,
                                    child: Container(
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(30*fem),
                                       color: Color(0xffffffff),
                                   //     color: Colors.pink
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 60*fem,
                                top: 79*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 269*fem,
                                    height: 164*fem,
                                    child: Column(
                                      children: [
                                        if (interfazhembra || interfazmacho)
                                        Image.asset(
                                          'img/mobil/cerdito1.png',
                                          fit: BoxFit.cover,
                                        ),
                                        if (interfazcrias)
                                          Container(
                                            margin: EdgeInsets.only(top: 40 * fem),
                                            width: 380 * fem,
                                            height: 90 * fem,
                                            child: Image.asset(
                                              'img/mobil/carru1.gif',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38 * fem,
                        top: 259 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 312 * fem,
                            height: 421 * fem,
                            child: manejopantallas(idhembra)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(39 * fem, 0 * fem, 39 * fem, 0 * fem),
                  padding: EdgeInsets.fromLTRB(26 * fem, 21 * fem, 19 * fem, 20 * fem),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(144, 161, 130, 210),
                    borderRadius: BorderRadius.circular(30 * fem),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal, // Configurar desplazamiento horizontal
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 23 * fem, 0 * fem),
                        width: 74 * fem,
                        height: 55 * fem,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              interfazhembra = true;
                              interfazmacho = false;
                              interfazcrias = false;
                              hojadevida = false;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30 * fem),
                            child: Container(
                              color: Color.fromRGBO(98, 161, 145, 170),
                              child: Image.asset(
                                'img/mobil/pork.png',
                                width: 25.7 * fem,
                                height: 40.05 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 23 * fem, 0 * fem),
                        width: 74 * fem,
                        height: 55 * fem,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              interfazhembra = false;
                              interfazmacho = true;
                              interfazcrias = false;
                              hojadevida = false;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30 * fem),
                            child: Container(
                              color: Color.fromRGBO(98, 161, 145, 170),
                              child: Image.asset(
                                'img/mobil/cerdo.png',
                                width: 25.7 * fem,
                                height: 40.05 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 22 * fem, 0 * fem),
                        width: 74 * fem,
                        height: 55 * fem,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              interfazhembra = false;
                              interfazmacho = false;
                              hojadevida = true;
                              interfazcrias = false;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30 * fem),
                            child: Container(
                              color: Color.fromRGBO(98, 161, 145, 170),
                              child: Image.asset(
                                'img/mobil/hojavida.png',
                                width: 25.7 * fem,
                                height: 40.05 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 74 * fem,
                        height: 55 * fem,
                        margin: EdgeInsets.fromLTRB(22* fem, 0 * fem, 22 * fem, 0 * fem),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              interfazhembra = false;
                              interfazmacho = false;
                              hojadevida = false;
                              interfazcrias = true;
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30 * fem),
                            child: Container(
                              color: Color.fromRGBO(98, 161, 145, 170),
                              child: Image.asset(
                                'img/mobil/cerdosbb.png',
                                width: 25.7 * fem,
                                height: 40.05 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  manejopantallas(int id){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    var valorid = id;
    print('ID en manejopantallas: $id');

    return Stack(
      children: [
        if (interfazhembra)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20 * fem),
 color: Color(0xfffbf4f4),
                //color: Colors.cyan
            ),
            child: ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, index) {
                final data = datos[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20 * ffem, right: 20 * ffem, top: 15*ffem),
                      width: 310 * fem,
                      height: 70 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          '- ${data['nombre']} -',
                          style: GoogleFonts.anton(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 1.8,
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15*ffem),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30 * ffem, right: 15 * ffem,top: 9*ffem),
                              width: 115 * fem,
                              height: 25 * fem,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                  color: Colors.white54
                              ),
                              child: Center(
                                child: Text(
                                  'ID: ${data['id']}',
                                  style: GoogleFonts.adamina(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.2,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5 * ffem,top: 9*ffem),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5 * fem),
                                  color: Colors.white54
                              ),
                              width: 115 * fem,
                              height: 25 * fem,
                              child: Center(
                                child: Text(
                                  'PESO: ${data['peso']}',
                                  style: GoogleFonts.adamina(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.2,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5 * ffem, right: 5 * ffem,top: 20*ffem),
                      width: 250 * fem,
                      height: 25 * fem,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                          color: Colors.white54
                      ),
                      child: Center(
                        child: Text(
                          'NUMERO PESONES: ${data['pesones']}',
                          style: GoogleFonts.adamina(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 1.2,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5 * ffem, right: 5 * ffem,top: 25*ffem),
                      width: 312 * fem,
                      height: 55 * fem,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10 * ffem),
                            decoration: BoxDecoration(
                                color: Colors.white54
                            ),
                            child: Center(
                              child: Text(
                                'FECHA INGRESO:',
                                style: GoogleFonts.adamina(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.2,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                '${DateFormat('yyyy-MM-dd').format(data['fecha_ingreso'].toDate())}',
                                style: GoogleFonts.adamina(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.2,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5 * ffem, right: 5 * ffem,top: 25*ffem),
                      width: 312 * fem,
                      height: 55 * fem,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10 * ffem),
                            decoration: BoxDecoration(
                                color: Colors.white54
                            ),
                            child: Center(
                              child: Text(
                                'FECHA NACIMIENTO:',
                                style: GoogleFonts.adamina(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.2,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text(
                                '${DateFormat('yyyy-MM-dd').format(data['fecha_nacimiento'].toDate())}',
                                style: GoogleFonts.adamina(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.2,
                                  color: Colors.black26,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4 * fem),
                      width: 312 * fem,
                      height: 65 * fem,
                      child: Stack(
                        children: [
                          if (listaFallecidos.contains(idhembra.toString()))
                            Column(
                              children: [
                                Center(
                                  child: Container(
                                    height: 25 * fem,
                                    decoration: BoxDecoration(color: Colors.white54),
                                    child: Center(
                                      child: Text(
                                        'FALLECIMIENTO:',
                                        style: GoogleFonts.kameron(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          letterSpacing: 1.2,
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
                                          margin: EdgeInsets.only(left: 75 * fem),
                                          width:100 * fem,
                                          child: Text(
                                            'Fecha:',
                                            style: GoogleFonts.kameron(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 1.2,
                                              color: Colors.black26,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:100 * fem,
                                          margin: EdgeInsets.only(left: 35 * fem),
                                          child: Text(
                                            '${DateFormat('yyyy-MM-dd').format(fechasFallecimiento[idhembra.toString()]!)}',
                                            style: GoogleFonts.kameron(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 1.2,
                                              color: Colors.black26,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width:100 * fem,
                                          child: Text(
                                            'Hora:',
                                            style: GoogleFonts.kameron(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 1.2,
                                              color: Colors.black26,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:100 * fem,
                                          child: Text(
                                            '${hora[idhembra.toString()] ?? ""}',
                                            style: GoogleFonts.kameron(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic,
                                              letterSpacing: 1.2,
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
          ),
        if (interfazmacho && hoja.contains(idhembra))
          Container(child: info(valorid)),
        if (interfazmacho && !hoja.contains(idhembra))
          Container(child: AlertDialog(
            title: Text('NO HAY MACHOS'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La hembra escogida no tiene machos asociados'),
                ],
              ),
            ),
          ),
          ),
        if (hojadevida && hoja.contains(idhembra))
         Container(child: hojavida_mobil(valorid),
          ),
        if (interfazcrias && hoja.contains(idhembra))
          Container(child: crias_mobil(valorid)
          ),
        if (hojadevida && !hoja.contains(idhembra))
          Container(child: AlertDialog(
            title: Text('NO HAY DATOS'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La hembra escogida no tiene datos en su hoja de vida'),
                ],
              ),
            ),
          ),
          ),
        if(interfazcrias && !hoja.contains(idhembra))
          Container(child: AlertDialog(
            title: Text('NO HAY CRIAS'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La hembra escogida no tiene crias asociadas'),
                ],
              ),
            ),
          ),)
      ],
    );
  }

}
