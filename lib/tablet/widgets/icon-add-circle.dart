import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 122;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iconaddcircleWXq (79:169)
        width: double.infinity,
        height: 122.17*fem,
        child: Image.asset(
          'assets/tablet/images/icon-add-circle-VjV.png',
          width: 122*fem,
          height: 122.17*fem,
        ),
      ),
          );
  }
}