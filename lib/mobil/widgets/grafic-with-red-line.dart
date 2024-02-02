import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 112;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // graficwithredlineZYj (59:786)
        width: double.infinity,
        height: 92*fem,
        child: Image.asset(
          'assets/mobil/images/grafic-with-red-line-Uk7.png',
          fit: BoxFit.contain,
        ),
      ),
          );
  }
}