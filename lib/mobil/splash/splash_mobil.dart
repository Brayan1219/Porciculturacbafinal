import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';

class SplashMobil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: "PORCI/SPLASH",
      theme: ThemeData(
      ),
      home: SplashMobil2(),
    );
  }
}


class SplashMobil2 extends StatefulWidget {
  const SplashMobil2({Key? key}) : super(key: key);

  @override
  State<SplashMobil2> createState() => _SplashMobil2State();
}

class _SplashMobil2State extends State<SplashMobil2> {
  @override
  // llamar al metodo
    void initState(){
      Future.delayed(Duration(seconds: 7), (){//6
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => iniciomain())
        );
      });

      super.initState();
    }

  Widget build(BuildContext context) {

    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom (
            padding: EdgeInsets.zero,
          ),
          child: Container(
            width: double.infinity,
            height: 844*fem,
            child: Image.asset(
              'img/mobil/splash.gif',
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
    );
  }
}