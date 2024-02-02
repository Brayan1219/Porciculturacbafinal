import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/desktop/usuario/cerditos/registros/registros.dart';
import 'package:myapp/desktop/usuario/home.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/services/firebase_service.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';

class veralimento_desk extends StatelessWidget {
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
  List<String> months = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
  ];
  List<String> producto = [
    'Lactancia', 'Presevo', 'Levante','Engorde'
  ];
  List<int> days = [
    1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
  ];
  String? selectedMonth;
  String? selectedProducto;
  int? selectedDay;
  List<double> dias = [];
  List<double> entra = [];
  List<double> sale = [];
  List<double> total = [];

  TextEditingController mescontroller = TextEditingController(text: "");
  TextEditingController productocontroller = TextEditingController(text: "");
  TextEditingController casacomercialcontroller = TextEditingController(text: "");
  TextEditingController diacontroller = TextEditingController(text: "");
  TextEditingController entradacontroller = TextEditingController(text: "");
  TextEditingController salecontroller = TextEditingController(text: "");
  TextEditingController totalcontroller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();

    // Agregar listeners a los controladores
    entradacontroller.addListener(calculateTotal);
    salecontroller.addListener(calculateTotal);
  }

  void calculateTotal() {
    // Obtener los valores ingresados como textos y convertirlos a números
    double entrada = double.parse(entradacontroller.text);
    double sale = double.parse(salecontroller.text);

    // Realizar la resta y actualizar el controlador totalcontroller
    double total = entrada - sale;
    totalcontroller.text = total.toString();

  }

  void consultarAlimento(String selectedMonth, String selectedProducto) {
    print('Seleccionado: $selectedMonth, Producto: $selectedProducto');

    FirebaseFirestore.instance
        .collection('inventario_alimentacion')
        .where('mes', isEqualTo: selectedMonth)
        .where('producto', isEqualTo: selectedProducto) // Agrega este filtro por producto
        .get()
        .then((QuerySnapshot querySnapshot) {
      // Limpiamos la lista antes de agregar nuevos datos
      setState(() {
        dias.clear();
        entra.clear();
        sale.clear();
        total.clear();
      });

      querySnapshot.docs.forEach((doc) {
        setState(() {
          dias.add(doc['dia']);
          entra.add(doc['entra']);
          sale.add(doc['sale']);
          total.add(doc['saldo']);
        });
      });


    })
        .catchError((error) {
      print('Error en la consulta: $error');
    });
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
                          // color:  Color(0xffd9d9d9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15, top: 50),
                              child: mes(),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                              child: Producto(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Día'),
                                  Text('Entra'),
                                  Text('Sale'),
                                  Text('Total'),
                                ],
                              ),
                            ),
                            // Usamos un ListView.builder para mostrar los datos debajo de cada encabezado
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: dias.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(dias[index].toString()),
                                          Text(entra[index].toString()),
                                          Text(sale[index].toString()),
                                          Text(total[index].toString()),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  );

                                },
                              ),
                            ),
                          ],
                        )
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

  Container mes() {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: Form(
        child: DropdownButtonFormField<String>(
          value: selectedMonth,
          onChanged: (String? newValue) {
            setState(() {
              selectedMonth = newValue;
              consultarAlimento(selectedMonth!,selectedProducto!);
            });
          },
          onSaved: (String? value) {
          },
          items: List.generate(
            months.length,
                (index) => DropdownMenuItem<String>(
              value: months[index],
              child: Text(months[index]),
            ),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Color.fromRGBO(229, 203, 206, 1),
              size: 6 * fem,
            ),
            hintText: 'Selecciona un mes',
            hintStyle: TextStyle(
              fontSize: 3 * fem,
              color: Colors.grey,
            ),
            labelText: 'MES',
            labelStyle: TextStyle(
              fontSize: 3 * fem,
              color: Colors.grey,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor selecciona un mes';
            }
            return null;
          },
        ),
      ),
    );
  }


  Container Producto(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: Form(
        child: DropdownButtonFormField<String>(
          value: selectedProducto, // Asegúrate de declarar e inicializar selectedProducto
          onChanged: (String? newValue) {
            setState(() {
              selectedProducto = newValue;
              consultarAlimento(selectedMonth!, selectedProducto!);
            });
          },
          onSaved: (String? value) {
            // Puedes realizar acciones adicionales al guardar el formulario si es necesario
          },
          items: List.generate(
            producto.length, // Usa la longitud de la lista producto en lugar de months
                (index) => DropdownMenuItem<String>(
              value: producto[index],
              child: Text(producto[index]),
            ),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.calendar_today,
              color: Color.fromRGBO(229, 203, 206, 1),
              size: 6 * fem,
            ),
            hintText: 'Selecciona un producto', // Actualizado para reflejar que estás seleccionando un producto
            hintStyle: TextStyle(
              fontSize: 3 * fem,
              color: Colors.grey,
            ),
            labelText: 'PRODUCTO', // Actualizado para reflejar que estás seleccionando un producto
            labelStyle: TextStyle(
              fontSize: 3 * fem,
              color: Colors.grey,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor selecciona un producto';
            }
            return null;
          },
        ),
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

