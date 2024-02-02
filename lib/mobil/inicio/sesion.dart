import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/usuario/home.dart';
import 'package:myapp/mobil/inicio/registro.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../../services/firebase_service.dart';


class sesion_mobil extends StatelessWidget {
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0 * fem, 46 * fem, 0 * fem, 0 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'img/mobil/fondoinicio.png',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // letra1DV1 (15:3)
                  margin: EdgeInsets.fromLTRB(24 * fem, 0 * fem, 0 * fem, 15 * fem),
                  width: 374 * fem,
                  height: 136 * fem,
                  child: Image.asset(
                    'img/mobil/letrasesion.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 647 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle3s3m (7:2)
                        left: 0 * fem,
                        top: 148 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 304.66 * fem,
                            height: 490.19 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle4NmD (7:3)
                        left: 135.9379272461 * fem,
                        top: 156 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 291.2 * fem,
                            height: 481.72 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle3J95 (7:6)
                        left: 32 * fem,
                        top: 76 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 326 * fem,
                            height: 449 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30 * fem),
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // cerdito21pB (15:53)
                        left: 66 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 269 * fem,
                            height: 156 * fem,
                            child: Image.asset(
                              'img/mobil/cerdito1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle5299h (79:83)
                        left: 0 * fem,
                        top: 245 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 390 * fem,
                            height: 402 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // line24nT (15:55)
                        left: 0 * fem,
                        top: 616 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 390 * fem,
                            height: 2 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xb2eebbbb),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle20CNs (15:140)
                        left: 72 * fem,
                        top: 209 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 247 * fem,
                            height: 57 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                //color: Color(0xfff2f0f0),
                              ),
                              child: usuario(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // rectangle21hqR (31:135)
                        left: 72 * fem,
                        top: 300 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 247 * fem,
                            height: 57 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15 * fem),
                                //color: Color(0xfff2f0f0),
                              ),
                              child: contra(),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // botonini2Mu (15:142)
                        left: 85 * fem,
                        top: 417 * fem,
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

                              Navigator.push(context, MaterialPageRoute(builder: (context) => homemobil()),
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
                              // Puedes mostrar un mensaje de error al usuario si lo deseas
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                52 * fem, 16 * fem, 47.5 * fem, 16 * fem),
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
                                Container(
                                  // icono5b5 (15:145)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 6.71 * fem, 0.95 * fem),
                                  width: 13.79 * fem,
                                  height: 16.05 * fem,
                                  child: Image.asset(
                                    'img/mobil/icono.png',
                                    width: 13.79 * fem,
                                    height: 16.05 * fem,
                                  ),
                                ),
                                Container(
                                  // iniciarsesionP5y (15:144)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'INICIAR SESION',
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
                      Positioned(
                        left: 70*fem,
                        top: 589*fem,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => registro_mobil()));
                          },
                          child: Align(
                            child: SizedBox(
                              width: 132 * fem,
                              height: 12 * fem,
                              child: Text(
                                'NO TENGO UNA CUENTA !',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.115 * ffem / fem,
                                  letterSpacing: 0.4 * fem,
                                  color: Color(0xffea96a0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 225.5*fem,
                        top: 589*fem,
                        child: GestureDetector(
                          onTap: () {
                           // Navigator.push(
                             //   context,
                             //   MaterialPageRoute(
                               //     builder: (context) => sesion()));
                          },
                          child: Align(
                            child: SizedBox(
                              width: 83 * fem,
                              height: 12 * fem,
                              child: Text(
                                'NOSOTROS',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Almarai',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.115 * ffem / fem,
                                  letterSpacing: 0.4 * fem,
                                  color: Color(0xffea96a0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
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