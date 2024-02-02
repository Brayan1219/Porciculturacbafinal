import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/usuario/home.dart';
import 'package:myapp/utils.dart';
import '../../desktop/usuario/limpio/limpio.dart';
import '../../main.dart';
import 'limpio/limpio.dart';


class notificacion extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(Color.fromRGBO(229, 203, 206, 1).value, <int, Color>{
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/NOTIFICACIONES",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: notifi(),
    );
  }
}

class notifi extends StatefulWidget {
  @override
  State<notifi> createState() => _notifiState();
}

class _notifiState extends State<notifi> {
  List<dynamic> notifica = [];
  List<dynamic> valornoti = [];


  @override
  void initState() {
    super.initState();
    notifi();
    consultarnotificacion();
  }

  void consultarnotificacion() {
    FirebaseFirestore.instance
        .collection('notificaciones')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        notifica.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());

        querySnapshot.docs.forEach((doc) {
          dynamic titulo = doc['titulo'];

          Map<String, dynamic> claveValor = {'titulo': titulo};
          valornoti.add(claveValor);
        });
        print('Lista clave-valor: $valornoti');
      });

    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  width: 768 * fem,
                  height: 405 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 390 * fem,
                            height: 371 * fem,
                            child: Image.asset(
                              'img/mobil/fondoinicio.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 342 * fem,
                        top: 282 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 233 * fem,
                            height: 89 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse2atw (79:52)
                        left: 297 * fem,
                        top: 243 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 102 * fem,
                            height: 94 * fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                              width: 102 * fem,
                              height: 94 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8gwy (79:88)
                        left: 0 * fem,
                        top: 290 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 244 * fem,
                            height: 89 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle6Dwu (79:63)
                        left: 0 * fem,
                        top: 337 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 393 * fem,
                            height: 68 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse3MYK (79:89)
                        left: 0 * fem,
                        top: 243 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 102 * fem,
                            height: 94 * fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                              width: 102 * fem,
                              height: 94 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // revisegKh (79:53)
                        left: 140.5 * fem,
                        top: 35 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 109 * fem,
                            height: 35 * fem,
                            child: Text(
                              'REVISE',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Alfa Slab One',
                                fontSize: 25 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3675 * ffem / fem,
                                letterSpacing: 1 * fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // nofificacionesZeP (79:109)
                        left: 69.5 * fem,
                        top: 69 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 254 * fem,
                            height: 35 * fem,
                            child: Text(
                              'NOFIFICACIONES',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont('Alfa Slab One',
                                  fontSize: 25 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3675 * ffem / fem,
                                  letterSpacing: 1 * fem,
                                  color: Colors.white),
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
                                    builder: (context) => homemobil()));
                          },
                          borderRadius: BorderRadius.circular(50.0),
                          // Personaliza la forma del botón
                          child: Container(
                            width: 42 * fem,
                            height: 42.05 * fem,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'img/mobil/iconadd.png',
                                width: 42 * fem,
                                height: 42.05 * fem,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle539sV (79:101)
                        left: 18 * fem,
                        top: 160 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 357 * fem,
                            height: 460 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30 * fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // cerdito65FM (79:102)
                        left: 72 * fem,
                        top: 112 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 250 * fem,
                            height: 131 * fem,
                            child: Image.asset(
                              'img/mobil/cerdito1.png',
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
                // rectangle54yrX (79:106)
                left: 18 * fem,
                top: 243 * fem,
                child: Align(
                  child: SizedBox(
                    width: 357 * fem,
                    height: 577 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Color(0x3feee6e6),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44 * fem,
                top: 262 * fem,
                child: Align(
                  child: SizedBox(
                    width: 301 * fem,
                    height: 519 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                      child: Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: generateContainers(notifica, fem),
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
    );
  }

  List<Widget> generateContainers(List<dynamic> data, double fem) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    List<Widget> containers = [];
    for (var item in data) {

      containers.add(
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 0 * fem,
            ),
            Container(
              margin: EdgeInsets.only(left: 5* fem),
              width: 280 * fem,
              height: 75 * fem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15 * fem),
                color: Color.fromRGBO(230, 244, 254, 100),),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2* fem,bottom: 2* fem,left: 6*fem),
                    child: Container(
                      width: 60 * fem,
                      height: 65* fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                        color: Colors.white,
                      ),
                      child: Stack(
                        children: [
                          if(item['titulo'] == 'PARTO'||item['titulo'] == 'PARIDERA'||item['titulo'] == 'CELO')
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => registros(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: 50 * fem,
                                  height: 55 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 170),
                                  ),
                                  child: Image.asset(
                                    'img/mobil/pork.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          if(item['titulo'] == 'LIMPIEZA')
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => limpio(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: 50 * fem,
                                  height: 55 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 170),
                                  ),
                                  child: Image.asset(
                                    'img/mobil/limpio.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Container(
                          width: 174 * fem,
                          height: 60 * fem,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                    margin: EdgeInsets.only(top: 8.8* fem, bottom: 2* fem),
                                    child: Center(child: Text('${ item['titulo']}'))),
                                subtitle:
                                Text('Detalle: ${item['mensaje']}',style: TextStyle(fontSize: 9.2 * fem),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    return containers;
  }

}

