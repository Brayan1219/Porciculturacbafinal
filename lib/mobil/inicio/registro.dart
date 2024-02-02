import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/mobil/inicio/sesion.dart';
import 'package:myapp/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registro_mobil extends StatelessWidget {
  const registro_mobil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/REGISTRO",
      theme: ThemeData(
      ),
      home: regis(),
    );
  }
}

class regis extends StatefulWidget {
  const regis({Key? key}) : super(key: key);

  @override
  State<regis> createState() => _regisState();
}

class _regisState extends State<regis> {
  bool _isObscure = true;
  bool _isObscure2 = true;

  TextEditingController correocontroller = TextEditingController(text: "");
  TextEditingController contrasenacontroller = TextEditingController(text: "");
  TextEditingController contrasenaConfirmarController = TextEditingController(
      text: "");

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery
        .of(context)
        .size
        .width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 844*fem,
            decoration: BoxDecoration (
              image: DecorationImage (
                fit: BoxFit.cover,
                image: AssetImage (
                  'img/mobil/fondoinicio.png',
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0*fem,
                  top: 344.9998779297*fem,
                  child: Align(
                    child: SizedBox(
                      width: 309.13*fem,
                      height: 507.58*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 135.9378967285*fem,
                  top: 353*fem,
                  child: Align(
                    child: SizedBox(
                      width: 291.42*fem,
                      height: 481.84*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle3QPh (15:7)
                  left: 33*fem,
                  top: 243*fem,
                  child: Align(
                    child: SizedBox(
                      width: 320*fem,
                      height: 479*fem,
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
                  // letra11iQP (15:9)
                  left: 6*fem,
                  top: 50*fem,
                  child: Align(
                    child: SizedBox(
                      width: 378*fem,
                      height: 138*fem,
                      child: Image.asset(
                        'img/mobil/letraregis.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // cerdito3Rpb (15:54)
                  left: 61*fem,
                  top: 165*fem,
                  child: Align(
                    child: SizedBox(
                      width: 269*fem,
                      height: 156*fem,
                      child: Image.asset(
                        'img/mobil/cerdito1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle51MiF (79:81)
                  left: 0*fem,
                  top: 442*fem,
                  child: Align(
                    child: SizedBox(
                      width: 390*fem,
                      height: 402*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // line3sgb (15:56)
                  left: 0*fem,
                  top: 814*fem,
                  child: Align(
                    child: SizedBox(
                      width: 390*fem,
                      height: 2*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          color: Color(0xb2eebbbb),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle22nYf (31:136)
                  left: 70*fem,
                  top: 365*fem,
                  child: Align(
                    child: SizedBox(
                      width: 247*fem,
                      height: 57*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(15*fem),
                          //color: Color(0xfff2f0f0),
                        ),
                        child: usuario(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle23JG7 (31:137)
                  left: 70*fem,
                  top: 445*fem,
                  child: Align(
                    child: SizedBox(
                      width: 247*fem,
                      height: 57*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(15*fem),
                          //color: Color(0xfff2f0f0),
                        ),
                        child: contra(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // rectangle24cnb (31:138)
                  left: 72*fem,
                  top: 525*fem,
                  child: Align(
                    child: SizedBox(
                      width: 247*fem,
                      height: 57*fem,
                      child: Container(
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(15*fem),
                          //color: Color(0xfff2f0f0),
                        ),
                        child: contra2(),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 616*fem,
                  left: 85 * fem,
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
                            MaterialPageRoute(builder: (context) => sesion_mobil()),
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
                          print('Error de registro: $e');
                        }
                      } else {
                        Flushbar(
                          title: 'Error',
                          message: 'Las contraseñas no coinciden',
                          duration: Duration(seconds: 3),
                        )..show(context);
                        print('Las contraseñas no coinciden');
                      }
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
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
                              'REGISTRARME',
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
                  left: 71*fem,
                  top: 788*fem,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sesion_mobil()));
                    },
                    child: Align(
                      child: SizedBox(
                        width: 132 * fem,
                        height: 12 * fem,
                        child: Text(
                          'YA TENGO UNA CUENTA !',
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
                  left: 234.5*fem,
                  top: 788*fem,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sesion_mobil()));
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
          ),
        ),
      )
    );
  }

  Container usuario(){
    return Container(
      height: 60,
      child: TextFormField(
        controller:correocontroller,
        keyboardType: TextInputType.name,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,color: Color.fromRGBO(229, 203, 206, 1),size: 25),
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
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }

  Container contra(){
    return Container(
      height: 60,
      child: TextFormField(
        controller:contrasenacontroller,
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
              icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off),
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
        validator: (value){
          if(value!.isEmpty){
            return 'Por favor ingrese información';
          }
          return null;
        },
      ),
    );
  }



  Container contra2(){
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
          hintText: 'Ingrese Contraseña',
          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
          labelText: 'CONTRASEÑA',
          suffixIcon: IconButton(
              icon: Icon(
                  _isObscure2 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure2 = !_isObscure2;
                });
              }),
          labelStyle: TextStyle(
            fontSize: 15,
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

}

class Tooltipicono extends StatelessWidget {
  const Tooltipicono({super.key});

  @override
  Widget build(BuildContext context) {
    return const Tooltip(
      message: 'Rh',
      child: Icon(Icons.g_mobiledata),
    );
  }

}