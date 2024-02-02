import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../utils.dart';
import 'package:myapp/services/firebase_service.dart';
import 'dart:ui';

class registro3_desk extends StatelessWidget {
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
  final int idhembra;
  registro3_desk(this.idhembra);

  @override
  Widget build(BuildContext context) {
    print("id cerdita regis3: $idhembra");
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
      home: regi3(idhembra),
    );
  }
}

class Item {
  final int idMacho;
  final String nombre;

  Item(this.idMacho, this.nombre);
}

class regi3 extends StatefulWidget {
  final int idhembra;

  regi3(this.idhembra);

  @override
  State<regi3> createState() => _regi3State(idhembra);
}

class _regi3State extends State<regi3> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final int idhembra;
  _regi3State(this.idhembra);

  Item? selectedItem;
  List<Item> itemsList = [];
  List<dynamic> datos = [];

  void fetchData() async {
    FirebaseServicenombre firebaseService = FirebaseServicenombre();
    List<Item> fetchedItems = await firebaseService.fetchItems();

    setState(() {
      itemsList = fetchedItems;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    consultarcerdita();

    vivoscontroller.addListener(calcularSuma);
    muertoscontroller.addListener(calcularSuma);
    momiascontroller.addListener(calcularSuma);
  }

  void consultarcerdita() {
    FirebaseFirestore.instance
        .collection('registro_hembra')
        .where('id', isEqualTo: widget.idhembra)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        int camadasActuales = querySnapshot.docs[0]['camadas'];
        int nuevoValor = camadasActuales + 1;

        npartocontroller.text = nuevoValor.toString();
      });
    })
        .catchError((error) {
      print("Error al consultar Firestore: $error");
    });
  }


  bool pagina1 = true;
  bool pagina2 = false;

  DateTime selectedDate = DateTime.now();
  TextEditingController npartocontroller = TextEditingController(text: "");
  TextEditingController machocontroller = TextEditingController(text: "");
  final TextEditingController _desteteController = TextEditingController();
  final TextEditingController _montaController = TextEditingController();
  final TextEditingController _celoController = TextEditingController();
  final TextEditingController _partoController = TextEditingController();
  final TextEditingController _parideraController = TextEditingController();
  final TextEditingController _rpartoController = TextEditingController();
  TextEditingController horapartocontroller = TextEditingController(text: "");
  TextEditingController totalnacidoscontroller = TextEditingController(text: "");
  TextEditingController vivoscontroller = TextEditingController(text: "");
  TextEditingController muertoscontroller = TextEditingController(text: "");
  TextEditingController momiascontroller = TextEditingController(text: "");
  final TextEditingController _fechacriadesteteController = TextEditingController();
  TextEditingController criadestetecontroller = TextEditingController(text: "");

  void _calculateDate(String enteredDate, TextEditingController controller) {
    if (enteredDate.isNotEmpty) {
      DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(enteredDate);
      DateTime calculatedDate = selectedDate.add(Duration(days: 21));
      controller.text = DateFormat('yyyy-MM-dd').format(calculatedDate);

      print(selectedDate);
    } else {
      controller.text = '';
    }
  }

  void _calculateDate2(String enteredDate, TextEditingController controller) {
    if (enteredDate.isNotEmpty) {
      DateTime selectedDate1 = DateFormat('yyyy-MM-dd').parse(enteredDate);
      DateTime calculatedDate2 = selectedDate1.add(Duration(days: 115));
      controller.text = DateFormat('yyyy-MM-dd').format(calculatedDate2);
    } else {
      controller.text = '';
    }
  }

  void _calculateDate3(String enteredDate, TextEditingController controller) {
    if (enteredDate.isNotEmpty) {
      DateTime selectedDate2 = DateFormat('yyyy-MM-dd').parse(enteredDate);
      DateTime calculatedDate3 = selectedDate2.add(Duration(days: 110));
      controller.text = DateFormat('yyyy-MM-dd').format(calculatedDate3);
    } else {
      controller.text = '';
    }
  }

  void _calculateDate4(String enteredDate, TextEditingController controller) {
    if (enteredDate.isNotEmpty) {
      DateTime selectedDate1 = DateFormat('yyyy-MM-dd').parse(enteredDate);
      DateTime calculatedDate2 = selectedDate1.add(Duration(days: 137));
      controller.text = DateFormat('yyyy-MM-dd').format(calculatedDate2);
    } else {
      controller.text = '';
    }
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _desteteController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _montaController.text = selectedDate;
      _calculateDate(selectedDate, _celoController);
    }
    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _montaController.text = selectedDate;
      _calculateDate2(selectedDate, _partoController);
    }
    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _montaController.text = selectedDate;
      _calculateDate2(selectedDate, _rpartoController);
    }
    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _montaController.text = selectedDate;
      _calculateDate3(selectedDate, _parideraController);
    }
    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _montaController.text = selectedDate;
      _calculateDate4(selectedDate, _fechacriadesteteController);
    }

  }

  Future<void> _selectDate3(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String selectedDate = "${pickedDate.toLocal()}".split(' ')[0];
      _celoController.text = selectedDate;
    }
  }

  Future<void> _selectDate4(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _partoController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  Future<void> _selectDate5(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _parideraController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
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

  Future<void> _selectDate7(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _fechacriadesteteController.text =
      "${pickedDate.toLocal()}".split(' ')[0];
    }
  }


  @override
  void dispose() {
    // Limpia los controladores y los listeners al cerrar el widget
    vivoscontroller.dispose();
    muertoscontroller.dispose();
    momiascontroller.dispose();
    totalnacidoscontroller.dispose();
    super.dispose();
  }

  void calcularSuma() {
    try {
      double num1 = double.parse(vivoscontroller.text);
      double num2 = double.parse(muertoscontroller.text);
      double num3 = double.parse(momiascontroller.text);

      double suma = num1 + num2 + num3;

      totalnacidoscontroller.text = suma.toString();
    } catch (e) {
      totalnacidoscontroller.text = 'Error';
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
          // registro16AT (31:308)
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
                              'Hoja / Vida',
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
                      Container(
                        margin: EdgeInsets.only(left:  10*fem,
                          top:  0*fem,),
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
                      Container(
                        margin: EdgeInsets.only(left:  5*fem,
                          top:  40*fem,),
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
                      Container(
                        margin: EdgeInsets.only(left:  20*fem,
                          top:  10*fem,),
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
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:  40*fem,
                  top:  20*fem,),
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
              Container(
                margin: EdgeInsets.only( left:  30*fem,
                  top:  40*fem,),
                child:
                Container(
                    width:  80*fem,
                    height:  110*fem,
                    child:cambiospantalla()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container num_parto(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller: npartocontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.numbers,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'PARTO',
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

  Container macho() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * MediaQuery.of(context).textScaleFactor,
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Item>(
          isExpanded: true,
          hint: Text(
            'Seleccione un nombre',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
            ),
          ),
          value: selectedItem,
          onChanged: (Item? newValue) {
            setState(() {
              selectedItem = newValue;
              machocontroller.text='${newValue?.idMacho}';
              print('ID seleccionado: ${newValue?.idMacho}');
            });
          },
          items: itemsList.map<DropdownMenuItem<Item>>((Item item) {
            return DropdownMenuItem<Item>(
              value: item,
              child: Text(
                item.nombre,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Container fecha_destete() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _desteteController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA DESTETE",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Container fecha_monta() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _montaController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA MONTA",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate2(context),
      ),
    );
  }

  Container celo() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _celoController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA CELO",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate3(context),
      ),
    );
  }

  Container fecha_parto() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _partoController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA PARTO",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate4(context),
      ),
    );
  }

  Container fecha_paridera() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _parideraController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem,fontWeight: FontWeight.bold),
          labelText: "INGRESO PARIDERA",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate5(context),
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

  Container num_hora() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller: horapartocontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.more_time_outlined,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Horas',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'DURACION PARTO',
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

  Container total_nacidos() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller: totalnacidoscontroller,
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
          labelText: 'TOTAL NACIDOS',
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

  Container nacidos_vivos() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller: vivoscontroller,
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
        controller: muertoscontroller,
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
        controller: momiascontroller,
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
        controller: _fechacriadesteteController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA DESTETE CRIAS",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate7(context),
      ),
    );
  }

  Container crias_destetadas() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller: criadestetecontroller,
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
        child: Column(
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
            Container(
              margin: EdgeInsets.only(top: 5 * fem),
              child: Container(
                child: TextButton(
                  onPressed: () async {

                    int id_parto = int.parse(npartocontroller.text) ;
                    int id_macho = int.parse(machocontroller.text) ;
                    DateTime fecha_monta = DateTime.parse(_montaController.text) ;
                    DateTime fecha_destete = DateTime.parse(_desteteController.text);
                    DateTime fecha_celo = DateTime.parse(_celoController.text);
                    DateTime fecha_parto = DateTime.parse(_partoController.text);
                    DateTime ingreso_paridera = DateTime.parse(_parideraController.text);
                    DateTime real_parto = DateTime.parse(_rpartoController.text);
                    String duracion_parto = horapartocontroller.text ;
                    int total_nacidos = int.parse(totalnacidoscontroller.text);
                    int nacidos_vivos = int.parse(vivoscontroller.text);
                    int nacidos_muertos = int.parse(muertoscontroller.text);
                    int momias = int.parse(momiascontroller.text);
                    DateTime fecha_destetecrias = DateTime.parse(_fechacriadesteteController.text);
                    int destetados = int.parse(criadestetecontroller.text);
                    int id_hembra=idhembra;

                    await addRegistroHojadevida(
                      id_hembra,
                      id_parto,
                      id_macho,
                      fecha_monta,
                      fecha_destete,
                      fecha_celo,
                      fecha_parto,
                      ingreso_paridera,
                      real_parto,
                      duracion_parto,
                      total_nacidos,
                      nacidos_vivos,
                      nacidos_muertos,
                      momias,
                      fecha_destetecrias,
                      destetados,context
                    );
                    await Future.delayed(Duration(seconds: 3));
                    print("exitooo");
                    Navigator.pushNamed(context, '/imagen');
                    //Navigator.of(context).pop();

                  },
                  style: TextButton.styleFrom(
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
            ),
          ],
        ),
      ),
    );
  }

  cambiospantalla(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Stack(
      children: [
        if (pagina1 == true)
          Container(child: form1()),
        if (pagina2)
          Container(child: form2()),
      ],
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