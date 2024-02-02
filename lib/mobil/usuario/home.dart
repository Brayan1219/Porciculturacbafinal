import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/usuario/alimentacion/alimento.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:myapp/mobil/usuario/cerditos/informacion/informacion.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/mobil/usuario/limpio/limpio.dart';
import 'package:myapp/mobil/usuario/salud/salud.dart';
import 'package:myapp/utils.dart';

import '../../services/firebase_service.dart';
import 'cerditos/informacion/infolote.dart';
import 'notificacion.dart';

class homemobil extends StatelessWidget {
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/HOME",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: home1(),
    );
  }
}

class home1 extends StatefulWidget {
  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  final FirebaseService firebaseService = FirebaseService();
  String _userEmail = 'Cargando...';

  bool botonescerdito = false;
  bool botonessalud = false;
  bool botonesalimento = false;
  bool botoneslimpio = false;

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  Future<void> getUserEmail() async {
    String? userEmail = await firebaseService.getUserEmail();

    setState(() {
      _userEmail = userEmail ?? 'Correo no disponible';
    });
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
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 575 * fem,
                  height: 281 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(27 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 575 * fem,
                          height: 138 * fem,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(234, 136, 146, 92)),
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
                                      child: Image.asset(
                                        'img/mobil/iconmenu.png',
                                        width: 25.7 * fem,
                                        height: 14.28 * fem,
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
                                        top: 38 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 229 * fem,
                                            height: 35 * fem,
                                            child: Text(
                                              'PORCICULTURA',
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
                                      Positioned(
                                        left: 280.5 * fem,
                                        top: 14 * fem,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    notificacion(),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  child: SizedBox(
                                                    width: 25.7 * fem,
                                                    height: 63.41 * fem,
                                                    child: Image.asset(
                                                      'img/mobil/iconcampana.png',
                                                      width: 25.7 * fem,
                                                      height: 33.41 * fem,
                                                    ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle6inK (15:17)
                        left: 51 * fem,
                        top: 86 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 340 * fem,
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
                        top: 86 * fem,
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
                        top: 108 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 345 * fem,
                            height: 163 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                              //  color: Color(0xfffff0f0),
                              ),
                              child: _swiper(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroup65nftaK (ACtHX1Hmrp7CuN2siq65NF)
                  padding: EdgeInsets.fromLTRB(
                      26 * fem, 20 * fem, 26 * fem, 30 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // menudashboarD6o (20:2)
                        margin: EdgeInsets.fromLTRB(
                            12 * fem, 0 * fem, 10 * fem, 0 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 28 * fem),
                              width: double.infinity,
                              height: 117 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // boton salud ------------------------------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        //botonessalud = true;
                                        botonessalud = !botonessalud;
                                        botoneslimpio = false;
                                        botonescerdito = false;
                                        botonesalimento = false;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 34 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(22 * fem,
                                          13 * fem, 29 * fem, 14 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30 * fem),
                                        color: botonessalud
                                            ? Color.fromRGBO(144, 161, 130, 150)
                                            : Color.fromRGBO(242, 215, 215, 10),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 90 * fem,
                                          height: 90 * fem,
                                          child: Image.asset(
                                            'img/mobil/corazon.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //boton alimento -------------------------------------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        botonessalud = false;
                                        botonesalimento = !botonesalimento;
                                        botoneslimpio = false;
                                        botonescerdito = false;
                                        //botonesalimento = true;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(26 * fem,
                                          13 * fem, 25 * fem, 14 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30 * fem),
                                        color: botonesalimento
                                            ? Color.fromRGBO(144, 161, 130, 150)
                                            : Color.fromRGBO(242, 215, 215, 10),
                                      ),
                                      child: Center(
                                        // veganfoodd43 (15:111)
                                        child: SizedBox(
                                          width: 90 * fem,
                                          height: 90 * fem,
                                          child: Image.asset(
                                            'img/mobil/alimento.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 117 * fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //boton limpio ------------------------------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        botonessalud = false;
                                        botoneslimpio = !botoneslimpio;
                                        //botoneslimpio = true;
                                        botonescerdito = false;
                                        botonesalimento = false;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 34 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(27 * fem,
                                          11 * fem, 24 * fem, 16 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30 * fem),
                                        color: botoneslimpio
                                            ? Color.fromRGBO(144, 161, 130, 150)
                                            : Color.fromRGBO(242, 215, 215, 10),
                                      ),
                                      child: Center(
                                        // housekeepingnr3 (15:113)
                                        child: SizedBox(
                                          width: 90 * fem,
                                          height: 90 * fem,
                                          child: Image.asset(
                                            'img/mobil/limpio.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //boton cerdito ------------------------------------------
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        botonessalud = false;
                                        botonescerdito = !botonescerdito;
                                        botoneslimpio = false;
                                        //botonescerdito = true;
                                        botonesalimento = false;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(24 * fem,
                                          13 * fem, 27 * fem, 14 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30 * fem),
                                        color: botonescerdito
                                            ? Color.fromRGBO(144, 161, 130, 150)
                                            : Color.fromRGBO(242, 215, 215, 10),
                                      ),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 90 * fem,
                                          height: 90 * fem,
                                          child: Image.asset(
                                            'img/mobil/pork.png',
                                            fit: BoxFit.contain,
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
                      SizedBox(
                        height: 30 * fem,
                      ),
                      Container(
                        // autogrouprbgskwH (ACtHMRjQE3MhftKrZFrBGs)
                        margin: EdgeInsets.fromLTRB(
                            12 * fem, 0 * fem, 10 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            12 * fem, 13 * fem, 7 * fem, 12 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0x7af8eeee),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (botonescerdito)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => informacion()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 69 * fem,
                                      height: 55 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: Image.asset(
                                            'img/mobil/datos.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Ver',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          '',
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if (botoneslimpio)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => limpio()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 69 * fem,
                                      height: 55 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 30 * fem,
                                          height: 30 * fem,
                                          child: Image.asset(
                                            'img/mobil/calendario.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Control',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          '',
                                          fontSize: 9 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            if (botonessalud)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => salud()));
                                },
                                child: Container(
                                  width: 69 * fem,
                                  height: 55 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(30 * fem),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'img/mobil/fondoinicio.png',
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    // porkSQo (15:110)
                                    child: SizedBox(
                                      width: 35 * fem,
                                      height: 35 * fem,
                                      child: Image.asset(
                                        'img/mobil/vacunas.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (botonesalimento)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => alimento()));
                                },
                                child: Container(
                                  width: 69 * fem,
                                  height: 55 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(30 * fem),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'img/mobil/fondoinicio.png',
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    // porkSQo (15:110)
                                    child: SizedBox(
                                      width: 30 * fem,
                                      height: 30 * fem,
                                      child: Image.asset(
                                        'img/mobil/vegetales.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => registros()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 69 * fem,
                                      height: 55 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: Image.asset(
                                            'img/mobil/cerdito.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Formularios',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          '',
                                          fontSize: 8 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              InkWell(
                                onTap: () {
                                   Navigator.push(
                                     context,
                                   MaterialPageRoute(
                                     builder: (context) => infolote_mobil()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 69 * fem,
                                      height: 55 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: Image.asset(
                                            'img/mobil/lote.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Lotes',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          '',
                                          fontSize: 8 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  // MaterialPageRoute(
                                  //   builder: (context) => salud()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 69 * fem,
                                      height: 55 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 35 * fem,
                                          height: 35 * fem,
                                          child: Image.asset(
                                            'img/mobil/ganancia.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Ganancia',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          '',
                                          fontSize: 8 * ffem,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30 * fem,
                      ),
                      Container(
                        // rectangle13ogb (15:35)
                        width: double.infinity,
                        height: 131 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffffe6e6),
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
      //DRAWER------------------------------------------------------------------
      drawer: Drawer(
        width: 250 * fem,
        backgroundColor: Color.fromRGBO(242, 215, 215, 5),
        child: Container(
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 250 * fem,
                  height: 299 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff6d8d8),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75 * fem,
                top: 19 * fem,
                child: SizedBox(
                  width: 90 * fem,
                  height: 90 * fem,
                  child: ClipOval(
                    child: Container(
                      child: Image.network(
                        'https://cdn.pixabay.com/animation/2022/12/01/17/03/17-03-11-60_512.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * fem,
                top: 200 * fem,
                child: SizedBox(
                  width: 250 * fem,
                  height: 449 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50 * fem),
                      color: Color(0xffffffff),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 10 * fem, left: 15 * fem, right:  15 * fem),
                      child: ListView(
                        children: [
                          ListTile(
                            subtitle: ExpansionTile(
                              leading: Icon(Icons.settings_outlined),
                              title: Text('CONFIGURACION',style: TextStyle(fontSize: 9.5,),),
                              children: [
                              /*  ListTile(
                                  title: Text('Manejo Roles'),
                                  onTap: () {
                                    // Lógica para la Subopción 1
                                  },
                                ),*/
                                ListTile(
                                  title: Text('Descargar Gestion'),
                                  onTap: () {
                                    // Lógica para la Subopción 2
                                  },
                                ),
                                ListTile(
                                  title: Text('Reiniciar Gestion'),
                                  onTap: () async {
                                    try {
                                      // Eliminatodo de las colecciones
                                      await FirebaseFirestore.instance.collection('registro_hembra').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });
                                      /* await FirebaseFirestore.instance.collection('registro_macho').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });
                                      await FirebaseFirestore.instance.collection('crias').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });*/

                                      print('Base de datos reiniciada correctamente');
                                    } catch (e) {
                                      print('Error al reiniciar la base de datos: $e');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                         /* ListTile(
                            leading: Icon(Icons.person),
                            title: Text('MIS DATOS'),
                            onTap: () => print('Perfil Consulado'),
                          ),*/
                          ListTile(
                            leading: Icon(Icons.output_sharp),
                            title: Text('CERRAR SESION'),
                            onTap: () {
                              signOutAndRedirectToLogin(context);
                            },
                          ),
                          Container(
                            width: 10 * fem,
                            height: 0.5 * fem,
                            color: Colors.black12,
                          ),
                          Container(
                            // texto que le diga el rol child: ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle69FWY (290:24)
                left: 0 * fem,
                top: 135 * fem,
                child: Align(
                  child: SizedBox(
                    width: 250 * fem,
                    height: 20 * fem,
                    child: Text(
                      _userEmail,
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        '',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8 * fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle70AdW (290:25)
                left: 45 * fem,
                top: 115 * fem,
                child: Align(
                  child: SizedBox(
                    width: 150 * fem,
                    height: 20 * fem,
                    child: Text(
                      'BIENVENIDO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Alfa Slab One',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8 * fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70 * fem,
                top: 160 * fem,
                child: Align(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => homemobil()));
                    },
                    child: Align(
                      child: SizedBox(
                        width: 100 * fem,
                        height: 22 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: Color(0xfffff0f0),
                          ),
                          child: Center(
                            child: Text(
                              'COMIENZA',
                              style: SafeGoogleFont(
                                'Alfa Slab One',
                                fontSize: 7 * ffem,
                                fontWeight: FontWeight.w100,
                                color: Color(0x82ea96a0),
                              ),
                            ),
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
      ),
    );
  }

  List<String> images = [
    "img/mobil/carru1.gif",
  ];

  Widget _swiper() {
    return Container(
      color: Colors.transparent,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.11,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }
}
