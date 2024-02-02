import 'dart:ui';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/desktop/inicio/sesion.dart';
import 'package:myapp/utils.dart';
import '../../services/firebase_service.dart';
import '../../tablet/widgets/notaspc.dart';
import '../usuario/home.dart';
import 'inicio.dart';

class regis_desk extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(
    Color.fromRGBO(229, 203, 206, 1).value,
    <int, Color>{
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
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/REGISTRO",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: regi(),
    );
  }
}

class regi extends StatefulWidget {
  const regi({Key? key}) : super(key: key);

  @override
  State<regi> createState() => _regiState();
}

class _regiState extends State<regi> {
  Color _buttonColor = Color(0xfff5c7c6);
  bool _isObscure = true;
  bool _isObscure2 = true;

  TextEditingController correocontroller = TextEditingController(text: "");
  TextEditingController contrasenacontroller = TextEditingController(text: "");
  TextEditingController contrasenaConfirmarController =
  TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: 1280 * fem,
        height: 832 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          gradient: LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xffffffff), Color(0xffffe6e6)],
            stops: <double>[0, 1],
            // stops:  [0, 1],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Align(
                child: SizedBox(
                  width: 350 * fem,
                  height: 150 * fem,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 5 * fem,
                        right: 30 * fem,
                        left: 30 * fem,
                        bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5 * fem),
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 147 * fem,
                          height: 140 * fem,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 12 * fem, bottom: 3 * fem),
                                child: SizedBox(
                                  width: 85 * fem,
                                  height: 25 * fem,
                                  child: Image.asset(
                                    'img/desktop/texto2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 150 * fem,
                                height: 100 * fem,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 95 * fem,
                                      height: 80 * fem,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 2 * fem,
                                              right: 75 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 15 * fem,
                                              height: 3 * fem,
                                              child: Text(
                                                'CORREO',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Alice',
                                                  fontSize: 3 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.4 * fem,
                                                  color: Color(0x63000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 1.3 * fem,
                                              top: 2 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 90 * fem,
                                              height: 7 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      2 * fem),
                                                  //  color: Color(0x82d9d9d9),
                                                ),
                                                child: usuario(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 66 * fem,
                                              top: 8 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 25 * fem,
                                              height: 3 * fem,
                                              child: Text(
                                                'CONTRASEÑA',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Alice',
                                                  fontSize: 3 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.4 * fem,
                                                  color: Color(0x63000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 1.3 * fem,
                                              top: 2 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 90 * fem,
                                              height: 7 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      2 * fem),
                                                  //  color: Color(0x82d9d9d9),
                                                ),
                                                child: contra(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 50 * fem,
                                              top: 8 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 40 * fem,
                                              height: 3 * fem,
                                              child: Text(
                                                'REPETIR CONTRASEÑA',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Alice',
                                                  fontSize: 3 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  letterSpacing: 0.4 * fem,
                                                  color: Color(0x63000000),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 1.3 * fem,
                                              top: 2 * fem,
                                            ),
                                            child: SizedBox(
                                              width: 90 * fem,
                                              height: 7 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      2 * fem),
                                                  //  color: Color(0x82d9d9d9),
                                                ),
                                                child: contra2(),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 3 * fem,
                                              top: 8 * fem,
                                            ),
                                            child: MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: TextButton(
                                                onPressed: () async {
                                                  if (contrasenacontroller.text == contrasenaConfirmarController.text) {
                                                    try {
                                                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                        email: correocontroller.text,
                                                        password: contrasenacontroller.text,
                                                      );
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => sesion_deskt()),
                                                      );
                                                      Flushbar(
                                                        title: 'exito',
                                                        message: 'Registro exitoso ',
                                                        duration: Duration(seconds: 3),
                                                      )..show(context);
                                                    } catch (e) {
                                                      Flushbar(
                                                        title: 'Error',
                                                        message: 'Ocurrió un error durante el registro: $e',
                                                        duration: Duration(seconds: 3),
                                                      )..show(context);
                                                    }
                                                  } else {
                                                    Flushbar(
                                                      title: 'Error',
                                                      message: 'Las contraseñas no coinciden',
                                                      duration: Duration(seconds: 3),
                                                    )..show(context);
                                                  }
                                                },
                                                child: Container(
                                                  width: 50 * fem,
                                                  height: 10 * fem,
                                                  decoration: BoxDecoration(
                                                    color: _buttonColor,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        20 * fem),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                        Color(0x3f000000),
                                                        offset: Offset(
                                                            0 * fem, 4 * fem),
                                                        blurRadius: 2 * fem,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 5 * fem,
                                                            right: 3.5 * fem),
                                                        width: 3 * fem,
                                                        height: 3 * fem,
                                                        child: Image.asset(
                                                          'img/mobil/icono.png',
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'REGISTRARME',
                                                          textAlign:
                                                          TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Alice',
                                                            fontSize: 3 * ffem,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            letterSpacing:
                                                            0.26 * fem,
                                                            color: Color(
                                                                0xff000000),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: (_) {
                                                setState(() {
                                                  _buttonColor = Color(
                                                      0xa062a191); // Cambia este color al deseado
                                                });
                                              },
                                              onExit: (_) {
                                                setState(() {
                                                  _buttonColor =
                                                      Color(0xfff5c7c6);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 15 * fem,
                                      margin: EdgeInsets.only(top: 2 * fem),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 8 * fem,
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 4 * fem,
                                                      left: 35 * fem),
                                                  child: SizedBox(
                                                    width: 35 * fem,
                                                    height: 10 * fem,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    sesion_deskt()));
                                                      },
                                                      child: Text(
                                                        'YA TENGO UNA CUENTA !',
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Almarai',
                                                          fontSize: 2 * ffem,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          letterSpacing:
                                                          0.3 * fem,
                                                          color:
                                                          Color(0xffea96a0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 4 * fem,
                                                      left: 7 * fem),
                                                  child: SizedBox(
                                                    width: 25 * fem,
                                                    height: 10 * fem,
                                                    child: InkWell(
                                                      onTap: () {
                                                         Navigator.push(
                                                           context,
                                                          MaterialPageRoute(
                                                              builder: (context) => inicio_desktop()));
                                                      },
                                                      child: Text(
                                                        'INICIO',
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: SafeGoogleFont(
                                                          'Almarai',
                                                          fontSize: 2 * ffem,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          letterSpacing:
                                                          0.3 * fem,
                                                          color:
                                                          Color(0xffea96a0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin:
                                            EdgeInsets.only(top: 1 * fem),
                                            child: SizedBox(
                                              width: 150 * fem,
                                              height: 0.4 * fem,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0x54eebbbb),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 142 * fem,
                          height: 141 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          //color: Colors.black12,
                          child: Bienvenida(),
                        )
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

  Container usuario() {
    return Container(
      height: 60,
      child: TextFormField(
        controller: correocontroller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,
              color: Color.fromRGBO(229, 203, 206, 1), size: 25),
          hintText: '',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'INGRESE CORREO',
          labelStyle: TextStyle(
            fontSize: 10,
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

  Container contra() {
    return Container(
      height: 60,
      child: TextFormField(
        controller: contrasenacontroller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        obscureText: _isObscure,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.password_sharp,color: Color.fromRGBO(150, 137, 166, 50),size: 35),
          hintText: '',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'INGRESE CONTRASEÑA',
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }),
          labelStyle: TextStyle(
            fontSize: 10,
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

  Container contra2() {
    return Container(
      height: 60,
      child: TextFormField(
        controller: contrasenaConfirmarController,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        obscureText: _isObscure2,
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.password_sharp,color: Color.fromRGBO(150, 137, 166, 50),size: 35),
          hintText: '',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'INGRESE NUEVAMENTE CONTRASEÑA',
          suffixIcon: IconButton(
              icon: Icon(_isObscure2 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure2 = !_isObscure2;
                });
              }),
          labelStyle: TextStyle(
            fontSize: 10,
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
}