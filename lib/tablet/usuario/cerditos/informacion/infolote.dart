import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // infolotemu1 (62:2)
        padding: EdgeInsets.fromLTRB(19*fem, 0*fem, 18*fem, 79*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupakqo6wH (ACtcXsmnJtD67uVQUSakQo)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 29*fem),
              padding: EdgeInsets.fromLTRB(55*fem, 62*fem, 34*fem, 32*fem),
              width: double.infinity,
              height: 320*fem,
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(30*fem),
                image: DecorationImage (
                  fit: BoxFit.cover,
                  image: AssetImage (
                    'assets/tablet/images/rectangle-20-bg.png',
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // iconmenuBC3 (59:477)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 187*fem),
                    width: 57*fem,
                    height: 37*fem,
                    child: Image.asset(
                      'assets/tablet/images/iconmenu-umq.png',
                      width: 57*fem,
                      height: 37*fem,
                    ),
                  ),
                  Container(
                    // autogroup14rvuNw (ACtcgHhRyEM33bxriQ14RV)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 68*fem, 0*fem),
                    width: 617*fem,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroup5qvmmvw (ACtcmNPJHDsgEndG2b5QVM)
                          margin: EdgeInsets.fromLTRB(88.5*fem, 0*fem, 86.5*fem, 53*fem),
                          width: double.infinity,
                          height: 101*fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // informacionWNj (59:482)
                                left: 0*fem,
                                top: 0*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 442*fem,
                                    height: 69*fem,
                                    child: Text(
                                      'INFORMACION',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Alfa Slab One',
                                        fontSize: 50*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3675*ffem/fem,
                                        letterSpacing: 2*fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // loteiDu (59:483)
                                left: 187.5*fem,
                                top: 59*fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 66*fem,
                                    height: 42*fem,
                                    child: Text(
                                      'lote',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Alfa Slab One',
                                        fontSize: 30*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3675*ffem/fem,
                                        letterSpacing: 1.2*fem,
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
                          // autogroup1mvpPaw (ACtcqXw2UAdouRtaBo1MvP)
                          padding: EdgeInsets.fromLTRB(29*fem, 20*fem, 29*fem, 19*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(50*fem),
                          ),
                          child: Align(
                            // iconbuscarKDh (59:469)
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 32*fem,
                              height: 33*fem,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 527*fem, 0*fem),
                                child: Image.asset(
                                  'assets/tablet/images/iconbuscar-rVM.png',
                                  width: 32*fem,
                                  height: 33*fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // iconcampanaD4B (59:473)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 156*fem),
                    width: 52*fem,
                    height: 68*fem,
                    child: Image.asset(
                      'assets/tablet/images/iconcampana-HzX.png',
                      width: 52*fem,
                      height: 68*fem,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogrouppdhhKd1 (ACtd4rt9sb52qV8mtrPDhh)
              margin: EdgeInsets.fromLTRB(18*fem, 0*fem, 0*fem, 0*fem),
              width: 905*fem,
              height: 1046*fem,
              decoration: BoxDecoration (
                color: Color(0xfffff6f6),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // rectangle18EV5 (62:47)
                    left: 37*fem,
                    top: 47*fem,
                    child: Align(
                      child: SizedBox(
                        width: 834*fem,
                        height: 233*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30*fem),
                          child: Image.asset(
                            'assets/tablet/images/rectangle-18-w5Z.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // LHD (62:52)
                    left: 441*fem,
                    top: 163*fem,
                    child: Align(
                      child: SizedBox(
                        width: 303*fem,
                        height: 45*fem,
                        child: Text(
                          '---------\n---------\n------------',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Alfa Slab One',
                            fontSize: 64*ffem,
                            fontWeight: FontWeight.w400,
                            height: 0.234375*ffem/fem,
                            letterSpacing: 2.56*fem,
                            color: Color(0x9effffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // informaQ2B (62:51)
                    left: 453*fem,
                    top: 79*fem,
                    child: Align(
                      child: SizedBox(
                        width: 280*fem,
                        height: 66*fem,
                        child: Text(
                          'INFORMA',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Alfa Slab One',
                            fontSize: 48*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.3675*ffem/fem,
                            letterSpacing: 1.92*fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // porkex7 (62:48)
                    left: 94*fem,
                    top: 66*fem,
                    child: Align(
                      child: SizedBox(
                        width: 225*fem,
                        height: 194*fem,
                        child: Image.asset(
                          'assets/tablet/images/pork-bNf.png',
                          fit: BoxFit.contain,
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
          );
  }
}