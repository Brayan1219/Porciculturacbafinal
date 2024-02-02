import 'package:flutter/material.dart';

import '../../main.dart';

class SplashDesktop extends StatelessWidget {
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
      title: "SESION",
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: SplashDesktop2(),
    );
  }
}

class SplashDesktop2 extends StatefulWidget {
  const SplashDesktop2({Key? key}) : super(key: key);

  @override
  State<SplashDesktop2> createState() => _SplashDesktop2State();
}

class _SplashDesktop2State extends State<SplashDesktop2> {
  @override
  //Forma para llamar al metodo

  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      //7
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => iniciomain()));
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
        backgroundColor: Colors.teal,
        body: Container(
          width: double.infinity,
          child: Container(
            // splashtablet5J7 (7:16)
            width: double.infinity,
            height: 1440 * fem,
            child: Image.asset(
              'assets/tablet/images/splashtablet.png',
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
