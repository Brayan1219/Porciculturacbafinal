import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils.dart';

class hojavida_desk extends StatelessWidget {
  final int idhembra;

  hojavida_desk(this.idhembra);

  @override
  Widget build(BuildContext context) {
    print('ID en individual_desk: $idhembra');
    print(idhembra);
    return indiapp(idhembra);
  }
}

class indiapp extends StatefulWidget {
  final int idhembra;

  indiapp(this.idhembra);

  @override
  State<indiapp> createState() => _indiappState(idhembra);
}

class _indiappState extends State<indiapp> {
  final int idhembra;

  _indiappState(this.idhembra);

  List<dynamic> datos = [];

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarcerdita();
  }

  void consultarcerdita() {
    FirebaseFirestore.instance
        .collection('hoja_devida')
        .where('id_hembra', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          // Almacena los datos en la lista
          datos = querySnapshot.docs.map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>).toList();
        });
      } else {
        // Si no se encuentran documentos, puedes manejarlo aquí
        print('No se encontraron documentos para id_hembra: ${widget.idhembra}');
      }
    })
        .catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }


  bool pagina1 = true;
  bool pagina2 = false;

  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // registro16AT (31:308)
          width: 140 * fem,
          height: 150 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: 140 * fem,
                  height: 55 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Align(
                          child: SizedBox(
                            width: 140 * fem,
                            height: 55 * fem,
                            child: Image.asset(
                              'img/mobil/fondoinicio.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0 * fem,
                        top: 45 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 20 * fem,
                            height: 20 * fem,
                            child: Image.asset(
                              'img/mobil/circulo.png',
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8.5 * fem,
                        top: 45.8 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 135 * fem,
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
                        right: 1 * fem,
                        top: 12 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 140 * fem,
                            height: 20 * fem,
                            child: Text(
                              'REGISTRO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Alfa Slab One',
                                fontSize: 9 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 0.2 * ffem / fem,
                                letterSpacing: 1 * fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 18.5 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 140 * fem,
                            height: 19 * fem,
                            child: Text(
                              'Individual / Hembra',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Jost',
                                fontSize: 4 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 0.1 * ffem / fem,
                                letterSpacing: 0.4 * fem,
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
                left: 0 * fem,
                top: 30 * fem,
                child: Container(
                  width: 140 * fem,
                  height: 110.61 * fem,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 10 * fem,
                          top: 0 * fem,
                        ),
                        child: SizedBox(
                          width: 120 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              color: Color(0xfffff3f3),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 5 * fem,
                          top: 40 * fem,
                        ),
                        child: SizedBox(
                          width: 1300 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 20 * fem,
                          top: 10 * fem,
                        ),
                        child: SizedBox(
                          width: 100 * fem,
                          height: 60 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10 * fem),
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 40 * fem,
                  top: 20 * fem,
                ),
                child: SizedBox(
                  width: 60 * fem,
                  height: 30 * fem,
                  child: Image.network(
                    'img/mobil/cerdito1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30 * fem,
                  top: 40 * fem,
                ),
                child: Container(
                    width: 80 * fem,
                    height: 110 * fem,
                    child: cambiospantalla()),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container num_parto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) => TextEditingController(text: '${datos[index]['id_parto']}'),
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'PARTO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Número:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }



  Container macho() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) => TextEditingController(text: '${datos[index]['id_macho']}'),
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'MACHO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Id:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container fecha_destete() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['fecha_destete'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA DESTETE',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha destete:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container fecha_monta() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['fecha_monta'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA MONTA',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha monta:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container celo() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['fecha_celo'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA CELO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha celo:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container fecha_parto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['fecha_parto'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA PARTO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha parto:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container fecha_paridera() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['fecha_destete'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA PARIDERA',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha paridera:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container fecha_rparto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) {
        // Obtener el objeto Timestamp y convertirlo a DateTime
        Timestamp timestamp = datos[index]['real_parto'];
        DateTime dateTime = timestamp.toDate();

        // Formatear la fecha en un formato legible
        String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

        // Crear el controlador con la fecha formateada
        return TextEditingController(text: formattedDate);
      },
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'FECHA REAL PARTO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Fecha real parto:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container num_hora() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) => TextEditingController(text: '${datos[index]['duracion_parto']}'),
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'DURACION PARTO',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Duracion parto:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container total_nacidos() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    List<TextEditingController> controllers = List.generate(
      datos.length,
          (index) => TextEditingController(text: '${datos[index]['total_nacidos']}'),
    );

    return Container(
      height: 13 * fem,
      child: ListView.builder(
        itemCount: datos.length,
        itemBuilder: (context, index) {
          return TextFormField(
            style: TextStyle(
              fontSize: 3 * fem,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: 'TOTAL NACIDOS',
              labelStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              hintText: 'Total nacidos:',
              hintStyle: TextStyle(
                fontSize: 3 * fem,
                color: Colors.grey,
              ),
              prefixIcon: Icon(Icons.numbers,
                  color: Color.fromRGBO(229, 203, 206, 1), size: 25),
            ),
            enabled: false,
            controller: controllers[index],
          );
        },
      ),
    );
  }

  Container nacidos_vivos() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(

        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'NACIDOS VIVOS',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container nacidos_muertos() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(

        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'NACIDOS MUERTOS',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container momias() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(

        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'MOMIAS',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }



  Container fecha_criadestetadas() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,

        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA DESTETE CRIAS",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),

      ),
    );
  }

  Container crias_destetadas() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(

        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'DESTETADOS',
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  form1() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    print("Datos cargados desde Firestore: $datos");

    return Container(
      // rectangle56xDu (135:3)
      child: Container(
        margin: EdgeInsets.only(top: 20 * fem),
        decoration: BoxDecoration(
          // color:  Color(0xffd9d9d9),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                    child: num_parto(),
                  ),
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 14, top: 10),
                    child: macho(),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                    child: fecha_monta(),
                  ),
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 14, top: 10),
                    child: fecha_destete(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                    child: celo(),
                  ),
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 14, top: 10),
                    child: fecha_parto(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                    child: fecha_paridera(),
                  ),
                  Container(
                    width: 33 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.only(left: 14, top: 10),
                    child: fecha_rparto(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Container(
                margin: EdgeInsets.only(left: 15 * fem,),
                child: InkWell(
                  onTap: () {
                    // datos a pasar a form2 ----------------------------------

                    //---------------------------------------------------------

                    setState(() {
                      pagina1 = false;
                      pagina2 = true;
                    });
                  },
                  child: Container(
                    width: 10 * fem,
                    height: 10 * fem,
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10.7 * fem, 0 * fem),
                    child: Image.asset(
                      'img/mobil/iconoflecha.png',
                      width: 10 * fem,
                      height: 10 * fem,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  form2() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 20 * fem),
        decoration: BoxDecoration(
            // color:  Color(0xffd9d9d9),
            ),
        child: ListView.builder(
    itemCount: datos.length,
    itemBuilder: (context, index) {
    final data = datos[index];

    DateTime destetecrias = data['fecha_destetecrias']?.toDate();

    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                child: num_hora(),
              ),
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 14, top: 10),
                child: total_nacidos(),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                child: nacidos_vivos(),
              ),
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 14, top: 10),
                child: nacidos_muertos(),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                child: momias(),
              ),
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 14, top: 10),
                child: fecha_criadestetadas(),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                width: 33 * fem,
                height: 10 * fem,
                margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                child: crias_destetadas(),
              ),
            ],
          ),
        ),
      ],
    );
    },
        ),
        ),

    );
  }

  cambiospantalla() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Stack(
      children: [
        if (pagina1 == true) Container(child: form1()),
        if (pagina2) Container(child: form2()),
      ],
    );
  }
}
