import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:myapp/tablet/usuario/cerditos/registros/registro1.dart';
import 'package:myapp/tablet/usuario/cerditos/registros/registro2.dart';
import 'package:myapp/tablet/usuario/cerditos/registros/registro3.dart';
import 'package:myapp/tablet/usuario/cerditos/registros/registro4.dart';
import 'package:myapp/utils.dart';

import '../../../../desktop/usuario/home.dart';


class registros_tablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return regisapp();
  }
}

class regisapp extends StatefulWidget {
  @override
  State<regisapp> createState() => _regisappState();
}

class _regisappState extends State<regisapp> {
  List<dynamic> datos = [];

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarcerditas();
  }

  void consultarcerditas() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena los datos en la lista
        datos = querySnapshot.docs.map((doc) => doc.data()).toList();
      });
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 560 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // materialappCtX (20:3)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                              27 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: 575 * fem,
                          height: 80 * fem,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 194, 199, 20)),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => home_desk()));
                                      },
                                      child: Image.asset(
                                        'img/mobil/flecha.png',
                                        width: 25.7 * fem,
                                        height: 40.05 * fem,
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                  width: 494.5 * fem,
                                  height: 132 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 30 * fem,
                                        top: 12 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 229 * fem,
                                            height: 35 * fem,
                                            child: Text(
                                              'REGISTROS',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Alfa Slab One',
                                                fontSize: 25 * ffem,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 1 * fem,
                                                color: Color(0xffffffff),
                                              ),
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
                      Positioned(
                        // ellipse1qQB (15:40)
                        left: 0 * fem,
                        top: 50 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 60 * fem,
                            height: 60 * fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                              width: 60 * fem,
                              height: 60 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle6m2w (15:41)
                        left: 35 * fem,
                        top: 52.4 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 355 * fem,
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
                        // rectangle15hM1 (31:259)
                        left: 25 * fem,
                        top: 69 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 343 * fem,
                            height: 470 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xfffff6f6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38 * fem,
                        top: 82 * fem,
                        child: Align(
                          child: Container(
                            width: 255 * fem,
                            margin:
                            EdgeInsets.only(left: 5 * fem, right: 5 * fem),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color.fromRGBO(228, 228, 227, 110),
                            ),
                            child: SizedBox(
                              width: 267 * fem,
                              height: 38 * fem,
                              child: Padding(
                                padding: EdgeInsets.only(left: 37 * fem, top: 4.5 * fem),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        datos = datos
                                            .where((item) => item['id']
                                            .toString()
                                            .contains(value))
                                            .toList();
                                      } else {
                                        consultarcerditas();
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'ID a buscar',
                                    border: InputBorder
                                        .none, // Elimina la línea inferior
                                  ),
                                  style: TextStyle(fontSize: 12.5 * fem),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 51 * fem,
                        top: 93 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 17 * fem,
                            height: 16 * fem,
                            child: Image.asset(
                              'img/mobil/iconbuscar.png',
                              width: 17 * fem,
                              height: 16 * fem,
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            left: 312 * fem,
                            top: 83 * fem,
                            child: Align(
                              child: SizedBox(
                                width: 38 * fem,
                                height: 33 * fem,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20 * fem),
                                      color:
                                      Color.fromRGBO(144, 161, 130, 200)),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 323 * fem,
                            top: 93 * fem,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  escoger();
                                });
                              },
                              child: Align(
                                child: SizedBox(
                                  width: 15 * fem,
                                  height: 14.13 * fem,
                                  child: Image.asset(
                                    'img/mobil/iconmas.png',
                                    width: 15 * fem,
                                    height: 14.13 * fem,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 43 * fem,
                        top: 128 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 299 * fem,
                            height: 400 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                            //   color: Colors.blue,
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: generateContainers(datos, fem),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
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

  List<Widget> generateContainers(List<dynamic> data, double fem) {
    List<Widget> containers = [];
    for (var item in data) {
      var id = item['id'];
      containers.add(
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 13 * fem, // Espacio vertical entre los widgets
            ),
            SizedBox(
              width: 299 * fem,
              height: 80 * fem, // Ajusta la altura según tus necesidades
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20 * fem),
                  color: Color.fromRGBO(254, 193, 178, 200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10 * fem),
                      child: SizedBox(
                        width: 90 * fem,
                        height: 90 * fem,
                        child: Image.asset(
                          'img/mobil/pork.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 0 * fem, top: 5 * fem),
                        child: ListTile(
                          title: Text('DATOS',style: TextStyle(fontSize: 15* fem)),
                          // Utiliza la función menu para mostrar el menú emergente
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ID: ${item['id']}',style: TextStyle(fontSize: 12* fem)),
                              Text('Nombre: ${item['nombre']}',style: TextStyle(fontSize: 12* fem)),
                              Text('Peso: ${item['peso']}',style: TextStyle(fontSize: 12* fem)),
                              // Puedes agregar más campos según sea necesario
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 35* fem, left: 20 * fem),
                      child: menu(id),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    return containers;
  }

  PopupMenuButton<Text> menu(int id) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return PopupMenuButton<Text>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registro3_tablet(id)));
                },
                child: Container(
                  width: 50 * fem,
                  height: 40 * fem,
                  child: Center(
                    child: Text(
                      'Hoja de vida',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        '',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          PopupMenuItem(
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => regis_crias_tablet(id)));
                },
                child: Container(
                  width: 50 * fem,
                  height: 30 * fem,
                  child: Center(
                    child: Text(
                      'Crias',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        '',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }

  escoger(){
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // El usuario no puede cerrar la alerta tocando fuera de ella
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿QUE DESEA AGREGAR?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Escoja la opsion que desea agregar'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hembra'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registro1_tablet()));
              },
            ),
            TextButton(
              child: Text('Macho'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => registro2_tablet()));
              },
            ),
          ],
        );
      },
    );
  }

}
