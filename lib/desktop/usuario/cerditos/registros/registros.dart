import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registro1.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registro2.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registro3.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registro4.dart';
import 'package:myapp/utils.dart';
import '../../home.dart';


class registros_desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/REGISTROS",
      theme: ThemeData(
      ),
      home: regisapp(),
    );
  }
}

class regisapp extends StatefulWidget {
  @override
  State<regisapp> createState() => _regisappState();

}

class _regisappState extends State<regisapp> {
  List<dynamic> datos = [];
  bool botonmas = false;
  bool botonmacho = false;
  bool botonhojadevida = false;
  bool botoncrias = false;
  bool imagen = false;
  int valorid = 0;
  List<String> ids = [];



  @override
  void actualizar() {
    consultarcerditas();
  }

  void initState() {
    super.initState();
    datos.clear();
    fallecidas();
    consultarcerditas();
  }

  void consultarcerditas() async {
    datos.clear();
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('registro_hembra').get();

    setState(() {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        String id = doc['id'].toString();

        if (!ids.contains(id)) {
          datos.add(doc.data());
        } else {
          print('El ID $id ya existe en la colección "fallecidos"');
        }
      }
      print('Datos consultados: $datos');
    });
  }

  void fallecidas() async {
    ids.clear();
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('fallecidos').get();

    setState(() {
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        String id = doc['id'].toString();
        ids.add(id);
      }
      print('IDs consultados: $ids');
    });
  }


  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;

    var id = valorid;

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
                   color:  Color(0xffffffff),
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
                      child: Icon(Icons.arrow_back,color: Color(0xa062a191),size: 6.5 * fem),
                    );
                  }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.5 * fem, right: 150* fem),
                      child: Text(
                        'REGISTROS',
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
                        )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 55 * fem,
              top: 30 * fem,
              child: Align(
                child: Row(
                  children: [
                    Container(
                      width: 113 * fem,
                      height: 12 * fem,
                      margin:
                      EdgeInsets.only(top: 2*fem),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(228, 228, 227, 100),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin:EdgeInsets.only(left: 3 * fem),
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
                            child: Padding(
                              padding: EdgeInsets.only(left: 8 * fem ,top: 1* fem),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    // Filtrar los datos según el valor ingresado en el TextField
                                    if (value.isNotEmpty) {
                                      datos = datos
                                          .where((item) => item['id']
                                          .toString()
                                          .contains(value))
                                          .toList();
                                    } else {
                                      // Si el TextField está vacío, muestra todos los datos nuevamente
                                      consultarcerditas();
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'ID a buscar',
                                  border: InputBorder
                                      .none, // Elimina la línea inferior
                                ),
                                style: TextStyle(fontSize: 5 * fem),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tooltip(
                      message: 'Agregar',
                      child: Container(
                        width: 12 * fem,
                        height: 10 * fem,
                        margin: EdgeInsets.only(top: 2*fem, left: 2 * fem),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xa062a191),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              escoger();
                            });
                          },
                        child: Align(
                          child: SizedBox(
                            width: 6 * fem,
                            height: 7.13 * fem,
                            child: Image.asset(
                              'img/mobil/iconmas.png',
                              width: 6 * fem,
                              height: 7.13 * fem,
                            ),
                          ),
                        ),
                      ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50 * fem,
              left: 45 * fem,
              child: Container(
                width:  145 * fem,
                height: 130 * fem,
                decoration:  BoxDecoration (
                  color:  Color(0xfffff6f6),
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: generateContainers(datos, fem),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30 * fem,
              left: 200 * fem,
              child: Container(
                width:  140 * fem,
                height: 150 * fem,
                decoration:  BoxDecoration (
                //  color:  Colors.pink,
                  borderRadius: BorderRadius.circular(10 * fem),
                ),
                child: formus(id)
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateContainers(List<dynamic> data, double fem) {
    print(datos);
    List<Widget> containers = [];
    if (data.isEmpty) {
      return [
        Padding(
          padding: EdgeInsets.only(top: 40 * fem),
          child: Center(
            child: Text(
              'No hay datos disponibles',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
            ),
          ),
        ),
      ];
    }

    for (var item in datos) {
      var id = item['id'];
      print('este es el id $id');
      containers.add(

        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 7 * fem, // Espacio vertical entre los widgets
            ),
            SizedBox(
              width: 120 * fem,
              height: 30 * fem, // Ajusta la altura según tus necesidades
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Color.fromRGBO(254, 193, 178, 200),
                ),
                child: Row(
                  children: [
                   Container(
                     //color: Colors.blue,
                     margin: EdgeInsets.only(left: 3 * fem),
                     width: 40 * fem,
                     height: 30 * fem,
                     child: Image.asset(
                       'img/mobil/pork.png',
                       fit: BoxFit.contain,
                     ),
                   ),
                    Container(
                     // color: Colors.purple,
                      width: 60 * fem,
                      height: 30 * fem,
                      child: ListTile(
                        title: Container(
                            width: 5 * fem,
                            height: 5 * fem,
                            margin: EdgeInsets.only(top: 3* fem, bottom:  1 * fem),
                            child: Center(child: Text('DATOS',style: TextStyle(fontSize: 5* fem)))),
                        // Utiliza la función menu para mostrar el menú emergente
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(margin: EdgeInsets.only(top: 0.5 * fem),
                                child: Center(child: Text('ID: ${item['id']}',style: TextStyle(fontSize: 4* fem)))),
                            Container(margin: EdgeInsets.only(top: 0.5 * fem),
                                child: Center(child: Text('Nombre: ${item['nombre']}',style: TextStyle(fontSize: 4* fem)))),
                            Container(margin: EdgeInsets.only(top: 0.5 * fem),
                                child: Center(child: Text('Peso: ${item['peso']}',style: TextStyle(fontSize: 4* fem)))),
                            // Puedes agregar más campos según sea necesario
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20 * fem),
                      //color: Colors.pink,
                      width: 10 * fem,
                      height: 10 * fem,
                      child: menu(id),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    print('Número de contenedores generados: ${containers.length}');
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
                  setState(() {
                    botonmas = false;
                    botonmacho = false;
                    botonhojadevida = true;
                    botoncrias = false;
                    valorid = id;
                    print('menu id: $valorid');

                  });
                },
                child: Container(
                  width: 20 * fem,
                  height: 10 * fem,
                  child: Center(
                    child: Text(
                      'Hoja de vida',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        '',
                        fontSize: 4 * ffem,
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
                  setState(() {
                    botonmas = false;
                    botonmacho = false;
                    botonhojadevida = false;
                    botoncrias = true;
                    valorid = id;
                    print('menu id: $valorid');

                  });
                },
              child: Container(
                width: 20 * fem,
                height: 10 * fem,
                child: Center(
                  child: Text(
                    'Crias',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      '',
                      fontSize: 4 * ffem,
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


  formus(int id){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    valorid = id;
    print('formus id: $valorid');

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
        if (botonmas)
          Container(
            child: registro1_desk(
              onFormularioCompleto: () {
                // Esta función se ejecuta cuando el formulario 1 está completo
                actualizar();
              },
            ),
          ),
        if (botonmacho)
          Container(child: registro2_desk(),),
        if (botonhojadevida)
          Container(child: registro3_desk(valorid)),
        if (botoncrias)
          Container(child: registro4_desk(valorid),)

      ],
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
                setState(() {
                  //botonmas = true;
                  botonmas = !botonmas;
                  botonmacho = false;
                  botonhojadevida = false;
                  botoncrias = false;
                }
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Macho'),
              onPressed: () {
                setState(() {
                  //botonmas = true;
                  botonmacho = !botonmacho;
                  botonmas = false;
                  botonhojadevida = false;
                  botoncrias = false;
                }
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}