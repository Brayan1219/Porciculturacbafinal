import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../services/firebase_service.dart';
import '../usuario/home.dart';

class sesiontablet extends StatelessWidget {
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
      title: "SESION",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: sesion(),
    );
  }
}

class sesion extends StatefulWidget {
  const sesion({super.key});

  @override
  State<sesion> createState() => _sesionState();
}

class _sesionState extends State<sesion> {
  bool _isObscure = true;

  TextEditingController correocontroller = TextEditingController(text: "");
  TextEditingController contrasenacontroller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      checkLoginStatus();
    });
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
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0*fem, 59*fem, 0*fem, 0*fem),
            width: double.infinity,
            decoration: BoxDecoration (
              image: DecorationImage (
                fit: BoxFit.cover,
                image: AssetImage (
                  'img/tablet/fondoinicio.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 3*fem),
                  width: 544*fem,
                  height: 174*fem,
                  child: Image.asset(
                    'img/tablet/letra1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1150*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0*fem,
                        top: 450*fem,
                        child: Align(
                          child: SizedBox(
                            width: 960*fem,
                            height: 754*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle3GP9 (36:56)
                        left: 107*fem,
                        top: 150*fem,
                        child: Align(
                          child: SizedBox(
                            width: 748*fem,
                            height: 867*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(30*fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle4z4F (31:174)
                        left: 157.7508544922*fem,
                        top: 284.9998779297*fem,
                        child: Align(
                          child: SizedBox(
                            width: 905.3*fem,
                            height: 1018.66*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle5uBD (31:175)
                        left: 0*fem,
                        top: 285.0001220703*fem,
                        child: Align(
                          child: SizedBox(
                            width: 937.23*fem,
                            height: 1044.94*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // cerdito3Dhh (31:153)
                        left: 273*fem,
                        top: 0*fem,
                        child: Align(
                          child: SizedBox(
                            width: 415*fem,
                            height: 285*fem,
                            child: Image.asset(
                              'img/tablet/cerdito.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 228*fem,
                        top: 387*fem,
                        child: Align(
                          child: SizedBox(
                            width: 503*fem,
                            height: 97*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(15*fem),
                               // color: Color(0xfff2f0f0),
                              ),
                              child: usuario(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle21fZh (36:58)
                        left: 229*fem,
                        top: 583*fem,
                        child: Align(
                          child: SizedBox(
                            width: 503*fem,
                            height: 97*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(15*fem),
                               // color: Color(0xfff2f0f0),
                              ),
                              child: contra(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 280*fem,
                        top: 800*fem,
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
                                MaterialPageRoute(builder: (context) => hometablet()),
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
                              print('Error al iniciar sesión: $error');
                            }
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(46*fem, 14*fem, 54.5*fem, 17.02*fem),
                            width: 400*fem,
                            height: 100*fem,
                            decoration: BoxDecoration (
                              color: Color(0xfff5c7c6),
                              borderRadius: BorderRadius.circular(50*fem),
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
                                    margin: EdgeInsets.fromLTRB(30*fem, 0*fem, 10.7*fem, 0*fem),
                                    width: 25*fem,
                                    height: 26*fem,
                                    child: Image.asset(
                                      'img/mobil/icono.png',
                                      width: 25*fem,
                                      height: 26*fem,
                                    ),
                                  ),
                                ),
                                Container(
                                  // registrarmeCJT (2:21)
                                  margin: EdgeInsets.fromLTRB(15*fem, 1.02*fem, 0*fem, 0*fem),
                                  child: Text(
                                    'INICIAR SESION',
                                    textAlign: TextAlign.center,
                                    style: SafeGoogleFont (
                                      'Alice',
                                      fontSize: 20*ffem,
                                      fontWeight: FontWeight.w400,
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
                      Positioned(
                        left: 280 * fem,
                        top: 1080 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 230 * fem,
                            height: 28 * fem,
                            child: Text(
                              'NO TENGO UNA CUENTA !',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Almarai',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1 * fem,
                                color: Color(0xffea96a0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 540 * fem,
                        top: 1080 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 206 * fem,
                            height: 28 * fem,
                            child: Text(
                              'NOSOTROS',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Almarai',
                                fontSize: 17 * ffem,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1 * fem,
                                color: Color(0xffea96a0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0*fem,
                        top: 1115*fem,
                        child: Align(
                          child: SizedBox(
                            width: 962*fem,
                            height: 2*fem,
                            child: Container(
                              decoration: BoxDecoration (
                                color: Color(0xb2eebbbb),
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
          hintText: 'Ingrese Gmail',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'CORREO',
          labelStyle: TextStyle(
            fontSize: 15,
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
          hintText: 'Ingrese Contraseña',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'CONTRASEÑA',
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }),
          labelStyle: TextStyle(
            fontSize: 15,
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
