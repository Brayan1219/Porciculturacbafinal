import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/tablet/inicio/registro.dart';
import 'package:myapp/tablet/inicio/sesion.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

import '../usuario/home.dart';

class inicio_tablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "INICIO",
      theme: ThemeData(),
      home: iniapp(),
    );
  }
}

class iniapp extends StatefulWidget {
  const iniapp({super.key});

  @override
  State<iniapp> createState() => _iniappState();
}

class _iniappState extends State<iniapp> {
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
          padding: EdgeInsets.fromLTRB(0 * fem, 30 * fem, 0 * fem, 0 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'img/tablet/fondoinicio.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 10* fem, 0 * fem),
                width: double.infinity,
                height: 120 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      child: Align(
                        child: SizedBox(
                          width: 585 * fem,
                          height: 70 * fem,
                          child: Text(
                            'PORCICULTURA',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Alfa Slab One',
                              fontSize: 34 * ffem,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.56 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 80 * fem,
                      top: 65 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 211 * fem,
                          height: 70 * fem,
                          child: Text(
                            'SENA',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Alfa Slab One',
                              fontSize: 34 * ffem,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2.56 * fem,
                              color: Color(0xffffffff),
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
                height: 408 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      top: 142 * fem,
                      child: Container(
                        width: 400 * fem,
                        height: 300 * fem,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 50 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 390 * fem,
                                  height: 717 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(30 * fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 340 * fem,
                                  height: 200 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(50 * fem),
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 0*fem,
                              top: 255*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 390*fem,
                                  height: 1.5*fem,
                                  child: Container(
                                    decoration: BoxDecoration (
                                      color: Color(0xb2eebbbb),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 70 * fem,
                              top: 240 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 150 * fem,
                                  height: 28 * fem,
                                  child: Text(
                                    'NO TENGO UNA CUENTA !',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Almarai',
                                      fontSize: 7 * ffem,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xffea96a0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 160 * fem,
                              top: 240 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 206 * fem,
                                  height: 28 * fem,
                                  child: Text(
                                    'INICIAR SESION',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      'Almarai',
                                      fontSize: 7 * ffem,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1 * fem,
                                      color: Color(0xffea96a0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 80*fem,
                              top: 70*fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => sesiontablet()));
                                 // builder: (context) => hometablet()));
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(46*fem, 14*fem, 54.5*fem, 17.02*fem),
                                  width: 220*fem,
                                  height: 45*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xfff5c7c6),
                                    borderRadius: BorderRadius.circular(20*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*fem, 4*fem),
                                        blurRadius: 2*fem,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.8,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.7*fem, 0*fem),
                                          width: 16.8*fem,
                                          height: 17.98*fem,
                                          child: Image.asset(
                                            'img/mobil/icono.png',
                                            width: 16.8*fem,
                                            height: 17.98*fem,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // registrarmeCJT (2:21)
                                        margin: EdgeInsets.fromLTRB(10*fem, 1.02*fem, 0*fem, 0*fem),
                                        child: Text(
                                          'INICIAR SESION',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Alice',
                                            fontSize: 10*ffem,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.26*fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 80*fem,
                              top: 140*fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => registablet()));
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(46*fem, 14*fem, 54.5*fem, 17.02*fem),
                                  width: 220*fem,
                                  height: 45*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xfff5c7c6),
                                    borderRadius: BorderRadius.circular(20*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*fem, 4*fem),
                                        blurRadius: 2*fem,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.8,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10.7*fem, 0*fem),
                                          width: 16.8*fem,
                                          height: 17.98*fem,
                                          child: Image.asset(
                                            'img/mobil/iconopersona.png',
                                            width: 16.8*fem,
                                            height: 17.98*fem,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // registrarmeCJT (2:21)
                                        margin: EdgeInsets.fromLTRB(10*fem, 1.02*fem, 0*fem, 0*fem),
                                        child: Text(
                                          'REGISTRARME',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Alice',
                                            fontSize: 10*ffem,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.26*fem,
                                            color: Color(0xff000000),
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
                    ),
                    Positioned(
                      left: 85 * fem,
                      top: 70 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 220 * fem,
                          height: 120 * fem,
                          child: Image.asset(
                            'img/tablet/cerdito.png',
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
    )
    );
  }
}
