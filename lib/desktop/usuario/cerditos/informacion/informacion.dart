import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/utils.dart';
import '../../home.dart';
import '../registros/registro3.dart';
import 'crias.dart';
import 'hojadevida.dart';
import 'individual.dart';
import 'infomacho.dart';

class informacion_desk extends StatelessWidget {
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
  List<dynamic> datos = [];
  List<dynamic> hoja = [];
  bool botondetalles = false;
  bool botondetallesmacho = false;
  bool imagen = false;
  bool infoindivi= false;
  bool infomacho = false;
  bool infohojavida = false;
  bool infocrias = false;
  bool infolote = false;
  bool informacho = false;
  int valorid = 0;
  List<String> listaFallecidos = [];

  @override
  void initState() {
    super.initState();
    // Llamar a la función para obtener los datos
    consultarcerditas();
    consultarmacho();
    consultarcri();
    fallecidas();
  }

  void consultarcerditas() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena los datos en la lista
        datos.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
      });
    });
  }

  void consultarmacho() {
    FirebaseFirestore.instance
        .collection('registro_macho')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Agrega los datos a la lista sin sobrescribir
        datos.addAll(querySnapshot.docs.map((doc) => doc.data()).toList());
      });
    });
  }

  void consultarcri() {
    hoja.clear();
    FirebaseFirestore.instance
        .collection('hoja_devida')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        // Almacena solo los valores del campo id_hembras en la lista
        hoja.addAll(querySnapshot.docs.map((doc) => doc['id_hembra']).toList());
        print(hoja);
      });
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
                          child: Icon(Icons.arrow_back,color: Color(0xa062a191),size: 6.5 * fem),
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 3.5 * fem, right: 150 * fem),
                      child: Text(
                        'INFORMACION',
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
                child: manejopantallas(id),
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
                    top: 5 * fem,
                    child: Align(
                      child: Container(
                        width: 120 * fem,
                        height: 10 * fem,
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
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8 * fem, top: 1 * fem),
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
                    left: 10 * fem,
                    top: 23 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 120 * fem,
                        height: 125 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            color: Color(0xfffff6f6),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20 * fem,
                          top: 24 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 100 * fem,
                              height: 117 * fem,
                              child: Container(
                                margin: EdgeInsets.only(top: 1 * ffem),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10 * fem),
                                  // color: Colors.blue,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              color:Colors.white,
                            borderRadius: BorderRadius.circular(5 * fem)
                          ),
                          margin: EdgeInsets.only(bottom: 5 * fem),
                          child: Tooltip(
                            message: 'INDIVIDUAL',
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  infoindivi = true;
                                  infomacho = false;
                                  infohojavida = false;
                                  infocrias = false;
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
                      if (botondetalles)
                        Container(
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5 * fem)
                          ),
                          margin: EdgeInsets.only(bottom: 5 * fem),
                          child: Tooltip(
                            message: 'MACHO',
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  infomacho = true;
                                  infoindivi = false;
                                  infohojavida = false;
                                  infocrias = false;
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
                                      'img/mobil/cerdo.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (botondetalles)
                        Container(
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5 * fem)
                          ),
                          margin: EdgeInsets.only(bottom: 5 * fem),
                          child: Tooltip(
                            message: 'HOJA DE VIDA',
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  infomacho = false;
                                  infoindivi = false;
                                  infohojavida = true;
                                  infocrias = false;
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
                                      'img/mobil/hojavida.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (botondetalles)
                        Container(
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5 * fem)
                          ),
                          margin: EdgeInsets.only(bottom: 5 * fem),
                          child: Tooltip(
                            message: 'CRIAS',
                            child: InkWell(
                              onTap: () {
                                  setState(() {
                                    infomacho = false;
                                    infoindivi = false;
                                    infohojavida = false;
                                    infocrias = true;
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
                                      'img/mobil/cerdosbb.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (botondetallesmacho)
                        Container(
                          decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(5 * fem)
                          ),
                          margin: EdgeInsets.only(bottom: 5 * fem),
                          child: Tooltip(
                            message: 'INFORMACION MACHO',
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  informacho =true;
                                  infomacho = false;
                                  infoindivi = false;
                                  infohojavida = false;
                                  infocrias = false;
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
                                      'img/mobil/cerdosbb.png',
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

  List<Widget> generateContainers(List<dynamic> data, double fem) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    List<Widget> containers = [];
    for (var item in data) {
      var id = item['id'] ?? item['id_macho'];
      var esHembra = item.containsKey('id');

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
                      estadomuerto(id);
                    },
                  child:Container(
                    margin: EdgeInsets.only(left: 3* fem),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                        // color: Color.fromRGBO(98, 161, 145, 200)
                        color: Colors.white),
                    child:  Container(
                      width: 25 * fem,
                      height: 20 * fem,
                      //  color: Colors.teal,
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
                        // color: Color.fromRGBO(98, 161, 145, 200)
                        color: Colors.white),
                    child: Column(
                      children: [
                        Container(
                          child: Container(
                            width: 50 * fem,
                            height: 14 * fem,

                          child: ListTile(
                            title: Container(
                                margin: EdgeInsets.only(
                                    left: 5 * fem,
                                    bottom: 0 * fem),
                                child: Text('${item.containsKey('id') ? item['id'] : item['id_macho']}')),
                            // Reemplaza 'nombre' por el nombre del campo que deseas mostrar
                            subtitle: Column(
                              children: [
                                Text('Nombre: ${item['nombre']}',style: TextStyle(fontSize: 2.5 * fem),),
                                Text('Peso: ${item['peso']}',style: TextStyle(fontSize: 2.5 * fem),),
                                // Puedes agregar más campos según sea necesario
                              ],
                            ),
                          ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                              left: 20 * fem,
                            ),
                            // Espacio entre la imagen y el borde del contenedor
                            child: Container(
                              width: 20 * fem,
                              height: 5 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                                color: Color.fromRGBO(98, 161, 145, 200),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    if (esHembra) {
                                      setState(() {
                                        botondetalles = !botondetalles;
                                        valorid = item['id'] ?? item['id_macho'];
                                        print('Nuevo valor de valorid: $valorid');
                                        manejopantallas(id);
                                      });
                                    } else {
                                      setState(() {
                                        botondetallesmacho = !botondetallesmacho;
                                        valorid = item['id'] ?? item['id_macho'];
                                        print('Nuevo valor de valorid: $valorid');
                                        manejopantallas(id);
                                      });
                                    }
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
                            )),
                      ],
                    ),
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

  manejopantallas(int id){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    valorid = id;
    print('ID en manejopantallas: $id');
    print(hoja);

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
        if (infoindivi)
          Container(child: individual_desk(valorid)),
        if (infomacho && hoja.contains(valorid))
          Container(child: infomacho_desk(valorid),
             ),
        if (infohojavida && hoja.contains(valorid))
          Container(child: hojavida_desk(valorid)
     ),
        if(infocrias && hoja.contains(valorid))
          Container(child: crias_desk(valorid),),
        if (infomacho && !hoja.contains(valorid))
          Container(child: AlertDialog(
            title: Text('NO HAY MACHOS'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La hembra escogida no tiene machos asociados'),
                ],
              ),
            ),
          ),
          ),
        if (infohojavida && !hoja.contains(valorid))
          Container(child: AlertDialog(
    title: Text('NO HAY DATOS'),
    content: SingleChildScrollView(
    child: ListBody(
    children: <Widget>[
    Text('La hembra escogida no tiene datos en su hoja de vida'),
    ],
    ),
    ),
    ),
          ),
        if(infocrias && !hoja.contains(valorid))
          Container(child: AlertDialog(
            title: Text('NO HAY CRIAS'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('La hembra escogida no tiene crias asociadas'),
                ],
              ),
            ),
          ),)


        // Otros widgets dentro del Column
      ],
    );
  }

  estadomuerto(int id) async {
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

  guardarestado_fa(int id){
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

  guardar_fallecidos(int id, DateTime fecha, TimeOfDay hora, String descripcion) {
    // Convertir TimeOfDay a String en formato HH:mm
    String horaString = "${hora.hour}:${hora.minute}";

    // Acceder a la colección "fallecidos" y agregar un nuevo documento con la información proporcionada
    FirebaseFirestore.instance.collection('fallecidos').add({
      'id': id,
      'fecha': fecha,
      'hora': horaString,  // Almacenar la hora como cadena de texto
      'descripcion': descripcion,
      'seccion': 'hembra',
    }).then((value) {
      print('Evento guardado en la colección "fallecidos" con ID: ${value.id}');
    }).catchError((error) {
      print('Error al guardar el evento: $error');
      // Manejar el error según tus necesidades
    });
  }

}
