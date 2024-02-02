import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/desktop/usuario/alimentacion/pesoganancias.dart';
import 'package:myapp/utils.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../home.dart';
import 'alimeform.dart';
import 'alimentolechones.dart';
import 'alimentover.dart';
import 'areagestacion.dart';
import 'areapartos.dart';
import 'machoreproductor.dart';

class alimento_desk extends StatelessWidget {
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
      title: "PORCI/ALIMENTACION",
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

  bool botoninventario = false;
  bool imagen = false;
  bool botonregis= false;
  bool botonpeso = false;
  bool boton = false;
  bool boton1 = false;
  bool boton2 = false;
  bool boton3 = false;
  bool boton4 = false;
  bool boton5 = false;
  bool boton6 = false;

  @override
  void initState() {
    super.initState();
  }



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
              left: 50 * fem,
              child: Container(
                width: 140 * fem,
                height: 150 * fem,
                decoration: BoxDecoration(
                  //   color: Colors.pink,
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: manejopantallas(),
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
                                top:  15*fem,
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
                                        fontSize:  10.8*ffem,
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
                                top:  26*fem,
                                child:
                                Align(
                                  child:
                                  SizedBox(
                                    width:  39*fem,
                                    height:  10*fem,
                                    child:
                                    Text(
                                      'Alimentacion',
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
                                             // color: Colors.teal
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
                                top:  39*fem,
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
                                              Container(
                                                margin: EdgeInsets.only(top: 5 * fem, left: 9 * fem, right: 4 * fem),
                                               width: 26 * fem,
                                                height: 26 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5 * fem),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      //botoninventario = true;
                                                      botoninventario = !botoninventario;
                                                      botonregis = false;
                                                      botonpeso = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 26 * fem,
                                                    height: 26 * fem,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5 * fem),
                                                      color: botoninventario
                                                          ? Color.fromRGBO(98, 161, 145, 170)
                                                          : Color.fromRGBO(242, 215, 215, 5),
                                                    ),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 60 * fem,
                                                        height: 60 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/corazon.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5 * fem, right: 4 * fem),
                                                width: 26 * fem,
                                                height: 26 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5 * fem),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      //botonregis = true;
                                                      botonregis = !botonregis;
                                                      botoninventario = false;
                                                      botonpeso = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 26 * fem,
                                                    height: 26 * fem,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5 * fem),
                                                      color: botonregis
                                                          ? Color.fromRGBO(98, 161, 145, 170)
                                                          : Color.fromRGBO(242, 215, 215, 5),
                                                    ),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 60 * fem,
                                                        height: 60 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/corazon.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5 * fem, right: 4 * fem),
                                                width: 26 * fem,
                                                height: 26 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5 * fem),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      //botonpeso = true;
                                                      botonpeso = !botonpeso;
                                                      botonregis = false;
                                                      botoninventario = false;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 26 * fem,
                                                    height: 26 * fem,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5 * fem),
                                                      color: botonpeso
                                                          ? Color.fromRGBO(98, 161, 145, 170)
                                                          : Color.fromRGBO(242, 215, 215, 5),
                                                    ),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 60 * fem,
                                                        height: 60 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/corazon.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              if (botoninventario)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem),
                                                  child: Tooltip(
                                                    message: 'INVENTARIO',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                        boton = !boton;
                                                        manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if(botoninventario)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem,left: 4*fem),
                                                  child: Tooltip(
                                                    message: 'CONSULTA',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton1 = !boton1;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (botonregis)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem),
                                                  child: Tooltip(
                                                    message: 'AREA PARTOS',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton2 = !boton2;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (botonregis)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem,left: 8*fem),
                                                  child: Tooltip(
                                                    message: 'AREA GESTACION',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton3 = !boton3;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (botonregis)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem,left: 8*fem),
                                                  child: Tooltip(
                                                    message: 'MACHO REPRODUCTOR',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton4 = !boton4;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (botonregis)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem,left: 8*fem),
                                                  child: Tooltip(
                                                    message: 'ALIMENTO LECHONES',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton5 = !boton5;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (botonpeso)
                                                Container(
                                                  margin: EdgeInsets.only(top: 5* fem,left: 8*fem),
                                                  child: Tooltip(
                                                    message: 'PESO',
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          boton6 = !boton6;
                                                          manejopantallas();
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 16 * fem,
                                                        height: 11 * fem,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(2 * fem),
                                                            color: Color.fromRGBO(
                                                                73, 187, 217, 150)),
                                                        child: Center(
                                                          // porkSQo (15:110)
                                                          child: SizedBox(
                                                            width: 10 * fem,
                                                            height: 10 * fem,
                                                            child: Image.asset(
                                                              'img/mobil/datos.png',
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
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

  manejopantallas(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;


    return Stack(
      children: [
        if (imagen == false)
          Container(
            width: 140 * fem,
            height: 150 * fem,
            child: Image.asset(
              'img/desktop/PORCI33.gif',
              fit: BoxFit.cover,
            ),
          ),
        if (boton)
          Container(
            child: formu1alimento_desk(),
          ),
        if(boton1)
          Container(
            child: veralimento_desk(),
          ),
        if (boton2)
          Container(
            child: areapartos_desk(),
          ),
        if (boton3)
          Container(
            child: areagestacion_desk(),
          ),
        if (boton4)
          Container(
            child: areamacho_desk(),
          ),
        if (boton5)
          Container(
            child: arealechones_desk(),
          ),
        if (boton6)
          Container(
            child: pesoganancias_desk(),
          ),
      ],
    );
  }

}