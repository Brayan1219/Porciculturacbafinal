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
        // gananciafSP (59:690)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // autogroupodcbCx7 (ACtLCvoy5qo7cDbduQoDcB)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 230*fem, 0*fem),
              width: 575*fem,
              height: 846*fem,
              child: Stack(
                children: [
                  Positioned(
                    // materialappvNK (59:691)
                    left: 0*fem,
                    top: 0*fem,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25*fem, 0*fem, 0*fem, 0*fem),
                      width: 575*fem,
                      height: 141*fem,
                      decoration: BoxDecoration (
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/mobil/images/rectangle-5-bg-Wgo.png',
                          ),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // iconmenuQ2b (59:695)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 62.3*fem, 40.72*fem),
                            width: 25.7*fem,
                            height: 14.28*fem,
                            child: Image.asset(
                              'assets/mobil/images/iconmenu-jRy.png',
                              width: 25.7*fem,
                              height: 14.28*fem,
                            ),
                          ),
                          Container(
                            // gananciaiJB (59:704)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 36*fem),
                            child: Text(
                              'GANANCIA',
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
                          Container(
                            // autogroupqfyyCj9 (ACtLSb5sd6h4uvd9JeQfyy)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                            width: 284*fem,
                            height: 132*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // rectangle7vQF (59:693)
                                  left: 51*fem,
                                  top: 23*fem,
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
                                  // ellipse2rHu (59:694)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 102*fem,
                                      height: 94*fem,
                                      child: Image.asset(
                                        'assets/mobil/images/ellipse-2-ntF.png',
                                        width: 102*fem,
                                        height: 94*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // iconcampanaAZV (59:700)
                                  left: 51*fem,
                                  top: 13*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 25.7*fem,
                                      height: 35.74*fem,
                                      child: Image.asset(
                                        'assets/mobil/images/iconcampana-sT5.png',
                                        width: 25.7*fem,
                                        height: 35.74*fem,
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
                  Positioned(
                    // ellipse1ezT (59:720)
                    left: 0*fem,
                    top: 74*fem,
                    child: Align(
                      child: SizedBox(
                        width: 102*fem,
                        height: 94*fem,
                        child: Image.asset(
                          'assets/mobil/images/ellipse-1-FZq.png',
                          width: 102*fem,
                          height: 94*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle6NfZ (59:721)
                    left: 51*fem,
                    top: 74*fem,
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
                    // rectangle8gw9 (59:722)
                    left: 75*fem,
                    top: 92*fem,
                    child: Align(
                      child: SizedBox(
                        width: 246*fem,
                        height: 32*fem,
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
                    // rectangle15p1m (59:723)
                    left: 17*fem,
                    top: 145*fem,
                    child: Align(
                      child: SizedBox(
                        width: 356*fem,
                        height: 681*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            color: Color(0xfffff6f6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle188YF (59:724)
                    left: 33*fem,
                    top: 167*fem,
                    child: Align(
                      child: SizedBox(
                        width: 317*fem,
                        height: 117*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30*fem),
                            child: Image.asset(
                              'assets/mobil/images/rectangle-18-ghM.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // lotedE7 (59:726)
                    left: 92*fem,
                    top: 172*fem,
                    child: Align(
                      child: SizedBox(
                        width: 55*fem,
                        height: 35*fem,
                        child: Text(
                          'lote',
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
                    // KMq (59:727)
                    left: 74*fem,
                    top: 206*fem,
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
                    // iconbuscarCwR (59:728)
                    left: 85*fem,
                    top: 100*fem,
                    child: Align(
                      child: SizedBox(
                        width: 17*fem,
                        height: 16*fem,
                        child: Image.asset(
                          'assets/mobil/images/iconbuscar.png',
                          width: 17*fem,
                          height: 16*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // rectangle7XTu (59:719)
              margin: EdgeInsets.fromLTRB(0*fem, 128*fem, 0*fem, 0*fem),
              width: 233*fem,
              height: 89*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
            ),
          ],
        ),
      ),
          );
  }
}