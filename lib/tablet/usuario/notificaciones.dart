import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

import 'home.dart';

class notifi_tablet extends StatelessWidget {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "NOTIFICACIONES",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: noti(),
    );
  }
}

class noti extends StatefulWidget {
  const noti({super.key});

  @override
  State<noti> createState() => _notiState();
}

class _notiState extends State<noti> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 1440*fem,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0*fem,
                  top: 0*fem,
                  child: Container(
                    width: 961*fem,
                    height: 1023*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 960*fem,
                              height: 510*fem,
                              child: Image.asset(
                                'img/tablet/fondo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 811*fem,
                          top: 440*fem,
                          child: Align(
                            child: SizedBox(
                              width: 150*fem,
                              height: 144*fem,
                              child: Image.asset(
                                'img/tablet/circulo.png',
                                width: 150*fem,
                                height: 144*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0*fem,
                          top: 440*fem,
                          child: Align(
                            child: SizedBox(
                              width: 150*fem,
                              height: 144*fem,
                              child: Image.asset(
                                'img/tablet/circulo.png',
                                width: 150*fem,
                                height: 144*fem,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 60*fem,
                          top: 310*fem,
                          child: Align(
                            child: SizedBox(
                              width: 840*fem,
                              height: 700*fem,
                              child: Container(
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(30*fem),
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 327.5*fem,
                          top: 38*fem,
                          child: Align(
                            child: SizedBox(
                              width: 305*fem,
                              height: 96*fem,
                              child: Text(
                                'REVISE',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Alfa Slab One',
                                  fontSize: 70*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3675*ffem/fem,
                                  letterSpacing: 2.8*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 172.5*fem,
                          top: 111*fem,
                          child: Align(
                            child: SizedBox(
                              width: 619*fem,
                              height: 83*fem,
                              child: Text(
                                'NOTIFICACIONES',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Alfa Slab One',
                                  fontSize: 60*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3675*ffem/fem,
                                  letterSpacing: 2.4*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => hometablet()));
                            },
                            borderRadius: BorderRadius.circular(50.0),
                            child: Container(
                              width: 70 * fem,
                              height: 70.05 * fem,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'img/mobil/iconadd.png',
                                  width: 70 * fem,
                                  height: 70.05 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 276*fem,
                          top: 193*fem,
                          child: Align(
                            child: SizedBox(
                              width: 415*fem,
                              height: 285*fem,
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
                ),
                Positioned(
                  left: 82*fem,
                  top: 461*fem,
                  child: Align(
                    child: SizedBox(
                      width: 804*fem,
                      height: 938*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          //color: Color(0x3feee6e6),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 160*fem,
                  top: 505*fem,
                  child: Align(
                    child: SizedBox(
                      width: 640*fem,
                      height: 168*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(30*fem),
                         // color: Color(0xfffbe5e5),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(top: 90),
                          child: Text(
                            'Aun no tiene notificaciones!',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              '',
                              fontSize: 25 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.3675 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Colors.black26,
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
      ),
    );
  }
}

