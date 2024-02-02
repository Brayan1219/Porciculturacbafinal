import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // gananindividualKRq (59:732)
        width: double.infinity,
        height: 844*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // materialappEYo (59:733)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 572*fem,
                height: 636*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // rectangle5xDu (59:734)
                      left: 0*fem,
                      top: 0*fem,
                      child: Align(
                        child: SizedBox(
                          width: 390*fem,
                          height: 277*fem,
                          child: Image.asset(
                            'assets/mobil/images/rectangle-5-qD9.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // ellipse1Mmq (59:735)
                      left: 0*fem,
                      top: 225*fem,
                      child: Align(
                        child: SizedBox(
                          width: 102*fem,
                          height: 94*fem,
                          child: Image.asset(
                            'assets/mobil/images/ellipse-1-sGT.png',
                            width: 102*fem,
                            height: 94*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle6rib (59:736)
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
                      // rectangle7mqZ (59:737)
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
                      // ellipse2hDR (59:738)
                      left: 295*fem,
                      top: 131*fem,
                      child: Align(
                        child: SizedBox(
                          width: 102*fem,
                          height: 94*fem,
                          child: Image.asset(
                            'assets/mobil/images/ellipse-2-qAf.png',
                            width: 102*fem,
                            height: 94*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // informacionR9R (59:739)
                      left: 84.5*fem,
                      top: 14*fem,
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
                      // informacionUtP (59:740)
                      left: 150.5*fem,
                      top: 48*fem,
                      child: Align(
                        child: SizedBox(
                          width: 89*fem,
                          height: 14*fem,
                          child: Text(
                            'INFORMACION',
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
                        ),
                      ),
                    ),
                    Positioned(
                      // iconcampanaBH1 (59:741)
                      left: 333*fem,
                      top: 11*fem,
                      child: Align(
                        child: SizedBox(
                          width: 25.7*fem,
                          height: 35.74*fem,
                          child: Image.asset(
                            'assets/mobil/images/iconcampana-E47.png',
                            width: 25.7*fem,
                            height: 35.74*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // iconmenu5NP (59:745)
                      left: 25*fem,
                      top: 22*fem,
                      child: Align(
                        child: SizedBox(
                          width: 25.7*fem,
                          height: 14.28*fem,
                          child: Image.asset(
                            'assets/mobil/images/iconmenu-SWj.png',
                            width: 25.7*fem,
                            height: 14.28*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle24yCs (59:750)
                      left: 38*fem,
                      top: 96*fem,
                      child: Align(
                        child: SizedBox(
                          width: 313*fem,
                          height: 540*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(30*fem),
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
              // rectangle27gNB (59:752)
              left: 38*fem,
              top: 259*fem,
              child: Align(
                child: SizedBox(
                  width: 312*fem,
                  height: 565*fem,
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
              // graficwithredlineBpj (59:787)
              left: 62*fem,
              top: 86*fem,
              child: Align(
                child: SizedBox(
                  width: 263.25*fem,
                  height: 173.26*fem,
                  child: Image.asset(
                    'assets/mobil/images/grafic-with-red-line.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle19JeT (59:788)
              left: 50*fem,
              top: 279*fem,
              child: Align(
                child: SizedBox(
                  width: 283*fem,
                  height: 87*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30*fem),
                      child: Image.asset(
                        'assets/mobil/images/rectangle-19.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle28CE3 (59:791)
              left: 46*fem,
              top: 385*fem,
              child: Align(
                child: SizedBox(
                  width: 283*fem,
                  height: 87*fem,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30*fem),
                      child: Image.asset(
                        'assets/mobil/images/rectangle-28.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // porkVyq (59:789)
              left: 69*fem,
              top: 277*fem,
              child: Align(
                child: SizedBox(
                  width: 90*fem,
                  height: 90*fem,
                  child: Image.asset(
                    'assets/mobil/images/pork-dao.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              // porkS8P (59:792)
              left: 69*fem,
              top: 382*fem,
              child: Align(
                child: SizedBox(
                  width: 90*fem,
                  height: 90*fem,
                  child: Image.asset(
                    'assets/mobil/images/pork-LYP.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              // Aq5 (59:790)
              left: 196*fem,
              top: 293*fem,
              child: Align(
                child: SizedBox(
                  width: 97*fem,
                  height: 60*fem,
                  child: Text(
                    '---------\n---------\n------------',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Alfa Slab One',
                      fontSize: 25*ffem,
                      fontWeight: FontWeight.w400,
                      height: 0.6*ffem/fem,
                      letterSpacing: 1*fem,
                      color: Color(0x9effffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // GNK (59:793)
              left: 196*fem,
              top: 397*fem,
              child: Align(
                child: SizedBox(
                  width: 97*fem,
                  height: 60*fem,
                  child: Text(
                    '---------\n---------\n------------',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Alfa Slab One',
                      fontSize: 25*ffem,
                      fontWeight: FontWeight.w400,
                      height: 0.6*ffem/fem,
                      letterSpacing: 1*fem,
                      color: Color(0x9effffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}