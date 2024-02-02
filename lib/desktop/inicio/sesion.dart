import 'dart:ui';
import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myapp/desktop/inicio/registro.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../services/firebase_service.dart';
import '../../tablet/widgets/notaspc.dart';
import '../usuario/home.dart';
import 'inicio.dart';

class sesion_deskt extends StatelessWidget {
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
      title: "PORCI/SESION",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: sesi(),
    );
  }
}

class sesi extends StatefulWidget {
  const sesi({Key? key}) : super(key: key);

  @override
  State<sesi> createState() => _sesiState();
}

class _sesiState extends State<sesi> {
  Color _buttonColor = Color(0xfff5c7c6);
  bool _isObscure = true;

  TextEditingController correocontroller = TextEditingController(text: "");
  TextEditingController contrasenacontroller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => homes()),
      );
    }
  }


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
                          width: 142 * fem,
                          height: 141 * fem,
                          //color: Colors.purple,
                          margin: EdgeInsets.only(left: 1 * fem),
                          child: Bienvenida2(),
                        ),
                        Container(
                          width: 147 * fem,
                          height: 145 * fem,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15 * fem),
                                child: SizedBox(
                                  width: 80 * fem,
                                  height: 30 * fem,
                                  child: Image.asset(
                                    'img/desktop/letainicio.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100 * fem,
                                height: 70 * fem,
                                margin: EdgeInsets.only(top: 4 * fem),
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
                                      margin: EdgeInsets.only(top: 2 * fem),
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
                                          top: 12 * fem, right: 67 * fem),
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
                                      margin: EdgeInsets.only(top: 2 * fem),
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
                                      margin: EdgeInsets.only(top: 13 * fem),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: TextButton(
                                          onPressed: () async {
                                            try {
                                              await Auth().signInWithEmailAndPassword(
                                                email: correocontroller.text,
                                                password: contrasenacontroller.text,
                                              );

                                              // Guardar el estado de la sesión en SharedPreferences
                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                              prefs.setBool('isLogged', true);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        home_desk()),
                                              );
                                              Flushbar(
                                                title: 'Bienvenido',
                                                message: 'inicio de sesion exitoso ',
                                                duration: Duration(seconds: 3),
                                              )..show(context);
                                            } catch (error) {
                                              Flushbar(
                                                title: 'Error',
                                                message: 'Error al iniciar sesion ',
                                                duration: Duration(seconds: 3),
                                              )..show(context);

                                              print(
                                                  'Error al iniciar sesión: $error');
                                              // Puedes mostrar un mensaje de error al usuario si lo deseas
                                            }
                                          },
                                          child: Container(
                                            width: 50 * fem,
                                            height: 10 * fem,
                                            decoration: BoxDecoration(
                                              color: _buttonColor,
                                              borderRadius:
                                              BorderRadius.circular(20 * fem),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x3f000000),
                                                  offset: Offset(0 * fem, 4 * fem),
                                                  blurRadius: 2 * fem,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
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
                                                    'INICIAR SESION',
                                                    textAlign: TextAlign.center,
                                                    style: SafeGoogleFont(
                                                      'Alice',
                                                      fontSize: 3 * ffem,
                                                      fontWeight: FontWeight.w400,
                                                      letterSpacing: 0.26 * fem,
                                                      color: Color(0xff000000),
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
                                            _buttonColor = Color(0xfff5c7c6);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100 * fem,
                                height: 5 * fem,
                                margin: EdgeInsets.only(top: 10 * fem),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 17 * fem),
                                      child: SizedBox(
                                        width: 32 * fem,
                                        height: 5 * fem,
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        regis_desk()));
                                          },
                                          child: Text(
                                            'NO TENGO UNA CUENTA !',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Almarai',
                                              fontSize: 2 * ffem,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.3 * fem,
                                              color: Color(0xffea96a0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15 * fem),
                                      child: SizedBox(
                                        width: 17 * fem,
                                        height: 5 * fem,
                                        child: InkWell(
                                          onTap: () {
                                             Navigator.push(
                                                 context,
                                                 MaterialPageRoute(
                                                   builder: (context) => inicio_desktop()));
                                          },
                                          child: Text(
                                            'INICIO',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Almarai',
                                              fontSize: 2 * ffem,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.3 * fem,
                                              color: Color(0xffea96a0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0 * fem),
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
          hintText: ' ',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'INGRESE CONTRASENA',
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
}