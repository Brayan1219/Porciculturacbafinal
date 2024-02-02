import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart';
import 'package:myapp/desktop/usuario/salud/salud.dart';
import 'package:myapp/mobil/widgets/drawer.dart';
import 'package:myapp/services/notifica_service.dart';
import '../../pdf.dart';
import '../../tablet/widgets/graficas/grafica_home.dart';
import '../../utils.dart';
import 'alimentacion/alimento.dart';
import 'cerditos/informacion/informacion.dart';
import 'cerditos/informacion/lotes.dart';
import 'cerditos/registros/registros.dart';
import 'limpio/limpio.dart';
import 'package:myapp/services/firebase_service.dart';

class home_desk extends StatelessWidget {
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
      themeMode: ThemeMode.light,
      title: "HOME",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final FirebaseService firebaseService = FirebaseService();
  String _userEmail = 'Cargando...';
  List<dynamic> notifica = [];
  List<dynamic> valornoti = [];

  bool botonescerdito = false;
  bool botonessalud = false;
  bool botonesalimento = false;
  bool botoneslimpio = false;
  bool botoncontrol = false;
  int sumaDestetados = 0;

  @override
  void initState() {
    super.initState();
    getUserEmail();
    notifi();
    consultarnotificacion();
    sumarDestetados();
  }

  Future<void> getUserEmail() async {
    String? userEmail = await firebaseService.getUserEmail();

    setState(() {
      _userEmail = userEmail ?? 'Correo no disponible';
    });
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

  Future<int> sumarDestetados() async {
    CollectionReference hojaDeVidaCollection =
    FirebaseFirestore.instance.collection('hoja_devida');

    QuerySnapshot snapshot = await hojaDeVidaCollection.get();

    snapshot.docs.forEach((DocumentSnapshot document) {
      int destetados = (document.data() as Map<String, dynamic>?)?['destetados'] as int? ?? 0;

      sumaDestetados += destetados;
    });

    return sumaDestetados;
  }

  final CollectionReference machosCollection = FirebaseFirestore.instance.collection('registro_macho');
  final CollectionReference hembrasCollection = FirebaseFirestore.instance.collection('registro_hembra');

  Future<int> getCountMachos() async {
  QuerySnapshot snapshot = await machosCollection.get();
  return snapshot.size;
  }

  Future<int> getCountHembras() async {
  QuerySnapshot snapshot = await hembrasCollection.get();
  return snapshot.size;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: 832 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding:
                EdgeInsets.fromLTRB(48 * fem, 0 * fem, 48 * fem, 0 * fem),
                width: 1280 * fem,
                height: 45 * fem,
                decoration: BoxDecoration(
                  color:  Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 14 * fem, 25 * fem, 0 * fem),
                      width: 20 * fem,
                      height: 20 * fem,
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(Icons.menu,color: Color(0xa062a191),size: 25 * fem),
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 14 * fem, 600 * fem, 0 * fem),
                      child: Text(
                        'PORCICULTURA',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Alfa Slab One',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.8 * fem,
                          color: Color(0xfff8d8d8),
                        ),
                      ),
                    ),
                    Container(
                      //color: Colors.blue,
                      margin: EdgeInsets.fromLTRB(
                          5 * fem, 12 * fem, 0 * fem, 0 * fem),
                      width: 30 * fem,
                      height: 20 * fem,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _openNotificationsDrawer(context);
                          });
                        },
                        child: Icon(Icons.notifications_rounded,color: Color(0xff62a191),size: 25 * fem),
                      ),
                    ),
                    Container(
                      //color: Colors.purple,
                        width: 57 * fem,
                        height: 95 * fem,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            width: 40 * fem,
                            height: 40 * fem,
                            child: Image.asset(
                              'img/desktop/logo2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              // rectangle8h5h (208:73)
              left: 112 * fem,
              top: 75 * fem,
              child: Align(
                child: SizedBox(
                  width: 730 * fem,
                  height: 212 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Color(0xfffff0f0),
                    ),
                    child: _swiper(),
                  ),
                ),
              ),
            ),
            Positioned(
              //menu -----------------------------------------------------------
              left: 100 * fem,
              top: 90 * fem,
              child: Container(
                //color: Colors.purple,
                width: 130 * fem,
                height: 370 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2 * fem),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            //botonessalud = true;
                            botonessalud = !botonessalud;
                            botoneslimpio = false;
                            botonescerdito = false;
                            botonesalimento = false;
                          });
                        },
                        child: Container(
                          width: 90 * fem,
                          height: 75 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: botonessalud
                                ? Color.fromRGBO(98, 161, 145, 170)
                                : Color.fromRGBO(242, 215, 215, 5),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 60 * fem,
                              height: 60 * fem,
                              child: Image.asset(
                                'img/mobil/corazon.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15 * fem),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            botonessalud = false;
                            botonesalimento = !botonesalimento;
                            botoneslimpio = false;
                            botonescerdito = false;
                            //botonesalimento = true;
                          });
                        },
                        child: Container(
                          width: 90 * fem,
                          height: 75 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: botonesalimento
                                ? Color.fromRGBO(98, 161, 145, 170)
                                : Color.fromRGBO(242, 215, 215, 5),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 60 * fem,
                              height: 60 * fem,
                              child: Image.asset(
                                'img/mobil/alimento.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15 * fem),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            botonessalud = false;
                            botoneslimpio = !botoneslimpio;
                            //botoneslimpio = true;
                            botonescerdito = false;
                            botonesalimento = false;
                          });
                        },
                        child: Container(
                          width: 90 * fem,
                          height: 75 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: botoneslimpio
                                ? Color.fromRGBO(98, 161, 145, 170)
                                : Color.fromRGBO(242, 215, 215, 5),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 60 * fem,
                              height: 60 * fem,
                              child: Image.asset(
                                'img/mobil/limpio.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15 * fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30 * fem),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            botonessalud = false;
                            botonescerdito = !botonescerdito;
                            botoneslimpio = false;
                            //botonescerdito = true;
                            botonesalimento = false;
                          });
                        },
                        child: Container(
                          width: 90 * fem,
                          height: 75 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: botonescerdito
                                ? Color.fromRGBO(98, 161, 145, 170)
                                : Color.fromRGBO(242, 215, 215, 5),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 60 * fem,
                              height: 60 * fem,
                              child: Image.asset(
                                'img/mobil/pork.png',
                                fit: BoxFit.contain,
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
            Positioned(
              left: 45 * fem,
              top: 173 * fem,
              child: Align(
                child: SizedBox(
                  width: 70 * fem,
                  height: 300 * fem,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        // color: Color(0x7af8eeee),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7 * fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (botonescerdito)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'VER',
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => informacion_desk()));
                                    },
                                    child: Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/datos.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (botoneslimpio)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'CONTROL',
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => limpio_desk()));
                                    },
                                    child: Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/calendario.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (botonessalud)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'VACUNACION / SALUD',
                                  child: InkWell(
                                    onTap: () {
                                       Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                             builder: (context) => salud_desk()));
                                    },
                                    child: Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/vacunas.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (botonesalimento)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'ALIMENTACION',
                                  child: InkWell(
                                    onTap: () {
                                         Navigator.push(
                                           context,
                                           MaterialPageRoute(
                                               builder: (context) => alimento_desk()));
                                    },
                                    child: Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/vegetales.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'FORMULARIOS',
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  registros_desktop()));
                                    },
                                    child:Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/cerdito.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'LOTES',
                                  child: InkWell(
                                    onTap: () {
                                       Navigator.push(
                                        context,
                                       MaterialPageRoute(
                                        builder: (context) => informacion_lotedesk()));
                                    },
                                    child:Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/lote.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: 7 * fem,
                            ),
                            if (botonescerdito)
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                child: Tooltip(
                                  message: 'GANANCIA',
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      // MaterialPageRoute(
                                      //   builder: (context) => salud()));
                                    },
                                    child:Container(
                                      width: 40 * fem,
                                      height: 35 * fem,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10 * fem),
                                          color: Color.fromRGBO(
                                              73, 187, 217, 150)),
                                      child: Center(
                                        // porkSQo (15:110)
                                        child: SizedBox(
                                          width: 25 * fem,
                                          height: 25 * fem,
                                          child: Image.asset(
                                            'img/mobil/ganancia.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
            Positioned(
              left: 107 * fem,
              top: 170 * fem,
              child: Column(
                children: [
                  if (botonescerdito || botoneslimpio || botonessalud ||botonesalimento)
                    Container(
                      width: 0.5 * fem,
                      height: 190 * fem,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10 * fem),
                        color: Colors.black12,
                      ),
                    ),
                ],
              ),),
            Positioned(
              left: 245 * fem,
              top: 300 * fem,
              child: Align(
                child: SizedBox(
                  width: 295 * fem,
                  height: 140 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(230, 244, 254, 100),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 21.5 * fem),
                          width: 230* fem,
                          height: 20 * fem,
                          child: Text(
                            'ANIMALES - GRANJA',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Alfa Slab One',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 1.8 * fem,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 170)),
                                margin: EdgeInsets.only(left: 55 * fem, top: 10* fem),
                                child: SizedBox(
                                width: 25 * fem,
                                height: 25 * fem,
                                child: Image.asset(
                                  'img/mobil/cerdo.png',
                                  fit: BoxFit.contain,
                                ),
                              ),),
                              Container(
                                margin: EdgeInsets.only(left: 2* fem, top: 10* fem),
                                child:  Column(
                                  children: [
                                    Text(
                                      'Cantidad Machos:',
                                      style:  SafeGoogleFont (
                                        'Alegreya',
                                        fontSize:  6.2*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.52*fem,
                                        color:  Colors.black45,
                                      ),
                                    ),
                                    FutureBuilder<int>(
                                      future: getCountMachos(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return Text('Error al obtener el conteo');
                                          } else {
                                            return Text(
                                              '${snapshot.data}',
                                              style: SafeGoogleFont(
                                                'Alegreya',
                                                fontSize: 6.2 * ffem,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.52 * fem,
                                                color: Colors.black45,
                                              ),
                                            );
                                          }
                                        }
                                        return Container();
                                      },
                                    ),
                                  ],
                                ),
                              ), Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 170)),
                                margin: EdgeInsets.only(left: 20 * fem, top: 10* fem),
                                child: SizedBox(
                                  width: 25 * fem,
                                  height: 25 * fem,
                                  child: Image.asset(
                                    'img/mobil/pork.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),),
                              Container(
                                margin: EdgeInsets.only(left: 2* fem,top: 10* fem),
                                child:  Column(
                                  children: [
                                    Text(
                                      'Cantidad Hembras:',
                                      style:  SafeGoogleFont (
                                        'Alegreya',
                                        fontSize:  6.2*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.52*fem,
                                        color:  Colors.black45,
                                      ),
                                    ),
                                    FutureBuilder<int>(
                                      future: getCountHembras(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.done) {
                                          if (snapshot.hasError) {
                                            return Text('Error al obtener el conteo');
                                          } else {
                                            return Text(
                                              '${snapshot.data}',
                                              style: SafeGoogleFont(
                                                'Alegreya',
                                                fontSize: 6.2 * ffem,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.52 * fem,
                                                color: Colors.black45,
                                              ),
                                            );
                                          }
                                        }
                                        return Container();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 170)),
                                margin: EdgeInsets.only(left: 55 * fem, top: 15* fem),
                                child: SizedBox(
                                  width: 25 * fem,
                                  height: 25 * fem,
                                  child: Image.asset(
                                    'img/mobil/cerdosbb.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),),
                              Container(
                                margin: EdgeInsets.only(left: 2* fem, top: 15* fem),
                                child:  Column(
                                  children: [
                                    Text(
                                      'Cantidad Crias:',
                                      style:  SafeGoogleFont (
                                        'Alegreya',
                                        fontSize:  6.2*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.52*fem,
                                        color:  Colors.black45,
                                      ),
                                    ),
                                    Text(
                                      '$sumaDestetados',
                                      style:  SafeGoogleFont (
                                        'Alegreya',
                                        fontSize:  6.2*ffem,
                                        fontWeight:  FontWeight.w400,
                                        letterSpacing:  0.52*fem,
                                        color:  Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle13KFV (208:83)
              left: 562 * fem,
              top: 300 * fem,
              child: Align(
                child: SizedBox(
                  width: 240 * fem,
                  height: 140 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffe6e6),
                    ),
                    child: grafica(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      //DRAWER------------------------------------------------------------------
      drawer: Drawer(
        width: 250 * fem,
        backgroundColor: Color.fromRGBO(242, 215, 215, 5),
        child: Container(
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                child: SizedBox(
                  width: 250 * fem,
                  height: 299 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff6d8d8),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 75 * fem,
                top: 19 * fem,
                child: SizedBox(
                  width: 90 * fem,
                  height: 90 * fem,
                  child: ClipOval(
                    child: Container(
                      child: Image.network(
                        'https://cdn.pixabay.com/animation/2022/12/01/17/03/17-03-11-60_512.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * fem,
                top: 200 * fem,
                child: SizedBox(
                  width: 250 * fem,
                  height: 449 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50 * fem),
                      color: Color(0xffffffff),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 10 * fem, left: 15 * fem, right:  15 * fem),
                      child: ListView(
                        children: [
                          ListTile(
                            subtitle: ExpansionTile(
                              leading: Icon(Icons.settings_outlined),
                              title: Text('CONFIGURACION'),
                              children: [
                               /* ListTile(
                                  title: Text('Manejo Roles'),
                                  onTap: () {
                                    // Lógica para la Subopción 1
                                  },
                                ),*/
                                ListTile(
                                  title: Text('Descargar Gestion'),
                                  onTap: () async {
                                   // Navigator.push(
                                   //   context,
                                    //  MaterialPageRoute(
                                    //    builder: (context) => pdf(),
                                    //  ),
                                 //   );
                                  },
                                ),
                                ListTile(
                                  title: Text('Reiniciar Gestion'),
                                  onTap: () async {
                                    try {
                                      // Eliminatodo de las colecciones
                                      await FirebaseFirestore.instance.collection('registro_hembra').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });
                                     /* await FirebaseFirestore.instance.collection('registro_macho').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });
                                      await FirebaseFirestore.instance.collection('crias').get().then((snapshot) {
                                        for (DocumentSnapshot doc in snapshot.docs) {
                                          doc.reference.delete();
                                        }
                                      });*/

                                      print('Base de datos reiniciada correctamente');
                                    } catch (e) {
                                      print('Error al reiniciar la base de datos: $e');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                         /* ListTile(
                            leading: Icon(Icons.person),
                            title: Text('MIS DATOS'),
                            onTap: () => print('Perfil Consulado'),
                          ),*/
                          ListTile(
                            leading: Icon(Icons.output_sharp),
                            title: Text('CERRAR SESION'),
                            onTap: () {
                              signOutAndRedirectToLogin(context);
                            },
                          ),
                          Container(
                            width: 10 * fem,
                            height: 0.5 * fem,
                            color: Colors.black12,
                          ),
                          Container(
                           // texto que le diga el rol child: ,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle69FWY (290:24)
                left: 0 * fem,
                top: 135 * fem,
                child: Align(
                  child: SizedBox(
                    width: 250 * fem,
                    height: 20 * fem,
                    child: Text(
                      _userEmail,
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        '',
                        fontSize: 10 * ffem,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8 * fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                // rectangle70AdW (290:25)
                left: 45 * fem,
                top: 115 * fem,
                child: Align(
                  child: SizedBox(
                    width: 150 * fem,
                    height: 20 * fem,
                    child: Text(
                      'BIENVENIDO',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Alfa Slab One',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.8 * fem,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 70 * fem,
                top: 160 * fem,
                child: Align(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => sesion_deskt()));
                              builder: (context) => home_desk()));
                    },
                    child: Align(
                      child: SizedBox(
                        width: 100 * fem,
                        height: 22 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30 * fem),
                            color: Color(0xfffff0f0),
                          ),
                          child: Center(
                            child: Text(
                              'EMPIEZA',
                              style: SafeGoogleFont(
                                'Alfa Slab One',
                                fontSize: 7 * ffem,
                                fontWeight: FontWeight.w100,
                                color: Color(0x82ea96a0),
                              ),
                            ),
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

  List<String> images = [
    "img/mobil/carru1.gif",
  ];

  Widget _swiper() {
    return Container(
      color: Colors.transparent,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.5,
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            images[index],
            fit: BoxFit.cover,
          );
        },
        itemCount: images.length,
        pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );
  }

  void _openNotificationsDrawer(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              top: 0,
              right: 0,
              bottom: 0,
              width: 260 * fem,
              child: Container(
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          width: 260 * fem,
                          height: 465 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 260 * fem,
                                    height: 371 * fem,
                                    child: Image.asset(
                                      'img/mobil/fondoinicio.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // ellipse2atw (79:52)
                                left: 160 * fem,
                                top: 133 * fem,
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
                                left: 0 * fem,
                                top: 189 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 260 * fem,
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
                                left: 0 * fem,
                                top: 277 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 393 * fem,
                                    height: 98 * fem,
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
                                top: 133 * fem,
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
                                left: 73.5 * fem,
                                top: 20 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 110 * fem,
                                    height: 35 * fem,
                                    child: Text(
                                      'REVISE',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Alfa Slab One',
                                        fontSize: 18 * ffem,
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
                                left: 2.5 * fem,
                                top: 40 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 254 * fem,
                                    height: 35 * fem,
                                    child: Text(
                                      'NOFIFICACIONES',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont('Alfa Slab One',
                                          fontSize: 20 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3675 * ffem / fem,
                                          letterSpacing: 1 * fem,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18 * fem,
                                top: 80 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 222 * fem,
                                    height: 380 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20 * fem),
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
                        left: 18 * fem,
                        top: 95 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 222 * fem,
                            height: 357 * fem,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
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
            Padding(
              padding: EdgeInsets.only(top: 2.0* fem),
              child: SizedBox(
                width: 90 * fem,
                height: 20 * fem,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10* fem),
                      width: 70 * fem,
                      height: 25 * fem,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                          // color: Color.fromRGBO(98, 161, 145, 200)
                        color: Color.fromRGBO(230, 244, 254, 100),),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2* fem,bottom: 2* fem,left: 2*fem),
                            child: Container(
                              width: 20 * fem,
                              height: 25* fem,
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
                                          builder: (context) => registros_desktop(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 20 * fem,
                                        height: 20 * fem,
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
                                          builder: (context) => limpio_desk(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 20 * fem,
                                        height: 20 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5 * fem),
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
                                  width: 45 * fem,
                                  height: 20 * fem,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(
                                          margin: EdgeInsets.only(top: 3* fem, bottom: 2* fem),
                                            child: Center(child: Text('${ item['titulo']}'))),
                                        subtitle:
                                            Text('Detalle: ${item['mensaje']}',style: TextStyle(fontSize: 2.5 * fem),),
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
              ),
            ),
          ],
        ),
      );
    }
    return containers;
  }




}