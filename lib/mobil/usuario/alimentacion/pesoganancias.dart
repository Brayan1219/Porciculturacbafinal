import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registros.dart';
import 'package:myapp/desktop/usuario/home.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/services/firebase_service.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class pesoganancias_desk extends StatelessWidget {
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
      title: "PORCI/form1",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: regis1(),
    );
  }
}

class regis1 extends StatefulWidget {
  @override
  State<regis1> createState() => _regis1State();
}

class _regis1State extends State<regis1> {
  bool mostrarImagen = false;
  List<dynamic> datos = [];
  late int selectedDato;

  DateTime selectedDate = DateTime.now();
  TextEditingController idparidera = TextEditingController(text: "");
  TextEditingController idhembracontroller = TextEditingController(text: "");
  TextEditingController nombrecontroller = TextEditingController(text: "");
  TextEditingController numerolechones = TextEditingController(text: "");
  TextEditingController kgdiacontroller = TextEditingController(text: "");
  TextEditingController numeroderacionescontroller = TextEditingController(text: "");
  TextEditingController kgtotalsemana = TextEditingController(text: "");
  final TextEditingController _rpartoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedDato = 1212;
    cargarDatos();
  }

  Future<void> cargarDatos() async {
    List<int> dataListHembra = [];
    List<int> dataListMacho = [];
    List<String> dataListCerditos = [];

    // Consultar 'registro_hembra'
    QuerySnapshot snapshotHembra = await FirebaseFirestore.instance.collection('registro_hembra').get();
    snapshotHembra.docs.forEach((doc) {
      dataListHembra.add(doc['id']);
    });

    // Consultar 'registro_macho'
    QuerySnapshot snapshotMacho = await FirebaseFirestore.instance.collection('registro_macho').get();
    snapshotMacho.docs.forEach((doc) {
      dataListMacho.add(doc['id_macho']);
    });

    // Consultar 'lotes'
    QuerySnapshot snapshotLotes = await FirebaseFirestore.instance.collection('lotes').get();

    // Iterar sobre los documentos de 'lotes'
    for (QueryDocumentSnapshot loteDoc in snapshotLotes.docs) {
      // Obtener la referencia de la subcolección 'cerditos_lotes' para cada lote
      CollectionReference cerditosLotesRef = loteDoc.reference.collection('cerditoslote');

      // Consultar la subcolección 'cerditos_lotes'
      QuerySnapshot cerditosLotesSnapshot = await cerditosLotesRef.get();

      // Iterar sobre los documentos de 'cerditos_lotes'
      cerditosLotesSnapshot.docs.forEach((cerditoDoc) {
        dataListCerditos.add(cerditoDoc['chapeta'].toString());
      });
    }

    // Actualizar el estado
    setState(() {
      datos = [...dataListHembra, ...dataListMacho, ...dataListCerditos];
    });

    // Imprimir los datos
    print("Datos: $datos");
  }


  Future<void> _selectDate6(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _rpartoController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }




  @override
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
                              'Principal / Hembra',
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
                left:  30*fem,
                top:  40*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  80*fem,
                    height:  110*fem,
                    child:
                    SingleChildScrollView(
                      child: Container(
                        decoration:  BoxDecoration (
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Container(
                                    width:  70*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: id_hembra(),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:  39*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: fecha_rparto(),
                                  ),
                                  Container(
                                    width:  28*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 14, top: 10),
                                    child: kgdia(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:  39*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: fecha_rparto(),
                                  ),
                                  Container(
                                    width:  28*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 14, top: 10),
                                    child: kgdia(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:  39*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: fecha_rparto(),
                                  ),
                                  Container(
                                    width:  28*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 14, top: 10),
                                    child: kgdia(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:  39*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: fecha_rparto(),
                                  ),
                                  Container(
                                    width:  28*fem,
                                    height:  13*fem,
                                    margin: EdgeInsets.only(left: 14, top: 10),
                                    child: kgdia(),
                                  )
                                ],
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    int id_paridera = int.parse(idparidera.text);
                                    String nombre = nombrecontroller.text;
                                    DateTime fecha_parto = DateTime.parse(_rpartoController.text);
                                    int numero_lechones = int.parse(numerolechones.text);
                                    double? kg_dia = double.parse(kgdiacontroller.text);
                                    int numero_raciones = int.parse(numeroderacionescontroller.text);
                                    double? total_semana = double.parse(kgtotalsemana.text);


                                    addRegistroAreapartos(
                                        fecha_parto,
                                        selectedDato!,
                                        id_paridera,
                                        kg_dia,
                                        nombre,
                                        numero_lechones,
                                        numero_raciones,
                                        total_semana
                                    );


                                    Navigator.pushNamed(context, '/imagen');
                                  });

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

  Container id_hembra(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: DropdownButtonFormField<dynamic>( // Cambia el tipo a dynamic
        value: selectedDato,
        onChanged: (value) {
          setState(() {
            selectedDato = value!;
          });
        },
        items: datos.map<DropdownMenuItem<dynamic>>((dynamic value) { // Cambia el tipo a dynamic
          return DropdownMenuItem<dynamic>( // Cambia el tipo a dynamic
            value: value,
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: 3 * fem,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.paste, color: Color.fromRGBO(229, 203, 206, 1), size: 6 * fem),
          labelText: 'ID',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value) {
          if (value == null) {
            return 'Por favor seleccione una opción';
          }
          return null;
        },
      ),
    );
  }

  Container fecha_rparto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _rpartoController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "REAL PARTO",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate6(context),
      ),
    );
  }

  Container kgdia(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller:kgdiacontroller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.paste,color: Color.fromRGBO(229, 203, 206, 1),size: 6 * fem),
          hintText: 'KG DIA',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'KG DIA',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
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

