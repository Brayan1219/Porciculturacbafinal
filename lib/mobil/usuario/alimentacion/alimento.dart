import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import '../home.dart';

class alimento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ALIMENTACION",
      theme: ThemeData(
      ),
      home: alimenapp(),
    );
  }
}

class alimenapp extends StatefulWidget {
  @override
  State<alimenapp> createState() => _alimenappState();
}

class _alimenappState extends State<alimenapp> {
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
            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 118*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 47*fem),
                  width: 575*fem,
                  height: 188*fem,
                  child: Stack(
                    children: [
                      Positioned(
                          left: 0*fem,
                          top: 0*fem,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(25*fem, 0*fem, 0*fem, 0*fem),
                            width: 575*fem,
                            height: 125*fem,
                            decoration: BoxDecoration (
                              image: DecorationImage (
                                fit: BoxFit.cover,
                                image: AssetImage (
                                  'img/mobil/fondoinicio.png',
                                ),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 50),
                                  child: Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => homemobil()));
                                      },
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Container(
                                        width: 30 * fem,
                                        height: 30.05 * fem,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'img/mobil/flecha.png',
                                            width: 42 * fem,
                                            height: 22.05 * fem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(65*fem, 0*fem, 58*fem, 40*fem),
                                  child: Text(
                                    'ALIMENTO',
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
                              ],
                            ),
                          )
                      ),
                      Positioned(
                        left: 0*fem,
                        top: 74*fem,
                        child: Align(
                          child: SizedBox(
                            width: 102*fem,
                            height: 94*fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                              width: 102*fem,
                              height: 94*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
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
                    ],
                  ),
                ),
                Container(
                  width: 390*fem,
                  height: 511*fem,
                  child: Image.asset(
                    'img/mobil/construccion.gif',
                    fit: BoxFit.cover,
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
