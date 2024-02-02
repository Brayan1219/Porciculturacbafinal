import 'package:flutter/material.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registro1.dart';
import 'package:myapp/mobil/usuario/cerditos/registros/registros.dart';
import 'package:myapp/tablet/usuario/cerditos/registros/registros.dart';
import '../../../../utils.dart';

class registro3_tablet extends StatelessWidget {
  final int idhembra;

  registro3_tablet(this.idhembra);

  @override
  Widget build(BuildContext context) {
    return regi3_tablet(idhembra);
  }
}

class regi3_tablet extends StatefulWidget {
  final int idhembra;

  regi3_tablet(this.idhembra);

  @override
  State<regi3_tablet> createState() => _regi3_tabletState(idhembra);
}

class _regi3_tabletState extends State<regi3_tablet> {
  final int idhembra;

  _regi3_tabletState(this.idhembra);

  DateTime selectedDate = DateTime.now();
  TextEditingController npartocontroller = TextEditingController(text: "");
  TextEditingController machocontroller = TextEditingController(text: "");
  TextEditingController _desteteController = TextEditingController(text: "");
  TextEditingController _montaController = TextEditingController(text: "");
  TextEditingController _celoController = TextEditingController(text: "");
  TextEditingController _partoController = TextEditingController(text: "");
  TextEditingController _parideraController = TextEditingController(text: "");
  TextEditingController _rpartoController = TextEditingController(text: "");
  TextEditingController horapartocontroller = TextEditingController(text: "");
  TextEditingController totalnacidoscontroller =
  TextEditingController(text: "");
  TextEditingController vivoscontroller = TextEditingController(text: "");
  TextEditingController muertoscontroller = TextEditingController(text: "");
  TextEditingController momiascontroller = TextEditingController(text: "");
  TextEditingController _fechacriadesteteController =
  TextEditingController(text: "");
  TextEditingController criadestetecontroller = TextEditingController(text: "");

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
      // Actualiza el controlador con la fecha seleccionada
      _montaController.text = "${pickedDate.toLocal()}".split(' ')[0];
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
      // Actualiza el controlador con la fecha seleccionada
      _celoController.text = "${pickedDate.toLocal()}".split(' ')[0];
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
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 560 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  width: 572 * fem,
                  height: 319 * fem,
                  child: Stack(
                    children: [
                      Positioned(
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
                              'Individual / Hembra',
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
                                    builder: (context) => registros_tablet()));
                          },
                          borderRadius: BorderRadius.circular(50.0),
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
                left: 0 * fem,
                top: 125 * fem,
                child: Container(
                  width: 518.38 * fem,
                  height: 403.61 * fem,
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
                        left: 74 * fem,
                        top: 32 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 249 * fem,
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
                left: 88 * fem,
                top: 72 * fem,
                child: Align(
                  child: SizedBox(
                    width: 221 * fem,
                    height: 120 * fem,
                    child: Image.network(
                      'img/mobil/cerdito1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 35 * fem,
                  top: 230 * fem,
                  child: Align(
                      child: SizedBox(
                        width: 320 * fem,
                        height: 562 * fem,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            form1(),
                            form2(),
                          ],
                        ),
                      ))
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

    return Container(
      height: 60,
      child: TextFormField(
        controller: npartocontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'PARTO',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: machocontroller,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Nombre',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'Macho',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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

  Container fecha_destete() {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    return Container(
      child: TextFormField(
        readOnly: true,
        controller: _desteteController,
        decoration: InputDecoration(
          hintText: 'Ingrese fecha',
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA DESTETE",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA MONTA",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA CELO",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA PARTO",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "INGRESO PARIDERA",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "REAL PARTO",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: horapartocontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Horas',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'DURACION PARTO',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: totalnacidoscontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'TOTAL NACIDOS',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: vivoscontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'NACIDOS VIVOS',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: muertoscontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'NACIDOS MUERTOS',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: momiascontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'MOMIAS',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
          hintStyle: TextStyle(fontSize: 7 * fem, fontWeight: FontWeight.bold),
          labelText: "FECHA DESTETE CRIAS",
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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
      height: 60,
      child: TextFormField(
        controller: criadestetecontroller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 15 * fem,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity_rounded,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: 'Ingrese Numero',
          hintStyle: TextStyle(
            fontSize: 7 * fem,
            color: Colors.grey,
          ),
          labelText: 'DESTETADOS',
          labelStyle: TextStyle(
            fontSize: 10 * fem,
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

    return Positioned(
      // rectangle56xDu (135:3)
      child: Container(
        decoration: BoxDecoration(
          // color:  Color(0xffd9d9d9),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 55 * fem, right: 12 * fem, top: 15 * fem),
                    child: num_parto(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 12 * fem, right: 15 * fem, top: 15 * fem),
                    child: macho(),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: fecha_monta(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 12 * fem, right: 15 * fem, top: 20 * fem),
                    child: fecha_destete(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: celo(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 12 * fem, right: 15 * fem, top: 20 * fem),
                    child: fecha_parto(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: fecha_paridera(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 12 * fem, right: 15 * fem, top: 20 * fem),
                    child: fecha_rparto(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Positioned(
                left: 90 * fem,
                top: 289 * fem,
                child: GestureDetector(
                  onTap: () {
                    form2();
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 10.7 * fem, 0 * fem),
                    child: Image.asset(
                      'img/mobil/iconoflecha.png',
                      width: 50 * fem,
                      height: 50 * fem,
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

    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          // color:  Color(0xffd9d9d9),
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only( left: 55 * fem, right: 12 * fem, top: 15 * fem),
                    child: num_hora(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only( left: 12 * fem, right: 15 * fem, top: 15 * fem),
                    child: total_nacidos(),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only( left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: nacidos_vivos(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only( left: 12 * fem, right: 15 * fem, top: 20 * fem),
                    child: nacidos_muertos(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: momias(),
                  ),
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only( left: 12 * fem, right: 15 * fem, top: 20 * fem),
                    child: fecha_criadestetadas(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 96 * fem,
                    height: 50 * fem,
                    margin: EdgeInsets.only(
                        left: 55 * fem, right: 12 * fem, top: 20 * fem),
                    child: crias_destetadas(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Positioned(
                left: 85 * fem,
                top: 279 * fem,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => registro1()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        46 * fem, 14 * fem, 54.5 * fem, 17.02 * fem),
                    width: 221 * fem,
                    height: 49 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xfff5c7c6),
                      borderRadius: BorderRadius.circular(20 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          // iconopersonaqgs (2:51)
                          opacity: 0.8,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 10.7 * fem, 0 * fem),
                            width: 16.8 * fem,
                            height: 17.98 * fem,
                            child: Image.asset(
                              'img/mobil/iconopersona.png',
                              width: 16.8 * fem,
                              height: 17.98 * fem,
                            ),
                          ),
                        ),
                        Container(
                          // registrarmeCJT (2:21)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 1.02 * fem, 0 * fem, 0 * fem),
                          child: Text(
                            'REGISTRAR',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Alice',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.145 * ffem / fem,
                              letterSpacing: 0.26 * fem,
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
}
