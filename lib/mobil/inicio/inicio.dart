import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/inicio/registro.dart';
import 'package:myapp/mobil/inicio/sesion.dart';
import 'package:myapp/utils.dart';

import '../../tablet/usuario/home.dart';

class inicio_mobil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/INICIO",
      theme: ThemeData(
      ),
      home: iniapp(),
    );
  }
}

class iniapp extends StatefulWidget {
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
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0*fem, 47*fem, 0*fem, 0*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              image: DecorationImage (
                fit: BoxFit.cover,
                image: AssetImage (
                  'img/mobil/fondoinicio.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(36*fem, 0*fem, 34*fem, 0*fem),
                  width: double.infinity,
                  height: 90*fem,
                 // color: Colors.teal,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 320*fem,
                            height: 48*fem,
                            child: Text(
                              'PORCICULTURA',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Alfa Slab One',
                                fontSize: 35*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3675*ffem/fem,
                                letterSpacing: 1.4*fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 99.5*fem,
                        top: 42*fem,
                        child: Align(
                          child: SizedBox(
                            width: 116*fem,
                            height: 48*fem,
                            child: Text(
                              'SENA',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Alfa Slab One',
                                fontSize: 35*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3675*ffem/fem,
                                letterSpacing: 1.4*fem,
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
                  height: 707*fem,
                //  color: Colors.pink,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0*fem,
                        top: 355*fem,
                        child: Align(
                          child: SizedBox(
                            width: 390*fem,
                            height: 355*fem,
                            child: Container(
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle17D9 (2:11)
                        left: 0*fem,
                        top: 335*fem,
                        child: Align(
                          child: SizedBox(
                            width: 390*fem,
                            height: 384*fem,
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
                        left: 36*fem,
                        top: 288*fem,
                        child: Align(
                          child: SizedBox(
                            width: 319*fem,
                            height: 356*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(50*fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0*fem,
                        top: 670*fem,
                        child: Align(
                          child: SizedBox(
                            width: 390*fem,
                            height: 2*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xb2eebbbb),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 85*fem,
                        top: 509*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registro_mobil()));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(46*fem, 14*fem, 54.5*fem, 17.02*fem),
                            width: 221*fem,
                            height: 49*fem,
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
                                  margin: EdgeInsets.fromLTRB(0*fem, 1.02*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'REGISTRARME',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Alice',
                                      fontSize: 13*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.145*ffem/fem,
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
                        left: 85*fem,
                        top: 414*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sesion_mobil()));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 221*fem,
                            height: 49*fem,
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
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 72.5*fem,
                                  top: 18*fem,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => sesion_mobil()));
                                    },
                                    child: Align(
                                      child: SizedBox(
                                        width: 101 * fem,
                                        height: 15 * fem,
                                        child: Text(
                                          'INICIAR SESION',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Alice',
                                            fontSize: 13 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.145 * ffem / fem,
                                            letterSpacing: 0.26 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 52*fem,
                                  top: 16*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 13.79*fem,
                                      height: 16.05*fem,
                                      child: Image.asset(
                                        'img/mobil/icono.png',
                                        width: 13.79*fem,
                                        height: 16.05*fem,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 78*fem,
                        top: 644*fem,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registro_mobil()));
                          },
                          child: Align(
                            child: SizedBox(
                              width: 132 * fem,
                              height: 12 * fem,
                              child: Text(
                                'NO TENGO UNA CUENTA !',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.115 * ffem / fem,
                                  letterSpacing: 0.4 * fem,
                                  color: Color(0xffea96a0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 230.5*fem,
                        top: 644*fem,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => sesion_mobil()));
                          },
                          child: Align(
                            child: SizedBox(
                              width: 83 * fem,
                              height: 12 * fem,
                              child: Text(
                                'INICIAR SESION',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.115 * ffem / fem,
                                  letterSpacing: 0.4 * fem,
                                  color: Color(0xffea96a0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2*fem,
                        top: 115 *fem,
                        child: Align(
                          child: SizedBox(
                            width: 440*fem,
                            height: 248*fem,
                            child: Image.asset(
                              'img/desktop/inic.gif',
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
      ),
    );
  }
}

