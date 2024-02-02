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
        // individual3GK (48:195)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 93*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupi4w3ALw (ACtbhjVLHecXBH7pswi4W3)
              width: double.infinity,
              height: 1213*fem,
              child: Stack(
                children: [
                  Positioned(
                    // group4i7Z (31:273)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      width: 979*fem,
                      height: 601*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // rectangle5C2j (31:274)
                            left: 0*fem,
                            top: 0*fem,
                            child: Align(
                              child: SizedBox(
                                width: 960*fem,
                                height: 558*fem,
                                child: Image.asset(
                                  'assets/tablet/images/rectangle-5-9zF.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // ellipse17fV (31:275)
                            left: 0*fem,
                            top: 457*fem,
                            child: Align(
                              child: SizedBox(
                                width: 150*fem,
                                height: 144*fem,
                                child: Image.asset(
                                  'assets/tablet/images/ellipse-1-h2f.png',
                                  width: 150*fem,
                                  height: 144*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle27DiX (31:276)
                            left: 68*fem,
                            top: 457*fem,
                            child: Align(
                              child: SizedBox(
                                width: 876*fem,
                                height: 144*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // rectangle28KmZ (31:277)
                            left: 885*fem,
                            top: 385*fem,
                            child: Align(
                              child: SizedBox(
                                width: 87*fem,
                                height: 196*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // ellipse2fKd (31:278)
                            left: 810*fem,
                            top: 313*fem,
                            child: Align(
                              child: SizedBox(
                                width: 150*fem,
                                height: 144*fem,
                                child: Image.asset(
                                  'assets/tablet/images/ellipse-2-ZmR.png',
                                  width: 150*fem,
                                  height: 144*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // iconcampanayr7 (31:279)
                            left: 845*fem,
                            top: 35*fem,
                            child: Align(
                              child: SizedBox(
                                width: 79*fem,
                                height: 85*fem,
                                child: Image.asset(
                                  'assets/tablet/images/iconcampana-exX.png',
                                  width: 79*fem,
                                  height: 85*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // iconmenusgb (31:283)
                            left: 68*fem,
                            top: 54*fem,
                            child: Align(
                              child: SizedBox(
                                width: 82*fem,
                                height: 61.28*fem,
                                child: Image.asset(
                                  'assets/tablet/images/iconmenu-r9m.png',
                                  width: 82*fem,
                                  height: 61.28*fem,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            // informacionaL7 (31:288)
                            left: 288.5*fem,
                            top: 54*fem,
                            child: Align(
                              child: SizedBox(
                                width: 424*fem,
                                height: 66*fem,
                                child: Text(
                                  'INFORMACION',
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
                            // informacionfsM (48:222)
                            left: 359*fem,
                            top: 120*fem,
                            child: Align(
                              child: SizedBox(
                                width: 283*fem,
                                height: 44*fem,
                                child: Text(
                                  'INFORMACION',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'Alfa Slab One',
                                    fontSize: 32*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3675*ffem/fem,
                                    letterSpacing: 1.28*fem,
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
                    // rectangle3m9h (48:223)
                    left: 131*fem,
                    top: 346*fem,
                    child: Align(
                      child: SizedBox(
                        width: 698*fem,
                        height: 867*fem,
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
                    // rectangle2737D (48:225)
                    left: 67*fem,
                    top: 529*fem,
                    child: Align(
                      child: SizedBox(
                        width: 826*fem,
                        height: 630*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                            color: Color(0xfffbf4f4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // cerdito5Ahd (48:224)
                    left: 288*fem,
                    top: 166*fem,
                    child: Align(
                      child: SizedBox(
                        width: 435*fem,
                        height: 295*fem,
                        child: Image.asset(
                          'assets/tablet/images/cerdito-5-2bH.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupejvb5pb (ACtbwyabp7pFdsm7jzEJvB)
              margin: EdgeInsets.fromLTRB(73*fem, 0*fem, 61*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(117*fem, 27*fem, 89*fem, 27*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xfffdecec),
                borderRadius: BorderRadius.circular(30*fem),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // rectangle18xdV (48:227)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 136*fem, 0*fem),
                    width: 120*fem,
                    height: 80*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30*fem),
                      child: Image.asset(
                        'assets/tablet/images/rectangle-18-DPV.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    // rectangle294Rd (48:228)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 124*fem, 0*fem),
                    width: 120*fem,
                    height: 80*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30*fem),
                      child: Image.asset(
                        'assets/tablet/images/rectangle-29-32P.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    // rectangle30PTu (48:229)
                    width: 120*fem,
                    height: 80*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30*fem),
                      child: Image.asset(
                        'assets/tablet/images/rectangle-30-NAj.png',
                        fit: BoxFit.cover,
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