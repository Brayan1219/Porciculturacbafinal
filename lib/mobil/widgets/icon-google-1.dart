import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 17.0599060059;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // icongoogle15EF (31:190)
        width: double.infinity,
        height: 17.41*fem,
        child: Image.asset(
          'assets/mobil/images/icon-google-1-ZbM.png',
          width: 17.06*fem,
          height: 17.41*fem,
        ),
      ),
          );
  }
}