import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class registro4_desk extends StatelessWidget {
  final int idhembra;
  registro4_desk(this.idhembra);
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

    return MaterialApp(
        routes: {
          '/imagen': (context) => imagen(),
        },
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        title: "PORCI/HEMBRA",
        theme: ThemeData(
          primarySwatch: mycolor,
        ),
        home: regis4(idhembra)
    );
  }
}

class regis4 extends StatefulWidget {
  final int idhembra;

  regis4(this.idhembra);
  @override
  State<regis4> createState() => _regis4State(idhembra);
}

class _regis4State extends State<regis4> {
  final int idhembra;
  _regis4State(this.idhembra);
  List<Widget> contenedores = [];
  List<TextEditingController> sexoControllers = [];
  List<TextEditingController> tatuajeControllers = [];
  List<TextEditingController> chapetaControllers = [];
  List<TextEditingController> pesonacerControllers = [];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const int maxCampos = 12;
  static const int miniCampos = 8;
  int contadorColeccion = 1;
  List<dynamic> datos = [];
  List<String> ids = [];
  String fecha = '';



  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarcerdita();
    consultahoja();
  }

  void consultarcerdita() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .where('id', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena los datos en la lista
        datos = querySnapshot.docs.map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>).toList();
        ids = querySnapshot.docs.map((doc) => doc.id).toList();

      });
    })
        .catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }

  void consultahoja() {
    FirebaseFirestore.instance
        .collection('hoja_devida')
        .where('id_hembra', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          querySnapshot.docs.forEach((doc) {
            Timestamp datoLote = doc['real_parto'];

            DateTime fechaParto = datoLote.toDate();
            String fechaFormateada = DateFormat('dd/MM/yyyy').format(fechaParto);
            fecha = fechaFormateada;

          });
          print(fecha);
        });
      } else {
        print('No se encontraron fechas para la cria: ${widget.idhembra}');
      }
    })
        .catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width:  140 * fem,
          height:  150*fem,
          decoration:  BoxDecoration (
            color:  Color(0xffffffff),
          ),
          child:Stack(
            children:  [
              Positioned(
                child:
                Container(
                  width:  140*fem,
                  height:  55*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  140*fem,
                            height:  55*fem,
                            child:
                            Image.asset(
                              'img/mobil/fondoinicio.png',
                              fit:  BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  0*fem,
                        top:  45*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  20*fem,
                            height:  20*fem,
                            child:
                            Image.asset(
                              'img/mobil/circulo.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  8.5*fem,
                        top:  45.8*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  135*fem,
                            height:  20*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1*fem,
                        top: 12*fem,
                        child: Align(
                          child: SizedBox(
                            width: 140*fem,
                            height: 20*fem,
                            child: Text(
                              'REGISTRO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Alfa Slab One',
                                fontSize: 9*ffem,
                                fontWeight: FontWeight.w400,
                                height: 0.2*ffem/fem,
                                letterSpacing: 1*fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18.5*fem,
                        child: Align(
                          child: SizedBox(
                            width: 140*fem,
                            height: 19*fem,
                            child: Text(
                              'LECHONES',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Jost',
                                fontSize: 4*ffem,
                                fontWeight: FontWeight.w400,
                                height: 0.1*ffem/fem,
                                letterSpacing: 0.4*fem,
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
                left:  0*fem,
                top:  30*fem,
                child:
                Container(
                  width:  140*fem,
                  height:  110.61*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        left:  10*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  120*fem,
                            height:  60*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(10*fem),
                                color:  Color(0xfffff3f3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  5*fem,
                        top:  40*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width: 1300*fem,
                            height:  60*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                color:  Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  20*fem,
                        top:  10*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  100*fem,
                            height:  60*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(10*fem),
                                color:  Color(0xffffffff),
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
                  left:  100*fem,
                  top:  33.5*fem,
                  child:
                  Tooltip(
                    message: 'Agregar Campo',
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
                            contenedores.add(campos());
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

              ),
              Positioned(
                left:  40*fem,
                top:  20*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  60*fem,
                    height:  30*fem,
                    child:
                    Image.network(
                      'img/mobil/cerdito1.png',
                      fit:  BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left:  20*fem,
                top:  40*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  100*fem,
                    height:  110*fem,
                    child:
                    SingleChildScrollView(
                      child: Container(
                        decoration:  BoxDecoration (
                          // color:  Color(0xffd9d9d9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 100 * fem,
                              height: 80 * fem,
                              margin: EdgeInsets.only( top: 11 * fem),
                              child: contenedores?.isNotEmpty ?? false
                                  ? SingleChildScrollView(
                                child: Column(
                                  children: contenedores,
                                ),
                              )
                                  : Center(
                                child: Text(
                                  'Aún no hay datos. Por favor, agrega datos al presionar el botón (+)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 2.3 * fem,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6 * fem),
                              child: TextButton(
                                onPressed: () {
                                  _guardarDatos(idhembra);
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  // padding: EdgeInsets.fromLTRB(46*fem, 14*fem, 54.5*fem, 17.02*fem),
                                  width: 50*fem,
                                  height: 10*fem,
                                  decoration: BoxDecoration (
                                    color: Color(0xfff5c7c6),
                                    borderRadius: BorderRadius.circular(20*fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x3f000000),
                                        offset: Offset(0*fem, 4*fem),
                                        blurRadius: 2*fem,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: 0.8,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 1*fem, 0*fem),
                                          width: 3.8*fem,
                                          height: 4.98*fem,
                                          child: Image.asset(
                                            'img/mobil/iconopersona.png',
                                            width: 3.8*fem,
                                            height: 4.98*fem,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // registrarmeCJT (2:21)
                                        margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                                        child: Text(
                                          'REGISTRAR',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Alice',
                                            fontSize: 3*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 0.5*ffem/fem,
                                            letterSpacing: 0.26*fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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

  campos(){
    TextEditingController nuevoSexoController = TextEditingController(text: "");
    TextEditingController nuevoTatuajeController = TextEditingController(text: "");
    TextEditingController nuevoChapetaController = TextEditingController(text: "");
    TextEditingController nuevoPesoNacerController = TextEditingController(text: "");

    sexoControllers.add(nuevoSexoController);
    tatuajeControllers.add(nuevoTatuajeController);
    chapetaControllers.add(nuevoChapetaController);
    pesonacerControllers.add(nuevoPesoNacerController);

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(top: 3 * fem,left: 4 * fem),
      child: Row(
        children: [
          Container(
            child: sexo(nuevoSexoController),
          ),
          Container(
            child: tatuaje(nuevoTatuajeController),
          ),
          Container(
            child: chapeta(nuevoChapetaController),
          ),
          Container(
            child: peso_nacer(nuevoPesoNacerController),
          )
        ],
      ),
    );
  }

  Container sexo(TextEditingController controller){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(left: 1 * fem),
      width: 15 * fem,
      height: 8 * fem,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,color: Color.fromRGBO(229, 203, 206, 1),size: 2.5 * fem),
          hintText: 'M o H',
          hintStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
          labelText: 'SEXO',
          labelStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container tatuaje(TextEditingController controller){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(left: 1 * fem),
      width: 20 * fem,
      height: 8 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 2 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,color: Color.fromRGBO(229, 203, 206, 1),size: 2.5 * fem),
          hintText: 'Ingrese numero',
          hintStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
          labelText: 'TATUAJE',
          labelStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container chapeta(TextEditingController controller){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(left: 1 * fem),
      width: 20 * fem,
      height: 8 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 2 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,color: Color.fromRGBO(229, 203, 206, 1),size: 2.5 * fem),
          hintText: 'Ingrese numero',
          hintStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
          labelText: 'CHAPETA',
          labelStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container peso_nacer(TextEditingController controller){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      margin: EdgeInsets.only(left: 1 * fem),
      width: 20 * fem,
      height: 8 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 2 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,color: Color.fromRGBO(229, 203, 206, 1),size: 2.5 * fem),
          hintText: 'Ingrese peso',
          hintStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
          labelText: 'PESO',
          labelStyle: TextStyle(
            fontSize: 2 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  bool todosCamposLlenos() {
    // Validar si todos los campos anteriores están llenos
    for (int i = 0; i < sexoControllers.length; i++) {
      if (sexoControllers[i].text.isEmpty ||
          tatuajeControllers[i].text.isEmpty ||
          chapetaControllers[i].text.isEmpty ||
          pesonacerControllers[i].text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _guardarDatos(int id) async {
    int idconvertir = id;
    String? idhembra = idconvertir.toString();

    if (contenedores.length < miniCampos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Aún no se ha alcanzado el número mínimo de campos'),
        ),
      );
      if (!todosCamposLlenos()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Complete todos los campos antes de agregar uno nuevo'),
          ),
        );
        return;
      }
      return;
    }
    if (contenedores.length > maxCampos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ha alcanzado el límite máximo de campos'),
        ),
      );
      if (!todosCamposLlenos()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Complete todos los campos antes de agregar uno nuevo'),
          ),
        );
        return;
      }
      return;
    }

    CollectionReference criasCollection = _firestore.collection('crias');
    CollectionReference vacunacrias = _firestore.collection('vacunascrias');
    contadorColeccion++;

    for (int i = 0; i < sexoControllers.length; i++) {

        Map<String, dynamic> primerElemento = datos[0];

        if (primerElemento.containsKey('camadas')) {
          // convertirlo a entero
          int numero = primerElemento['camadas'] as int;
          int numerocamadas = ++numero;  //incremento al numero
          print('camadas son estas');
          print ('numero inicial $numero');
          print ('numero incrementado $numerocamadas');
          String nuevaColeccion = 'camada$numerocamadas';
          print('esta es la fecha parto');

          await criasCollection
              .doc(idhembra.toString())
              .collection(nuevaColeccion)
              .add({
            'sexo': sexoControllers[i].text,
            'tatuaje': tatuajeControllers[i].text,
            'chapeta': chapetaControllers[i].text,
            'peso_nacer': pesonacerControllers[i].text,
            'vacunas': 0,
            'fecha_nacimiento': fecha

          });

          await FirebaseFirestore.instance
              .collection('registro_hembra')
              .doc(ids[0])  // Usa el primer ID de la lista como ejemplo
              .update({
            // Agregar los campos que deseas actualizar y sus nuevos valores
            'camadas': numerocamadas,
            // Agrega más campos según sea necesario
          });

          await Future.delayed(Duration(seconds: 2));
          await vacunacrias.add({
            'sexo': sexoControllers[i].text,
            'tatuaje': tatuajeControllers[i].text,
            'chapeta': chapetaControllers[i].text,
            'peso_nacer': pesonacerControllers[i].text,
            'vacunas': 0,
            'fecha_nacimiento': fecha,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('LAS CRIAS SE GUARDARON CORRECTAMENTE'),
            ),
          );

        } else {
          print("El mapa no contiene la clave 'camadas'");
        }

    }
    //Navigator.of(context).pop();
    print(contadorColeccion);
    setState(() {
      contenedores = [];
      Navigator.pushNamed(context, '/imagen');
    });
  }

}

class imagen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: 140 * fem,
      height: 150 * fem,
      child: Image.asset(
        'img/desktop/PORCI33.gif',
        fit: BoxFit.cover,
      ),
    );
  }
}