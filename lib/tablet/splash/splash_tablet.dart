import 'package:flutter/material.dart';
import 'package:myapp/tablet/usuario/home.dart';

import '../../main.dart';

class SplashTablet extends StatefulWidget {
  const SplashTablet({Key? key}) : super(key: key);

  @override
  State<SplashTablet> createState() => _SplashTabletState();
}

class _SplashTabletState extends State<SplashTablet> {
  @override

  //Forma para llamar al metodo
  void initState(){
    Future.delayed(Duration(seconds: 0), (){//7
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => iniciomain())
      );
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    double baseWidth = 960;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // splashtablet5J7 (7:16)
          width: double.infinity,
          height: 1440*fem,
          child: Image.asset(
            'img/tablet/splash2.gif',
            fit: BoxFit.cover,
          ),
        ),
      )
    );
  }
}