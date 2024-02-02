import 'package:flutter/material.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class regis_crias extends StatelessWidget {
  final int idhembra;
  regis_crias(this.idhembra);

  @override
  Widget build(BuildContext context) {
    return crias(idhembra);
  }
}

class crias extends StatefulWidget {
  final int idhembra;
  crias(this.idhembra);
  @override
  State<crias> createState() => _criasState(idhembra);
}

class _criasState extends State<crias> {
  final int idhembra;
  _criasState(this.idhembra);

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


  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarcerdita();
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


  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // registro16AT (31:308)
          width: double.infinity,
          height: 844 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // materialappb7D (31:309)
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  width: 572 * fem,
                  height: 319 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle5tMD (31:310)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 390 * fem,
                            height: 277 * fem,
                            child: Image.network(
                              'img/mobil/fondoinicio.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse1Q4f (31:311)
                        left: 0 * fem,
                        top: 225 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 102 * fem,
                            height: 94 * fem,
                            child: Image.network(
                              'img/mobil/circulo.png',
                              width: 102 * fem,
                              height: 94 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse28Py (31:314)
                        left: 290 * fem,
                        top: 225 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 102 * fem,
                            height: 94 * fem,
                            child: Image.network(
                              'img/mobil/circulo.png',
                              width: 102 * fem,
                              height: 94 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // registrosG79 (59:76)
                        left: 105 * fem,
                        top: 18 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 190 * fem,
                            height: 35 * fem,
                            child: Text(
                              'REGISTRO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Alfa Slab One',
                                fontSize: 32 * ffem,
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
                        // informacionkY7 (59:77)
                        left: 114.5 * fem,
                        top: 55 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 170 * fem,
                            height: 19 * fem,
                            child: Text(
                              'LECHONES',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Jost',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.3675 * ffem / fem,
                                letterSpacing: 0.4 * fem,
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
                            margin: EdgeInsets.only(left: 30, top: 25),
                            width: 25.7 * fem,
                            height: 20.28 * fem,
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
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 1 * fem,
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 5 * fem),
                  )),
              Positioned(
                // fontregisCgf (31:373)
                left: 1 * fem,
                top: 125 * fem,
                child: Container(
                  width: 518.38 * fem,
                  height: 803.61 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle31L2B (31:333)
                        left: 33 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 325 * fem,
                            height: 307 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: Color(0xfffff3f3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle32e2s (31:370)
                        left: 240 * fem,
                        top: 152 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 216.38 * fem,
                            height: 247.97 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle33MCB (31:371)
                        left: 0 * fem,
                        top: 149 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 203.19 * fem,
                            height: 254.61 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                               color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle34tC7 (31:372)
                        left: 50 * fem,
                        top: 32 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 289 * fem,
                            height: 349 * fem,
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
                // fonfinCyV (31:382)
                left: 0 * fem,
                top: 724 * fem,
                child: Container(
                  width: 394 * fem,
                  height: 176 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle35MLb (31:375)
                        left: 0 * fem,
                        top: 45 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 390 * fem,
                            height: 75 * fem,
                            child: Image.network(
                              'img/mobil/circulo.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle36t5d (31:377)
                        left: 50 * fem,
                        top: 28 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 340 * fem,
                            height: 60 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse3Mju (31:376)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 100 * fem,
                            height: 88 * fem,
                            child: Image.network(
                              'img/mobil/circulo.png',
                              width: 100 * fem,
                              height: 88 * fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // cerdito7QiB (135:2)
                left: 70 * fem,
                top: 83 * fem,
                child: Align(
                  child: SizedBox(
                    width: 201 * fem,
                    height: 100 * fem,
                    child: Image.network(
                      'img/mobil/cerdito1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 270 * fem,
                  top: 135 * fem,
                  child:
                  Tooltip(
                    message: 'Agregar Campo',
                    child: Container(
                      width: 38 * fem,
                      height: 33 * fem,
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
                  )
              ),
              Positioned(
                left: 50 * fem,
                top: 182 * fem,
                child:
                Align(
                  child:
                  SizedBox(
                    width: 290.38 * fem,
                    height: 847.97 * fem,
                    child:
                    SingleChildScrollView(
                      child: Container(
                        decoration:  BoxDecoration (
                        //   color:  Color(0xffd9d9d9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 270 * fem,
                              height: 400 * fem,
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
                                    fontSize: 8.5 * fem,
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
                                  width: 170*fem,
                                  height: 40*fem,
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
                                          margin: EdgeInsets.fromLTRB(42*fem, 0*fem, 3*fem, 0*fem),
                                          width: 13*fem,
                                          height: 14*fem,
                                          child: Image.asset(
                                            'img/mobil/iconopersona.png',
                                            width: 13*fem,
                                            height: 14*fem,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // registrarmeCJT (2:21)
                                        margin: EdgeInsets.fromLTRB(2*fem, 1*fem, 0*fem, 0*fem),
                                        child: Text(
                                          'REGISTRAR',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Alice',
                                            fontSize: 11*ffem,
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
      margin: EdgeInsets.only(left: 3 * fem),
      width: 60 * fem,
      height: 30 * fem,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'M o H',
          hintStyle: TextStyle(
            fontSize: 7* fem,
            color: Colors.grey,
          ),
          labelText: 'SEXO',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      margin: EdgeInsets.only(left: 3 * fem),
      width: 60 * fem,
      height: 30 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Ingrese numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'TATUAJE',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      margin: EdgeInsets.only(left: 3 * fem),
      width: 60 * fem,
      height: 30 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Ingrese numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'CHAPETA',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      margin: EdgeInsets.only(left: 3 * fem),
      width: 60 * fem,
      height: 30 * fem,
      child: TextFormField(
        controller:controller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Ingrese peso',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'PESO',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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

        await criasCollection
            .doc(idhembra.toString())
            .collection(nuevaColeccion)
            .add({
          'sexo': sexoControllers[i].text,
          'tatuaje': tatuajeControllers[i].text,
          'chapeta': chapetaControllers[i].text,
          'peso_nacer': pesonacerControllers[i].text,
          // Agregar más campos según sea necesario
        });

        await FirebaseFirestore.instance
            .collection('registro_hembra')
            .doc(ids[0])  // Usa el primer ID de la lista como ejemplo
            .update({
          // Agregar los campos que deseas actualizar y sus nuevos valores
          'camadas': numerocamadas,
          // Agrega más campos según sea necesario
        });

      } else {
        print("El mapa no contiene la clave 'camadas'");
      }

    }
    //Navigator.of(context).pop();
    print(contadorColeccion);
    setState(() {
      contenedores = []; // Limpiar los contenedores existentes
    });
  }

  imagen(){
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