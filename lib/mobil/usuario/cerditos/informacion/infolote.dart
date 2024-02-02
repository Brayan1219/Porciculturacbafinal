import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/utils.dart';

class infolote_mobil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return lote_mobil();
  }
}

class lote_mobil extends StatefulWidget {
  @override
  State<lote_mobil> createState() => _lote_mobilState();
}

class _lote_mobilState extends State<lote_mobil> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> datos = {};
  bool lote = false;
  bool lote2 = false;

  bool botondetalles = false;
  bool imagen = false;
  bool infoindivi = false;
  bool manejopantallas = false;
  String precebo = '';
  String levante = '';
  String vendido = '';
  String idlotes = '';

  List<dynamic> datos2 = [];
  List<String> listaFallecidos = [];
  Map<String, DateTime> fechasFallecimiento = {};
  Map<String, String> hora = {};

  @override
  void initState() {
    super.initState();
    consultarLotes();
    consultarlote2(idlotes);
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

  void consultarlote2(clave) {
    datos2.clear();
    FirebaseFirestore.instance
        .collection('lotes')
        .where('dato_lote', isEqualTo: clave)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datos2 = [];
      });

      if (querySnapshot.size > 0) {
        // Verificar si hay resultados antes de intentar acceder a los datos
        var primerDocumento = querySnapshot.docs.first;

        // Obtener la referencia de la subcolección
        var subcoleccionRef =
        primerDocumento.reference.collection('cerditoslote');

        // Obtener los documentos de la subcolección
        subcoleccionRef.get().then((QuerySnapshot subcoleccionSnapshot) {
          setState(() {
            datos2 = subcoleccionSnapshot.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();
          });

          print('Datos de la subcolección:');
          print(datos);
        });
      } else {
        // No se encontraron documentos que coincidan con el filtro
        print('No se encontró ningún lote con dato_lote: $clave');
      }
    }).catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }

  Future<void> fallecidas() async {
    listaFallecidos.clear();
    await FirebaseFirestore.instance
        .collection('fallecidos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          String id = doc['id'].toString();
          listaFallecidos.add(id);
        }
        print('IDs consultados: $listaFallecidos');
      });
    });
  }

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width:  double.infinity,
          height:  844*fem,
          decoration:  BoxDecoration (
            color:  Color(0xffffffff),
          ),
          child:
          Stack(
            children:  [
              Positioned(
                left:  0*fem,
                top:  0*fem,
                child:
                Container(
                  width:  572*fem,
                  height:  319*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        left:  0*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  390*fem,
                            height:  277*fem,
                            child:
                            Image.network(
                              'img/mobil/fondoinicio.png',
                              fit:  BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  0*fem,
                        top:  210*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  102*fem,
                            height:  94*fem,
                            child:
                            Image.network(
                              'img/mobil/circulo.png',
                              width:  102*fem,
                              height:  94*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle6Vbu (31:312)
                        left:  51*fem,
                        top:  225*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  339*fem,
                            height:  68*fem,
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
                        // rectangle7o6o (31:313)
                        left:  339*fem,
                        top:  204*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  233*fem,
                            height:  89*fem,
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
                        // ellipse28Py (31:314)
                        left:  295*fem,
                        top:  131*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  102*fem,
                            height:  94*fem,
                            child:
                            Image.network(
                              'img/mobil/circulo.png',
                              width:  102*fem,
                              height:  94*fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // registrosG79 (59:76)
                        left: 90*fem,
                        top: 18*fem,
                        child: Align(
                          child: SizedBox(
                            width: 230*fem,
                            height: 35*fem,
                            child: Text(
                              'INFORMACION',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Alfa Slab One',
                                fontSize: 26*ffem,
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
                        // informacionkY7 (59:77)
                        left: 114.5*fem,
                        top: 50*fem,
                        child: Align(
                          child: SizedBox(
                            width: 170*fem,
                            height: 19*fem,
                            child: Text(
                              'Lotes',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Jost',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3675*ffem/fem,
                                letterSpacing: 0.4*fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registros()));
                          },
                          borderRadius: BorderRadius.circular(50.0),
                          // Personaliza la forma del botón
                          child: Container(
                            margin: EdgeInsets.only(left: 30,top: 25),
                            width: 25.7 * fem,
                            height: 20.28 * fem,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'img/mobil/flecha.png',                                          width: 42 * fem,
                                height: 22.05 * fem,
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
                top:  101*fem,
                child:
                Container(
                  width:  518.38*fem,
                  height:  403.61*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        // rectangle31L2B (31:333)
                        left:  42*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  313*fem,
                            height:  312*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(20*fem),
                                color:  Color(0xfffff3f3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle32e2s (31:370)
                        left:  240*fem,
                        top:  152*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  216.38*fem,
                            height:  247.97*fem,
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
                        // rectangle33MCB (31:371)
                        left:  0*fem,
                        top:  149*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  203.19*fem,
                            height:  254.61*fem,
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
                        left:  74*fem,
                        top:  32*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  249*fem,
                            height:  349*fem,
                            child:
                            Container(
                              decoration:  BoxDecoration (
                                borderRadius:  BorderRadius.circular(20*fem),
                                color:  Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left:  90*fem,
                        top:  45*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                              width:  249*fem,
                              height:  152*fem,
                              child:Row(
                                children: [
                                     InkWell(
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
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 13 * fem),
                                            width: 90 * fem,
                                            height: 70 * fem,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(98, 161, 145, 170),
                                                borderRadius: BorderRadius.circular(5 * fem)),
                                            child: Stack(
                                                children:[
                                                  Center(
                                                    // porkSQo (15:110)
                                                    child: SizedBox(
                                                      width: 60 * fem,
                                                      height: 60 * fem,
                                                      child: Image.asset(
                                                        'img/mobil/lote.png',
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 38 * fem,
                                                    left: 63 * fem,
                                                    child: Container(
                                                      width: 20 * fem,
                                                      height: 20 * fem,
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white70,
                                                        borderRadius: BorderRadius.circular(40),
                                                      ),
                                                      child: Icon(
                                                        Icons.attach_money,
                                                        color: Colors.black,
                                                        size: 10 * fem,
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              'LOTES VENDIDOS',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont (
                                                'Jost',
                                                fontSize: 7*ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3675*ffem/fem,
                                                letterSpacing: 0.4*fem,
                                                color: Colors.grey,
                                              ),
                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                     InkWell(
                                      onTap: () {
                                        setState(() {
                                          vendido = '';
                                          levante ='';
                                          precebo = '';
                                          botondetalles = false;
                                          opcion();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(left: 10 * fem),
                                            width: 90 * fem,
                                            height: 70 * fem,
                                            decoration: BoxDecoration(
                                                color: Color.fromRGBO(98, 161, 145, 170),
                                                borderRadius:
                                                BorderRadius.circular(5 * fem)),
                                            child: Center(
                                              // porkSQo (15:110)
                                              child: SizedBox(
                                                width: 60 * fem,
                                                height: 60 * fem,
                                                child: Image.asset(
                                                  'img/mobil/lote.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),

                                    ),
                                          Container(
                                              child: Text(
                                                ' VER LOTES EXISTENTES',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont (
                                                  'Jost',
                                                  fontSize: 7*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3675*ffem/fem,
                                                  letterSpacing: 0.4*fem,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                          )
                                        ],
                                      ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                      Positioned(
                          left: 79 * fem,
                          top: 140 * fem,
                          child: Container(
                            margin: EdgeInsets.only(top: 5 * fem),
                            width:  237*fem,
                            height:  80*fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Color(0xfffbf4f4),
                            ),
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
              ),
              Positioned(
                // fonfinCyV (31:382)
                left:  0*fem,
                top:  724*fem,
                child:
                Container(
                  width:  394*fem,
                  height:  176*fem,
                  child:
                  Stack(
                    children:  [
                      Positioned(
                        left:  0*fem,
                        top:  45*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  390*fem,
                            height:  75*fem,
                            child:
                            Image.network(
                              'img/mobil/circulo.png',
                              fit:  BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle36t5d (31:377)
                        left:  50*fem,
                        top:  28*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  340*fem,
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
                        // ellipse3Mju (31:376)
                        left:  0*fem,
                        top:  0*fem,
                        child:
                        Align(
                          child:
                          SizedBox(
                            width:  100*fem,
                            height:  88*fem,
                            child:
                            Image.network(
                              'img/mobil/circulo.png',
                              width:  100*fem,
                              height:  88*fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             Positioned(
                left:  54*fem,
                top:  340*fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width:  289*fem,
                    height:  452*fem,
                    child:
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                        color: Color(0xfffbf4f4),
                      ),
                      child:  Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: 4 * ffem, right: 4 * ffem, top: 14 * ffem),
                            width: 110 * fem,
                            height: 25 * fem,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5 * fem),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                '- $idlotes -',
                                style: GoogleFonts.holtwoodOneSc(
                                  fontSize: 12.5 * fem,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 1.3,
                                  color: Colors.black38,
                                ),
                              ),
                            ),
                            // Llama al método informacion() aquí
                          ),
                          Container(
                            width:  290*fem,
                            height:  382*fem,
                           // color: Colors.pink,
                            child: ListView.builder(
                              itemCount: datos2.length,
                              itemBuilder: (context, index) {
                                final data = datos2[index];
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5* fem, left: 8* fem),
                                          width: 60 * fem,
                                          height: 25 * fem,
                                          child: GestureDetector(
                                            onTap: () {
                                              showEditDialog(idlotes, data);
                                            },
                                            child: Column(
                                              children: [
                                                Text('CHAPETA ',
                                                  style: SafeGoogleFont(
                                                    'Alfa Slab One',
                                                    fontSize: 9 * fem,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.4 * fem,
                                                    color: Colors.teal,
                                                  ),),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 1* fem),
                                                  child: Text('${data['chapeta'] ?? 0}',
                                                    style: GoogleFonts.kameron(
                                                      fontSize: 8.7 * fem,
                                                      fontWeight: FontWeight.bold,
                                                      fontStyle: FontStyle.italic,
                                                      letterSpacing: 0,
                                                      color: Colors.black38,
                                                    ),),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 3*fem),
                                          width: 50 * fem,
                                          height: 6 * fem,
                                          child: Center(
                                            child: TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: 'SEXO',
                                              ),
                                              controller: TextEditingController(text: '${data['sexo']}'),
                                              style: GoogleFonts.kameron(
                                                fontSize: 9.7 * fem,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                letterSpacing: 0,
                                                color: Colors.black26,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 3*fem),
                                          width: 50 * fem,
                                          height: 6 * fem,
                                          child: Center(
                                            child: TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: 'PESO ACTUAL',
                                              ),
                                              controller: TextEditingController(text: '${data['pesoactual'] ?? 0}'),
                                              style: GoogleFonts.kameron(
                                                fontSize: 9.7 * fem,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                letterSpacing: 0,
                                                color: Colors.black26,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 3*fem),
                                          width: 50 * fem,
                                          height: 6 * fem,
                                          child: Center(
                                            child: TextField(
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                labelText: 'FECHA NACIMIENTO',
                                              ),
                                              controller: TextEditingController(text: '${data['fecha_nacimiento']}'),
                                              style: GoogleFonts.kameron(
                                                fontSize: 9.7 * fem,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                                letterSpacing: 0,
                                                color: Colors.black26,
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (datos2.any((subcoleccion) =>
                                        subcoleccion['estadolote'] == precebo ||
                                            subcoleccion['estadolote'] == levante))
                                          InkWell(
                                            onTap: () {
                                              estadomuerto(data['tatuaje']);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(left: 3 * fem),
                                              child: Icon(
                                                Icons.dangerous,
                                                size: 9 * fem,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
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
                width: 200 * fem,
                height: 70 * fem,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        pasarlote(clave);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 0 * fem),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10* fem),
                            color: Colors.white),
                        child: Container(
                          width: 75 * fem,
                          height: 80 * fem,
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
                      width: 10 * fem,
                      height: 1.5 * fem,
                      color: Color(0xff62a191),
                    ),
                    Container(
                      width: 110 * fem,
                      height: 80 * fem,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                            child: Container(
                              width: 110 * fem,
                              height: 33 * fem,
                              child: ListTile(
                                title: Container(
                                    margin: EdgeInsets.only(
                                        top: 11 * fem,
                                        left: 1 * fem,
                                        bottom: 1.5 * fem),
                                    child: Text(
                                      ' NUMERO DE LOTE',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Jost',
                                        fontSize: 7.5*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.3675*ffem/fem,
                                        letterSpacing: 0.4*fem,
                                        color: Colors.black,
                                      ),
                                    ),),
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
                            EdgeInsets.only(top: 18.5 * fem, left: 21 * fem),
                            width: 50 * fem,
                            height: 12 * fem,
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
                                    manejopantallas = true;
                                    consultarlote2(clave);
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'DETALLES',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont(
                                      '',
                                      fontSize: 8 * ffem,
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
          margin: EdgeInsets.only(top: 35 * fem),
          child: Text(
            '¡ AUN NO HAY LOTES !',
            textAlign: TextAlign.center,
            style: SafeGoogleFont(
              '',
              fontSize: 10 * ffem,
              fontWeight: FontWeight.w800,
              color: Colors.black26,
            ),
          ),
        ));
      }
    });

    return containers;
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

  Future showEditDialog(String idlote, Map<String, dynamic> data) async {
    TextEditingController chapetaController = TextEditingController(text: '${data['chapeta'] ?? 0}');

    if (datos2.any((subcoleccion) =>
    subcoleccion['estadolote'] == precebo ||
        subcoleccion['estadolote'] == levante)) {
      // Si el lote está en estado precebo o levante, muestra opciones específicas
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Editar Chapeta'),
            content: TextField(
              controller: chapetaController,
              decoration: InputDecoration(
                labelText: 'Nuevo valor de Chapeta',
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    var tatuaje = data['tatuaje'];
                    print('Valor de tatuaje: $tatuaje');
                    print('dato de idlote en actualizar $idlote');
                    data['chapeta'] = chapetaController.text;
                    updateChapetaInFirestore(idlote, tatuaje, chapetaController.text, data);
                  });

                  // Cierra el diálogo
                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Cierra el diálogo sin hacer cambios
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
            ],
          );
        },
      );
    }
  }



  Future<void> updateChapetaInFirestore(String idLote, String tatuaje, String newChapeta, Map<String, dynamic> data) async {
    try {
      // Busca el documento con el campo único (ej. 'otroCampo')
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('lotes')
          .where('dato_lote', isEqualTo: idLote)
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
            .where('tatuaje', isEqualTo: tatuaje)
            .get();

        if (subcoleccionSnapshot.docs.isNotEmpty) {
          // Obtiene el ID del documento en la subcolección
          String subdocumentoId = subcoleccionSnapshot.docs[0].id;
          print(subdocumentoId);

          // Obtiene la referencia del documento en la subcolección y actualiza la chapeta en Firestore
          DocumentReference documentReference = FirebaseFirestore.instance
              .collection('lotes')
              .doc(documentoId)
              .collection('cerditoslote')
              .doc(subdocumentoId);

          await documentReference.update({'chapeta': newChapeta});

          print('Chapeta actualizada en Firestore');
        } else {
          print('No se encontró ningún documento en la subcolección con tatuaje: $tatuaje');
        }
      } else {
        print('No se encontró ningún documento con el campo único: $idLote');
      }
    } catch (error) {
      print('Error al actualizar la chapeta en Firestore: $error');
    }
  }

  estadomuerto(String id) async {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print('esta es fallecidos $listaFallecidos');

    await fallecidas();
    bool estaEnFallecidos = listaFallecidos.contains(id.toString().trim());
    print(estaEnFallecidos);

    if (!estaEnFallecidos) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        // El usuario no puede cerrar la alerta tocando fuera de ella
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cambiar estado'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      '¿Estás seguro de cambiar el estado del animal a fallecido?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                  guardarestado_fa(id);
                },
                child: Text('Sí'),

              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Cierra la alerta sin hacer cambios
                },
              ),
            ],
          );
        },
      );
    }
  }

  guardarestado_fa(String id){
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    TextEditingController descriptionController = TextEditingController();

    showDialog<void>(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Agregar Evento'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Fecha'),
                  subtitle: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null && pickedDate != selectedDate)
                      setState(() {
                        selectedDate = pickedDate;
                      });
                  },
                ),
                ListTile(
                  title: Text('Hora'),
                  subtitle: Text('${selectedTime.format(context)}'),
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (pickedTime != null && pickedTime != selectedTime)
                      setState(() {
                        selectedTime = pickedTime;
                      });
                  },
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Descripción'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  // Cancelar
                  Navigator.of(context).pop();
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  // Guardar evento en la colección
                  guardar_fallecidos( id, selectedDate, selectedTime, descriptionController.text,);
                  Navigator.of(context).pop();
                },
                child: Text('Guardar'),
              ),
            ],
          );
        });
  }

  guardar_fallecidos(String id, DateTime fecha, TimeOfDay hora, String descripcion) {
    // Convertir TimeOfDay a String en formato HH:mm
    String horaString = "${hora.hour}:${hora.minute}";

    // Acceder a la colección "fallecidos" y agregar un nuevo documento con la información proporcionada
    FirebaseFirestore.instance.collection('fallecidos').add({
      'id': id,
      'fecha': fecha,
      'hora': horaString,  // Almacenar la hora como cadena de texto
      'descripcion': descripcion,
      'seccion': 'lote'
    }).then((value) {
      print('Evento guardado en la colección "fallecidos" con ID: ${value.id}');
    }).catchError((error) {
      print('Error al guardar el evento: $error');
      // Manejar el error según tus necesidades
    });
  }

}