import 'package:flutter/material.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registro1.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/services/firebase_service.dart';
import 'package:myapp/utils.dart';

class registro2_desk extends StatelessWidget {
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
      home: regis2(),
    );
  }
}

class regis2 extends StatefulWidget {
  @override
  State<regis2> createState() => _regis2State();
}

class _regis2State extends State<regis2> {


  // ------------------------------fecha----------------------------
  DateTime selectedDate = DateTime.now();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _date2Controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Actualiza el controlador con la fecha seleccionada
      _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
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
      // Actualiza el controlador con la fecha seleccionada
      _date2Controller.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }
  // ------------------------------fecha fin----------------------------

  TextEditingController idcontroller = TextEditingController(text: "");
  TextEditingController nombrecontroller = TextEditingController(text: "");
  TextEditingController pesocontroller = TextEditingController(text: "");

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
                              'Principal / Macho',
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
                              child: id_macho(),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15,top: 10),
                              child: nombre(),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:  33*fem,
                                    height:  10*fem,
                                    margin: EdgeInsets.only(left: 10, right: 14, top: 10),
                                    child: fecha_ingreso(),
                                  ),
                                  Container(
                                    width:  32.5*fem,
                                    height:  10*fem,
                                    margin: EdgeInsets.only(left: 14, top: 10),
                                    child: fecha_nacimiento(),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                              child: peso(),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              child: TextButton(
                                onPressed: () async {
                                  String idString = idcontroller.text;
                                  int id_macho = int.parse(idString);
                                  String nombre = nombrecontroller.text;
                                  DateTime fechaIngreso = DateTime.parse(_dateController.text);
                                  DateTime fechaNacimiento = DateTime.parse(_date2Controller.text);
                                  String peso = pesocontroller.text;


                                  addRegistroMacho(id_macho, nombre, fechaIngreso, fechaNacimiento, peso, context);
                                  await Future.delayed(Duration(seconds: 2));

                                  void clearControllers() {
                                    idcontroller.clear();
                                    nombrecontroller.clear();
                                    pesocontroller.clear();
                                    _dateController.clear();
                                    _date2Controller.clear();
                                  }

                                  clearControllers();
                                  Navigator.pushNamed(context, '/imagen');

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

  Container id_macho(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller:idcontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.numbers,color: Color.fromRGBO(229, 203, 206, 1),size: 25),
          hintText: 'Ingrese Id',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'ID MACHO',
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

  Container nombre(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller:nombrecontroller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.paste,color: Color.fromRGBO(229, 203, 206, 1),size: 25),
          hintText: 'Ingrese Nombre',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'NOMBRE',
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

  Container fecha_ingreso() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _dateController, // Usa el controlador aquí
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA INGRESO",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Container fecha_nacimiento() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _date2Controller, // Usa el controlador aquí
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 3 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA NACIMIENTO",
          labelStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
        ),
        onTap: () => _selectDate2(context),
      ),
    );
  }

  Container peso(){
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      height: 13 * fem,
      child: TextFormField(
        controller:pesocontroller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 3 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.monitor_weight_outlined,color: Color.fromRGBO(229, 203, 206, 1),size: 25),
          hintText: 'Ingrese Peso',
          hintStyle: TextStyle(
            fontSize: 3 * fem,
            color: Colors.grey,
          ),
          labelText: 'PESO LLEGADA',
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
