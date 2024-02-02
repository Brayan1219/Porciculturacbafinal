import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/utils.dart';
import '../../home.dart';
import 'individual.dart';

class informacion extends StatelessWidget {
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
  List<String> listaFallecidos = [];


  @override
  void initState() {
    super.initState();
    fallecidas();
    consultarcerditas();
  }

  void consultarcerditas() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        datos = querySnapshot.docs.map((doc) => doc.data()).toList();
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


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            // homeKpj (15:10)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 575 * fem,
                  height: 846 * fem,
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
                          height: 242 * fem,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'img/mobil/fondoinicio.png',
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 150),
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
                                                builder: (context) => homemobil()));
                                      },
                                      child: Image.asset(
                                        'img/mobil/flecha.png',
                                        width: 30.7 * fem,
                                        height: 40.05 * fem,
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 1 * fem),
                                  width: 494.5 * fem,
                                  height: 122 * fem,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 25 * fem,
                                        top: 35 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 229 * fem,
                                            height: 35 * fem,
                                            child: Text(
                                              'INFORMACION',
                                              textAlign: TextAlign.center,
                                              style: SafeGoogleFont(
                                                'Alfa Slab One',
                                                fontSize: 25 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.3675 * ffem / fem,
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
                        // rectangle6inK (15:17)
                        left:  51*fem,
                        top:  201*fem,
                        child: Align(
                          child: SizedBox(
                            width: 339 * fem,
                            height: 132 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // ellipse1qQB (15:40)
                        left:  0*fem,
                        top:  202*fem,
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
                        // rectangle6m2w (15:41)
                        left: 51 * fem,
                        top:  201*fem,
                        child: Align(
                          child: SizedBox(
                            width: 339 * fem,
                            height: 68 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                               // color: Color(0xffffffff),
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle8t7Z (15:44)
                        left:  31*fem,
                        top:  84*fem,
                        child: Align(
                          child: SizedBox(
                            width: 324 * fem,
                            height: 32 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                               // color:  Color(0x4cffffff),
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle15Ctw (15:51)
                        left: 25 * fem,
                        top: 145 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 340 * fem,
                            height: 681 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
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
                              left: 43 * fem,
                              top: 148 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 299 * fem,
                                  height: 650 * fem,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10 * ffem),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20 * fem),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            generateContainers(datos, fem),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 43 * fem,
                        top: 90 * fem,
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
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
              height: 90 * fem, // Ajusta la altura según tus necesidades
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20 * fem),
                   // color: Color.fromRGBO(98, 161, 145, 200)
                  color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10 * fem),
                        child: Container(
                          child:InkWell(
                            onTap: () {
                           estadomuerto(id);
                            },
                          child: SizedBox(
                            width: 90 * fem,
                            height: 90 * fem,
                            child: Image.asset(
                              'img/desktop/pork1.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(right: 10 * fem, top: 5 * fem),
                              // Espacio entre el nombre y el borde del contenedor
                              child: ListTile(
                                title: Container(
                                    margin: EdgeInsets.only(left: 20 * fem,top: 5*fem, bottom: 2* fem),
                                    child: Text('${item['id']}')),
                                // Reemplaza 'nombre' por el nombre del campo que deseas mostrar
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Nombre: ${item['nombre']}'),
                                    Text('Peso: ${item['peso']}'),
                                    // Puedes agregar más campos según sea necesario
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 90 *fem,),
                                // Espacio entre la imagen y el borde del contenedor
                                child: Container(
                                  width: 60 * fem,
                                  height: 20 *fem,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20 * fem),
                                    color: Color.fromRGBO(98, 161, 145, 200),
                                  ),
                                  child: Center(
                                    child: Container(
                                      child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => individual(id)));
                                            },
                                        child: Text(
                                          'DETALLES',
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            '',
                                            fontSize: 9 * ffem,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                                )
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
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cambiar estado'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('¿Estás seguro de cambiar el estado del animal a fallecido?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  guardarestado_fa(id);
                },
                child: Text('Sí'),
              ),
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
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
