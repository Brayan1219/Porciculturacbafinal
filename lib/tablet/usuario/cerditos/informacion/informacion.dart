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
        // informacionBqq (47:164)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 67*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group45gK (47:165)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 66*fem),
              width: double.infinity,
              height: 301*fem,
              child: Stack(
                children: [
                  Positioned(
                    // rectangle5bef (47:166)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 960*fem,
                        height: 231*fem,
                        child: Image.asset(
                          'assets/tablet/images/rectangle-5-45d.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse1HnP (47:167)
                    left: 0*fem,
                    top: 157*fem,
                    child: Align(
                      child: SizedBox(
                        width: 150*fem,
                        height: 144*fem,
                        child: Image.asset(
                          'assets/tablet/images/ellipse-1-ks9.png',
                          width: 150*fem,
                          height: 144*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle27Qs1 (47:168)
                    left: 84*fem,
                    top: 157*fem,
                    child: Align(
                      child: SizedBox(
                        width: 876*fem,
                        height: 90*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle28Lkf (47:169)
                    left: 878*fem,
                    top: 88*fem,
                    child: Align(
                      child: SizedBox(
                        width: 82*fem,
                        height: 69*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse24Rm (47:170)
                    left: 810*fem,
                    top: 13*fem,
                    child: Align(
                      child: SizedBox(
                        width: 150*fem,
                        height: 144*fem,
                        child: Image.asset(
                          'assets/tablet/images/ellipse-2-847.png',
                          width: 150*fem,
                          height: 144*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconcampana8gX (47:171)
                    left: 845*fem,
                    top: 35*fem,
                    child: Align(
                      child: SizedBox(
                        width: 79*fem,
                        height: 85*fem,
                        child: Image.asset(
                          'assets/tablet/images/iconcampana-d7M.png',
                          width: 79*fem,
                          height: 85*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconmenuDT5 (47:175)
                    left: 68*fem,
                    top: 54*fem,
                    child: Align(
                      child: SizedBox(
                        width: 82*fem,
                        height: 61.28*fem,
                        child: Image.asset(
                          'assets/tablet/images/iconmenu-vVD.png',
                          width: 82*fem,
                          height: 61.28*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // informacion8K9 (47:180)
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
                    // rectangle18byR (47:185)
                    left: 122*fem,
                    top: 214*fem,
                    child: Align(
                      child: SizedBox(
                        width: 723*fem,
                        height: 87*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20*fem),
                            color: Color(0x4cd9d9d9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // iconbuscarJN3 (47:186)
                    left: 150*fem,
                    top: 238*fem,
                    child: Align(
                      child: SizedBox(
                        width: 54*fem,
                        height: 39*fem,
                        child: Image.asset(
                          'assets/tablet/images/iconbuscar-ies.png',
                          width: 54*fem,
                          height: 39*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogrouph9vzRSf (ACtbEq6VdRu2XvnwhCH9VZ)
              margin: EdgeInsets.fromLTRB(52*fem, 0*fem, 52*fem, 0*fem),
              width: double.infinity,
              height: 1006*fem,
              decoration: BoxDecoration (
                color: Color(0xfffff6f6),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // rectangle18veK (47:191)
                    left: 37*fem,
                    top: 44*fem,
                    child: Align(
                      child: SizedBox(
                        width: 782*fem,
                        height: 233*fem,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30*fem),
                          child: Image.asset(
                            'assets/tablet/images/rectangle-18-FjM.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // CLw (47:194)
                    left: 418*fem,
                    top: 160*fem,
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
                    // informaeCw (47:193)
                    left: 430*fem,
                    top: 63*fem,
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
                    // porkkFy (47:192)
                    left: 70*fem,
                    top: 63*fem,
                    child: Align(
                      child: SizedBox(
                        width: 225*fem,
                        height: 194*fem,
                        child: Image.asset(
                          'assets/tablet/images/pork-TFu.png',
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