import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/utils.dart';
import '../../home.dart';
import 'infoindivilote.dart';

class informacion_lotedesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return infoapp();
  }
}

class infoapp extends StatefulWidget {
  @override
  State<infoapp> createState() => _infoappState();
}

class _infoappState extends State<infoapp> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> datos = {};
  bool lote = false;
  bool lote2 = false;

  bool botondetalles = false;
  bool imagen = false;
  bool infoindivi = false;
  String precebo = '';
  String levante = '';
  String vendido = '';
  String idlotes = '';

  @override
  void initState() {
    super.initState();
    consultarLotes();
  }

  void consultarLotes() {
    datos.clear();
    FirebaseFirestore.instance
        .collection('lotes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          // Obtén el valor del campo que deseas usar como clave
          dynamic clave = document.get('dato_lote');

          // Luego, consulta la subcolección específica usando el ID del documento principal
          FirebaseFirestore.instance
              .collection('lotes')
              .doc(document.id)
              .collection('cerditoslote')
              .get()
              .then((QuerySnapshot subcoleccionSnapshot) {
            // Accede a los datos de la subcolección
            List<dynamic> datosSubcoleccion =
                subcoleccionSnapshot.docs.map((doc) => doc.data()).toList();

            // Agrega el par clave-valor al mapa
            datos[clave] = datosSubcoleccion;

            // Haz lo que necesites con los datos del documento principal y la subcolección
            print(
                "Clave: $clave, Datos de la subcolección: $datosSubcoleccion");
          });
        });
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
        height: 832 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: 1280 * fem,
                height: 18 * fem,
                decoration: BoxDecoration(
                  // color:  Color(0xffffffff),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0 * fem, 2 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35 * fem,
                      height: 40 * fem,
                      child: Builder(builder: (context) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_desk()),
                            );
                          },
                          child: Icon(Icons.arrow_back,
                              color: Color(0xa062a191), size: 6.5 * fem),
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.5 * fem, right: 120 * fem),
                      child: Text(
                        'INFORMACION  LOTES',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Alfa Slab One',
                          fontSize: 7 * ffem,
                          fontWeight: FontWeight.w400,
                          color: Color(0xfff8d8d8),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 120 * fem),
                        width: 25 * fem,
                        height: 60 * fem,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            width: 25 * fem,
                            height: 25 * fem,
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
              top: 30 * fem,
              left: 50 * fem,
              child: Container(
                width: 140 * fem,
                height: 150 * fem,
                decoration: BoxDecoration(
                  //   color: Colors.pink,
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: manejopantallas(idlotes),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30 * fem, left: 200 * fem),
              width: 140 * fem,
              height: 150 * fem,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10 * fem)),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          27 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 140 * fem,
                      height: 50 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'img/mobil/fondoinicio.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10 * fem,
                    top: 33.8 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 120 * fem,
                        height: 20 * fem,
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
                    top: 33 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 20 * fem,
                        height: 20 * fem,
                        child: Image.asset(
                          'img/mobil/circulo.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120 * fem,
                    top: 33 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 20 * fem,
                        height: 20 * fem,
                        child: Image.asset(
                          'img/mobil/circulo.png',
                          width: 20 * fem,
                          height: 20 * fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10 * fem,
                    top: 9 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 120 * fem,
                        height: 135 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: Color(0xfffff6f6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20 * fem,
                      top: 14 * fem,
                      child: Row(
                        children: [
                          Tooltip(
                            message: 'LOTES VENDIDOS',
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  botondetalles = false;
                                  lote = true;
                                  vendido = 'Precebo-Levante-Vender';
                                  precebo = '';
                                  levante = '';
                                });
                             //   precebo = 'Precebo';
                              //  levante = '';
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 13 * fem),
                                width: 30 * fem,
                                height: 20 * fem,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(98, 161, 145, 170),
                                    borderRadius: BorderRadius.circular(5 * fem)),
                                child: Stack(
                                  children:[
                                  Center(
                                    // porkSQo (15:110)
                                    child: SizedBox(
                                      width: 20 * fem,
                                      height: 20 * fem,
                                      child: Image.asset(
                                        'img/mobil/lote.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                    Positioned(
                                      top: 11 * fem,
                                      left: 20 * fem,  // Ajusta la posición según sea necesario
                                      child: Container(
                                        padding: EdgeInsets.all(5),  // Ajusta el espaciado según sea necesario
                                        decoration: BoxDecoration(
                                          color: Colors.white70,  // Color del fondo del icono de precio
                                          borderRadius: BorderRadius.circular(50),  // Ajusta según sea necesario
                                        ),
                                        child: Icon(
                                          Icons.attach_money,  // Icono de precio (puedes cambiarlo según tus necesidades)
                                          color: Colors.black,  // Color del icono de precio
                                        ),
                                      ),
                                    ),
    ]
                                ),
                              ),
                            ),
                          ),
                          Tooltip(
                            message: 'VER LOTES EXISTENTES',
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  vendido = '';
                                  levante ='';
                                  precebo = '';
                                  botondetalles = false;
                                  opcion();
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10 * fem),
                                width: 30 * fem,
                                height: 20 * fem,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(98, 161, 145, 170),
                                    borderRadius:
                                        BorderRadius.circular(5 * fem)),
                                child: Center(
                                  // porkSQo (15:110)
                                  child: SizedBox(
                                    width: 20 * fem,
                                    height: 20 * fem,
                                    child: Image.asset(
                                      'img/mobil/lote.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                    left: 19 * fem,
                    top: 35 * fem,
                    child: Align(
                      child: Container(
                        width: 100 * fem,
                        height: 8 * fem,
                        margin: EdgeInsets.only(top: 2 * fem),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 3 * fem),
                              child: Align(
                                child: SizedBox(
                                  width: 5 * fem,
                                  height: 6 * fem,
                                  child: Image.asset(
                                    'img/mobil/iconbuscar.png',
                                    width: 5 * fem,
                                    height: 6 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50 * fem,
                              height: 38 * fem,
                              margin: EdgeInsets.only(bottom: 2 * fem),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8 * fem, top: 1 * fem),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      // Filtrar los datos según el valor ingresado en el TextField
                                      /*   if (value.isNotEmpty) {
                                        datos = datos
                                            .where((item) => item['id']
                                            .toString()
                                            .contains(value))
                                            .toList();
                                      } else {
                                        // Si el TextField está vacío, muestra todos los datos nuevamente
                                    //    consultarcerditas();
                                      }*/
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'ID a buscar',
                                    border: InputBorder
                                        .none, // Elimina la línea inferior
                                  ),
                                  style: TextStyle(fontSize: 3 * fem),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20 * fem,
                      top: 40 * fem,
                      child: Container(
                        margin: EdgeInsets.only(top: 5 * fem),
                        width: 100 * fem,
                        height: 85 * fem,
                        // color: Colors.teal,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (lote)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: generateContainers(datos),
                                ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Positioned(
              top: 55 * fem,
              left: 40 * fem,
              child: Container(
                  width: 20 * fem,
                  height: 110 * fem,
                  decoration: BoxDecoration(
                      //   color: Colors.blue,
                      ),
                  child: Padding(
                    padding: EdgeInsets.all(1 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (botondetalles)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5 * fem)),
                            margin: EdgeInsets.only(bottom: 5 * fem),
                            child: Tooltip(
                              message: 'VER INFORMACION',
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    infoindivi = true;
                                  });
                                },
                                child: Container(
                                  width: 20 * fem,
                                  height: 15 * fem,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                      color: Color.fromRGBO(98, 161, 145, 170)),
                                  child: Center(
                                    // porkSQo (15:110)
                                    child: SizedBox(
                                      width: 10 * fem,
                                      height: 10 * fem,
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
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  opcion() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿QUE DESEA HACER?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Escoja la opsion que desea ver'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Lotes Precebo'),
              onPressed: () {
                setState(() {
                  print(datos);
                  lote =true;
                  precebo = 'Precebo';

                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Lotes Levante'),
              onPressed: () {
                setState(() {
                  print(datos);
                  lote = true;
                  levante = 'Precebo-Levante';
                  precebo = '';
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<Widget> generateContainers(Map<String, dynamic> data) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    List<Widget> containers = [];
    containers.clear();
    data.forEach((clave, datosSubcoleccion) {
      idlotes = clave;
      List<dynamic> subcoleccion = datosSubcoleccion as List<dynamic>;

      bool contieneEstadolote = subcoleccion.any((item) =>
          item['estadolote'] == precebo || item['estadolote'] == levante || item['estadolote'] == vendido);

      if (contieneEstadolote) {
        containers.add(
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 6 * fem,
              ),
              SizedBox(
                width: 90 * fem,
                height: 20 * fem,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pasarlote(clave);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 3 * fem),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                            color: Colors.white),
                        child: Container(
                          width: 25 * fem,
                          height: 20 * fem,
                          padding: EdgeInsets.all(4 * fem),
                          child: SizedBox(
                            width: 25 * fem,
                            height: 25 * fem,
                            child: Image.asset(
                              'img/desktop/pork1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 6 * fem,
                      height: 0.5 * fem,
                      color: Color(0xff62a191),
                    ),
                    Container(
                      width: 50 * fem,
                      height: 25 * fem,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            child: Container(
                              width: 50 * fem,
                              height: 13 * fem,
                              child: ListTile(
                                title: Container(
                                    margin: EdgeInsets.only(
                                        top: 2 * fem,
                                        left: 5 * fem,
                                        bottom: 1 * fem),
                                    child: Text('NUMERO DE LOTE')),
                                subtitle: Column(
                                  children: [
                                    Text('${clave}'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 0.5 * fem, left: 20 * fem),
                            width: 20 * fem,
                            height: 5 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Color.fromRGBO(98, 161, 145, 200),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    print('clave lote aqui $idlotes');
                                    botondetalles = true;
                                    manejopantallas(clave);
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'DETALLES',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      '',
                                      fontSize: 3 * ffem,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
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
            ],
          ),
        );
      } else {
        containers.add(Container(
          margin: EdgeInsets.only(top: 40 * fem),
          child: Text(
            '¡ AUN NO HAY LOTES !',
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              '',
              fontSize: 3 * ffem,
              fontWeight: FontWeight.w800,
              color: Colors.black26,
            ),
          ),
        ));
      }
    });

    return containers;
  }

  manejopantallas(String clave) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    print('ID en manejopantallas: $clave');

    return Stack(
      children: [
        if (imagen == false)
          Container(
            width: 140 * fem,
            height: 150 * fem,
            child: Image.asset(
              'img/desktop/PORCI33.gif',
              fit: BoxFit.cover,
            ),
          ),
        if (infoindivi) Container(child: individuallote_desk(clave,levante,precebo)),
      ],
    );
  }

  Future<void> pasarlote(clave) {
    if (datos[clave].any((subcoleccion) =>
    subcoleccion['estadolote'] == precebo ||
        subcoleccion['estadolote'] == levante)) {

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¿QUÉ DESEA HACER?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Escoja la opción que desea ver'),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  for (var subcoleccion in datos[clave])
                    if (subcoleccion['estadolote'] == precebo)
                      TextButton(
                        child: Text('PASAR A LEVANTE'),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).pop();
                            lotelevante();
                          });
                        },
                      ),
                  if (datos[clave].any((subcoleccion) =>
                  subcoleccion['estadolote'] == precebo ||
                      subcoleccion['estadolote'] == levante))
                    TextButton(
                      child: Text('VENDIDO'),
                      onPressed: () {
                        setState(() {
                          vender();
                        });
                        Navigator.of(context).pop();
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
    }
    // Puedes añadir lógica adicional aquí si es necesario
    return Future.value();
  }
  void vender() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('lotes')
        .where('dato_lote', isEqualTo: idlotes)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Obtiene el ID del documento encontrado
      String documentoId = querySnapshot.docs[0].id;
      print(documentoId);

      // Obtiene la referencia del documento en Firestore
      QuerySnapshot subcoleccionSnapshot = await FirebaseFirestore.instance
          .collection('lotes')
          .doc(documentoId)
          .collection('cerditoslote')
          .get();

      // Actualiza cada documento en la subcolección
      subcoleccionSnapshot.docs.forEach((DocumentSnapshot doc) async {
        await doc.reference.update({'estadolote': 'Precebo-Levante-Vender'});
      });

      print('Estadolote actualizado con éxito');
    }
  }

  void lotelevante() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('lotes')
        .where('dato_lote', isEqualTo: idlotes)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Obtiene el ID del documento encontrado
      String documentoId = querySnapshot.docs[0].id;
      print(documentoId);

      // Obtiene la referencia del documento en Firestore
      QuerySnapshot subcoleccionSnapshot = await FirebaseFirestore.instance
          .collection('lotes')
          .doc(documentoId)
          .collection('cerditoslote')
          .get();

      // Actualiza cada documento en la subcolección
      subcoleccionSnapshot.docs.forEach((DocumentSnapshot doc) async {
        await doc.reference.update({'estadolote': 'Precebo-Levante'});
      });

      print('Estadolote actualizado con éxito');
    }
  }

}
